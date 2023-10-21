#' Get R Package Dependencies
#'
#' This function takes a path to a directory and parses the code from all
#' `.R` and `.Rmd` files, retrieving any detected package dependencies, and
#' optionally outputs a `deps.yaml` and `deps.R` file.
#'
#' @param path path to directory
#' @param write_yaml logical - should `deps.yaml` be created?
#' @param write_r logical - should `deps.R` be created?
#' @param write_to_path logical - should yaml and R files be created in the specified
#'   \code{path} or in current working directory?
#' @param include_versions logical - should package versions and github referenced be included?
#'
#' @return silently returns a data.frame with detected R package details
#' @export
#'
#' @importFrom cli cli_alert cli_alert_warning cat_bullet
#' @importFrom dplyr bind_rows mutate select
#' @importFrom purrr map set_names flatten_chr compact safely map_depth pluck
#' @importFrom remotes install_version install_github
#' @importFrom rlang set_names
#' @importFrom yaml write_yaml
get_package_deps <- function(path = getwd(),
                             write_yaml = TRUE,
                             write_r = TRUE,
                             write_to_path = TRUE,
                             include_versions = TRUE,
                             extra_packages = NULL) {

  # get package dependencies based off supplied directory
  # first detect any R scripts or RMD files
  files <- list.files(
    path = path,
    pattern = "^.*\\.R$|^.*\\.Rmd$",
    full.names = TRUE,
    recursive = TRUE
  )

  if ("deps.R" %in% basename(files)) cli::cli_alert("deps.R already found in path, overwriting..")
  if ("deps.yaml" %in% basename(files)) cli::cli_alert("deps.yaml already found in path, overwriting..")

  files <- files %>% setdiff(c(file.path(path, "deps.yaml"), file.path(path, "deps.R")))

  # loop through files gathering packages using `parse_packages`
  pkg_names <- purrr::map(files, parse_packages) %>%
    purrr::set_names(basename(files)) %>%
    purrr::flatten_chr() %>%
    purrr::compact()

  if (length(pkg_names) == 0) {
    cli::cli_alert_warning("warning: no packages found in specified directory")
    return(invisible(NULL))
  }

  hold <- lapply(pkg_names, purrr::safely(get_package_details, quiet = FALSE)) %>%
    rlang::set_names(pkg_names)

  out <- purrr::map_depth(hold, 1, purrr::pluck, "result") %>%
    purrr::map(function(x) {
      if (length(x) == 0) return(NULL) else return(x)
    }) %>%
    purrr::compact()

  df <- dplyr::bind_rows(out) %>%
    dplyr::mutate(
      Repository = ifelse(is.na(Repository), "Github", Repository),
      install_cmd = ifelse(
        Repository == "CRAN",
        paste0("remotes::install_version(", shQuote(Package), ", version = ", shQuote(Version), ")"),
        paste0("remotes::install_github(", shQuote(paste0(GithubUsername, "/", Package)), ", ref = ", shQuote(GithubSHA1), ")")
      )
    )

  if (write_yaml) {
    yml_path <- file.path(path, "deps.yaml")
    yaml::write_yaml(out, yml_path)
    cli::cat_bullet(
      "Created file `deps.yaml`.",
      bullet = "tick",
      bullet_col = "green"
    )
  }

  if (write_r) {
    txt <- paste0("options(repos = c(CRAN = 'https://packagemanager.rstudio.com/all/latest'))\ninstall.packages('remotes')\n",
                  paste(df$install_cmd, collapse = "\n"), "\n")
    r_path <- file.path(path, "deps.R")
    cat(txt, file = r_path)
    cli::cat_bullet(
      "Created file `deps.R`.",
      bullet = "tick",
      bullet_col = "green"
    )
  }

  out_df <- df %>% dplyr::select(package = Package, src = Repository, version = Version, install_cmd)

  return(invisible(out_df))

}

#' @keywords internal
#' @noRd
get_package_details <- function(pkg_name) {
  pkg_d <- packageDescription(pkg_name)
  is.cran <- !is.null(pkg_d$Repository) && pkg_d$Repository ==
    "CRAN"
  is.github <- !is.null(pkg_d$GithubRepo)
  is.base <- !is.null(pkg_d$Priority) && pkg_d$Priority ==
    "base"
  if (!is.cran & !is.github & !is.base)
    stop("CRAN or GitHub info for ", pkg_name, " not found. Other packages repos are not supported.",
         call. = FALSE)
  if (is.cran)
    return(pkg_d[c("Package", "Repository", "Version")])
  if (is.github)
    return(pkg_d[c("Package", "GithubUsername",
                   "GithubRepo", "GithubRef", "GithubSHA1")])
}

