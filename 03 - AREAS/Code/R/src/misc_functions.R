deparse_dots <- function(...) {
  vapply(substitute(...()), deparse, NA_character_)
}

#' Split URL
#'
#' Splits URL(s) such that each URL is represented with a character vector split
#' at all single forward slashes and ampersand (forward slashes and ampersands
#' are included in the return object)
#'
#' @param x Input character vector
#' @return If input is one string, then a character vector. If multiple URLs,
#' then a list of character vectors
#' @export
split_url <- function(x) {
  UseMethod("split_url")
}

#' @export
split_url.character <- function(x) {
  if (length(x) == 1) {
    return(strsplit(x, "(?<!/)\\b(?=/)|\\b(?=&)", perl = TRUE)[[1]])
  }
  strsplit(x, "(?<!/)\\b(?=/)|\\b(?=&)", perl = TRUE)
}

#' @export
split_url.default <- function(x) {
  stopifnot(
    is.character(x)
  )
}

#' Wrap URL
#'
#' Wraps long URL with the %P% operator
#'
#' @param x Input URL
#' @param width Width defaulting to 80 (or current width if smaller)
#' @return Text copied to clipboard and printed
#' @export
wrap_url <- function(x, width = NULL) {
  if (is.null(width)) {
    width <- getOption("width", 80)
    if (width > 80) width <- 80
  }
  x <- paste0(split_url(x), collapse = " ")
  x <- strwrap(x, width - 6, indent = 0, exdent = 2)
  x <- gsub("(?<=\\S) (?=(/|&))", "", x, perl = TRUE)
  x <- sub("^(?=\\S)|\\s(?=\\S)", '"', x, perl = TRUE)
  x <- paste0(paste0(x, '"'), collapse = " %P%\n")
  pbcopy(x)
  cat(x, fill = TRUE)
}

#' extract reg expr matches
#'
#' A wrapper around the base function combo of gregexpr and regmatches
#'
#' @param x Text data.
#' @param pat Reg ex pattern
#' @param drop Logical indicating whether to drop empty matches. Defaults to FALSE.
#' @param ... Other args (like ignore.case) passed to gregexpr
#' @return Matching expression from text.
#' @export
regmatches_ <- function(x, pat, drop = FALSE, ...) UseMethod("regmatches_")

#' @inheritParams regmatches_
#' @rdname regmatches_
#' @export
regmatches_first <- function(x, pat, drop = FALSE, ...) UseMethod("regmatches_first")


#' @export
regmatches_.default <- function(x, pat, ...) {
  if (length(x) == 0) return(NULL)
  stop("input must be character or list of character vectors", call. = FALSE)
}

#' @export
regmatches_.factor <- function(x, pat, drop = FALSE, ...) {
  x <- as.character(x)
  regmatches_(x, pat, drop, ...)
}

#' @export
regmatches_.character <- function(x, pat, drop = FALSE, ...) {
  m <- gregexpr_(x, pat, ...)
  args <- list(x = x, m = m)
  x <- do.call(base::regmatches, args)
  if (drop) {
    x <- unlist(x[lengths(x) > 0], use.names = FALSE)
  } else {
    x[lengths(x) == 0] <- ""
  }
  x
}


#' @export
regmatches_.list <- function(x, pat, drop = FALSE, ...) {
  x <- chr2fct(x)
  if (!all(vapply(x, is.character,
                  FUN.VALUE = logical(1), USE.NAMES = FALSE))) {
    stop("input must be character or list of character vectors", call. = FALSE)
  }
  x <- lapply(x, regmatches_, pat = pat, drop = drop, ...)
  if (drop) {
    x[lengths(x) == 0] <- list(character())
  } else {
    x[lengths(x) == 0] <- ""
  }
  x
}

#' smart gregexpr wrapper
#'
#' @param x Input text
#' @param pat Reg ex pattern
#' @param ... Other args passed to base (g)regexpr
#' @return Pattern match positions
#' @export
gregexpr_ <- function(x, pat, ...) {
  args <- list(pattern = pat, text = x, ...)
  if ("perl" %in% names(args)) {
    args$perl <- args$perl
  } else {
    if (grepl("\\(\\?.*\\)", pat)) {
      args$perl <- TRUE
    } else {
      args$perl <- FALSE
    }
  }
  do.call(base::gregexpr, args)
}

#' @export
regmatches_first.default <- function(x, pat, ...) {
  stop("input must be character or list of character vectors", call. = FALSE)
}