#' Parse R code for package dependencies
#'
#' Parses an R or R Markdown file for the package names that would be required
#' to run the code.
#'
#' @param file file to parse for required package names
#'
#' @return a vector of package names as character strings
#' @export
#' @seealso [get_pkg_deps()], [automagic::automagic()]
#'
#' @details This function uses regular expressions to search through a file
#'   containing R code to find required package names.  It extracts not only
#'   package names denoted by \code{\link[base]{library}} and
#'   \code{\link[base]{require}}, but also packages not attached to the
#'   global namespace, but are still called with \code{\link[base]{::}}
#'   or \code{\link[base]{:::}}.
#'
#'   Because it relies on regular expressions, it assumes all packages adhere to
#'   the valid CRAN package name rules (contain only ASCII letters, numbers, and
#'   dot; have at least two characters and start with a letter and not end it a
#'   dot). Code is also tidying internally, making the code more predictable and
#'   easier to parse (removes comments, adds whitespace around operators, etc).
#'   R Markdown files are also supported by extracting only R code using
#'   \code{\link[knitr]{purl}}.
#'
#' @examples \dontrun{
#' cat('library(ggplot2)\n # library(curl)\n require(leaflet)\n CB::date_print()\n',file='temp.R')
#' parse_packages('temp.R')
#' unlink('temp.R')
#' }
#'
#'
#' @importFrom cli cli_h2 cli_alert_success cli_alert_danger cli_alert_warning cli_alert_info
#' @importFrom purrr map flatten_chr quietly possibly set_names map_depth pluck compact walk
parse_packages <- function(file) {

  cli::cli_h2(paste0("Checking for packages in file: ", file))

  lns <- get_lines(file)

  rgxs <- list(
    library = "(?<=(library\\()|(library\\([\"']{1}))[[:alnum:]|.]+",
    require = "(?<=(require\\()|(require\\([\"']{1}))[[:alnum:]|.]+",
    colon = "[[:alnum:]|.]*(?=:{2,3})"
  )

  found_pkgs <- purrr::map(rgxs, finder, lns = lns) %>%
    unlist() %>%
    unique() %>%
    setdiff(c("", " ")) %>%
    purrr::map(function(x) {
      if (length(x) == 0) return(NULL) else return(x)
    }) %>%
    purrr::flatten_chr()

  test_pkgs <- found_pkgs %>%
    purrr::map(
      purrr::quietly(
        purrr::possibly(
          packageDescription, otherwise = NA_character_)
      )
    ) %>%
    purrr::set_names(found_pkgs)

  # detect any errors or warnings
  warnings <- purrr::map_depth(test_pkgs, 1, purrr::pluck, "warnings") %>%
    purrr::flatten_chr() %>%
    purrr::compact()

  errors <- purrr::map_depth(test_pkgs, 1, purrr::pluck, "errors") %>%
    purrr::flatten_chr() %>%
    purrr::compact()

  pkgs_out <- test_pkgs %>%
    purrr::map(purrr::pluck, "result") %>%
    purrr::map(purrr::pluck, "Package") %>%
    purrr::compact() %>%
    purrr::flatten_chr()

  purrr::walk(pkgs_out, function(x) {
    txt <- paste0("Successfully detected package: ", x)
    cli::cli_alert_success(txt)
  })

  purrr::walk(errors, cli::cli_alert_danger)
  purrr::walk(warnings, cli::cli_alert_warning)
  if (length(pkgs_out) == 0) cli::cli_alert_info(paste0("No new packages detected in file: ", file))

  return(pkgs_out)

}

#' @keywords internal
#' @noRd
finder <- function(rgx, lns) {
  regmatches(lns, gregexpr(rgx, lns, perl = TRUE)) %>% unlist()
}

#' @keywords internal
#' @noRd
#' @importFrom formatR tidy_source
#' @importFrom knitr purl
get_lines <- function(file_name) {

  if (grepl(".Rmd", file_name, fixed = TRUE)) {
    tmp.file <- tempfile()
    knitr::purl(input = file_name,
                output = tmp.file,
                quiet = TRUE)
    file_name <- tmp.file
  }

  lns <- tryCatch(
    formatR::tidy_source(
      file_name,
      comment = FALSE,
      blank = FALSE,
      arrow = TRUE,
      brace.newline = TRUE,
      output = FALSE
    )$text.mask,
    error = function(e) {
      message(paste("Could not parse R code in:",
                    file_name))
      message("   Make sure you are specifying the right file name")
      message("   and check for syntax errors")
      stop("", call. = FALSE)
    }
  )
  if (is.null(lns)) {
    stop("No parsed text available", call. = FALSE)
  }

  return(lns)

}