#' @export
regmatches_first.factor <- function(x, pat, drop = FALSE, ...) {
  x <- as.character(x)
  regmatches_first(x, pat, drop, ...)
}

#' @export
regmatches_first.character <- function(x, pat, drop = FALSE, ...) {
  m <- regexpr_(x, pat, ...)
  args <- list(x = x, m = m)
  x[m > 0 & !is.na(m)] <- do.call(base::regmatches, args)
  if (drop) {
    x <- x[m > 0 & !is.na(m)]
  } else {
    x[m < 0 | is.na(m)] <- ""
  }
  x
}


#' @export
regmatches_first.list <- function(x, pat, drop = FALSE, ...) {
  x <- chr2fct(x)
  if (!all(vapply(x, is.character,
                  FUN.VALUE = logical(1), USE.NAMES = FALSE))) {
    stop("input must be character or list of character vectors", call. = FALSE)
  }
  x <- lapply(x, regmatches_first, pat = pat, drop = drop, ...)
  if (drop) {
    x[lengths(x) == 0] <- list(character())
  } else {
    x[lengths(x) == 0] <- ""
  }
  x
}

#' @inheritParams gregexpr_
#' @rdname gregexpr_
#' @export
regexpr_ <- function(x, pat, ...) {
  args <- list(pattern = pat, text = x, ...)
  if ("perl" %in% names(args)) {
    args$perl <- args$perl
  } else {
    if (grepl("\\(\\?.*\\)", pat)) {
      args$perl <- TRUE
    } else {
      args$perl <- FALSE
    }
  }
  do.call(base::regexpr, args)
}


chr2fct <- function(x) {
  if (is.data.frame(x)) {
    x[1:ncol(x)] <- lapply(x, chr2fct_)
  } else if (is.list(x)) {
    x <- lapply(x, chr2fct_)
  } else {
    x <- chr2fct_(x)
  }
  x
}

chr2fct_ <- function(x) if (is.factor(x)) as.character(x) else x

owner_repo <- function(x) {
  x <- sub("https?://github.com/?", "", x)
  regmatches_first(x, "[^/]+/[^/]+")
}


#' Generate link to raw Github file
#'
#' Converts Github path/repo/file information into a link to the raw version of
#' the file
#'
#' @param file Name of desired file; if \code{repo} is NULL, then this value
#'   should also provide repo information, i.e., owner and name of the
#'   repository–e.g., \code{"owner/repo/file.ext"}. Alternatively, user may
#'   supply the URL to the file as it appears in a web browser, e.g.,
#'   \code{"https://github.com/mkearney/driven-snow/blob/master/theme/driven-snow.rstheme"}
#' @param repo Repository name information formatted as username/repo. If this
#'   information is provided in the value supplied to \code{file} then leave
#'   this as NULL (the default)
#' @return Returns the URL path to the raw version of the file.
#' @export
github_raw <- function(file, repo = NULL) {

  ## remove scheme and domain
  file <- sub("https?://github.com/?", "", file)

  ## if repo not provided
  if (is.null(repo)) {
    repo <- owner_repo(file)
    file <- sub("^[^/]+/[^/]+/", "", file)
  }

  ## if 'blob'
  if (grepl("^blob", file)) {
    file <- sub("blob/master/", "", file)
  }

  ## if 'tree' path
  if (grepl("^tree", file)) {
    stop("this is a path to a Github directory not a file", call. = FALSE)
  }

  ## validate strings
  stopifnot(
    length(file) == 1,
    length(repo) == 1,
    grepl("[^/]+/[^/]+", repo)
  )

  ## return raw version of file
  sprintf("https://raw.githubusercontent.com/%s/master/%s",
          repo, file)
}


paste_lines <- function(...) paste(c(...), collapse = "\n")


check_all_gh_files <- function(file, repo) {
  ## get all possible files
  all_files <- readlines(
    psub("https://github.com/{repo}?_pjax=%23js-repo-pjax-container",
         repo = repo)
  )
  all_files <- regmatches_(paste_lines(all_files), "(?<=href=\")[^\"]+")[[1]]
  all_files <- unique(
    grep(psub("^/{repo}/\\S+", repo = repo), all_files, value = TRUE)
  )
  all_files <- grep("blob/master", all_files, value = TRUE)
  all_files <- sub(psub("^/{repo}/blob/master/", repo = repo), "", all_files)

  ## if the file exists
  stopifnot(file %in% all_files)
}
