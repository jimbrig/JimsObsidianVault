#' Set up or update the compute environment
#'
#' Adds or updates a `Dockerfile`
#' and corresponding `main.yaml` GitHub Actions workflow.
#'
#' @family compute environment functions
#' @export
use_onbuild_image <- function() {
  # TODO add dockerignore
  # TODO add dockerfile
  # Rbuildignore dockerfile and dockerignore
  NULL
}

#' Install System Dependencies
#'
#' Infers and installs system dependencies from `DESCRIPTION`
#' via the [r-hub/sysreqs](https://github.com/r-hub/sysreqs) project.
#'
#' @family compute environment functions
#' @keywords internal
#' @export
install_sysdeps <- function() {
  checkmate::assert_file_exists("DESCRIPTION")
  # TODO migrate to rspm db https://github.com/subugoe/muggle/issues/25
  sysdep_cmds <- sysreqs::sysreq_commands("DESCRIPTION")
  if (sysdep_cmds == "") {
    cli::cli_alert_info(
      "No necessary system dependencies could be found. Skipping."
    )
  } else {
    # processx does not work here because it requires cmd and args separately
    system(
      command = sysdep_cmds
    )
    cli::cli_alert_success(
      "System depedencies installed."
    )
  }
}

#' Directory for copying dependencies to docker build context
#'
#' This directory serves to copy the package cache
#' into the docker build context on GitHub actions.
#'
#' @family compute environment functions
#' @keywords internal
#' @export
lib_cache_path <- fs::path(".github", "library")

#' Get the full docker image url for an image on GitHub Packages
#'
#' Helpful to quickly run an image locally or deploy it.
#' See the
#' [GitHub Packages for Docker documentation](https://docs.github.com/en/packages/using-github-packages-with-your-projects-ecosystem/configuring-docker-for-use-with-github-packages)
#' for details.
#' Forms a URL of the form
#' `docker.pkg.github.com/OWNER/REPOSITORY/IMAGE_NAME:VERSION`
#' Notice how, different from Docker Hub,
#' docker images on GitHub Packages have an `IMAGE_NAME`
#' appended to the familiar `OWNER/REPOSITORY` pattern.
#' These `IMAGE_NAME`s are immutable (cannot be changed nor deleted)
#' and must be unique per GitHub repository.
#'
#' @param image_name,version Image name and version as strings.
#' Defaults to muggle convention.
#'
#' @param repo_spec GitHub repo specification in this form: `owner/repo`.
#' Users should stick to the default; manual entry is only used for testing.
#'
#' @return character string
#'
#' @family compute environment functions
#'
#' @export
gh_pkgs_image_url <- function(image_name = gh_pkgs_image_name(
  target = "runtime"
),
version = gh_pkgs_image_version(),
repo_spec = gh_repo_spec()) {
  paste(
    "docker.pkg.github.com",
    repo_spec,
    paste0(image_name, ":", version),
    sep = "/"
  )
}

#' @describeIn gh_pkgs_image_url
#' Get the docker image name conventionally used in muggle projects
#'
#' @param target Build target for multistage muggle builds.
#' By convention, for a package `foo`, {muggle} would build a `foo-buildtime`
#' and `foo-runtime` for the `buildtime` and `runtime` docker multistage
#' build targets, respectively.
#' A `buildtime` target will exist for all {muggle} projects,
#' a `runtime` target only for projects
#' with deployed runtimes such as a shiny app
#'
#' @export
gh_pkgs_image_name <- function(target = c("buildtime", "runtime")) {
  target <- rlang::arg_match(target)
  paste0(Sys.getenv("MUGGLE_PKG_NAME"), "-", target)
}

#' @describeIn gh_pkgs_image_url
#' Get the sha of the *latest* `git commit` if on GitHub Actions,
#' or the *head* reference (the branch or tag) otherwise
#' (not recommended for reproducibility).
gh_pkgs_image_version <- function() {
  if (is_github_actions()) {
    return(Sys.getenv("GITHUB_SHA"))
  } else {
    # somewhat hacky backstop, the current head ref
    cli::cli_alert_warning(
      "Using *current* head reference, not the latest {.code git sha}."
    )
    gert::git_info()$shorthand
  }
}

#' Get the GitHub remote associated with a path as a repo_spec (`user/repo`)
#'
#' Wraps [gh::gh_tree_remote()].
#'
#' @keywords internal
#'
#' @export
gh_repo_spec <- function() {
  # something like this already exists in usethis, but seems unexported
  # muggle image *has* git, and on gh actions should also have a repo
  # but this will not work in a local docker cont, which has git, but no repo
  do.call(paste, c(gh::gh_tree_remote(), sep = "/"))
}

#' Determine if code is running inside GitHub Actions
#'
#' Looks for the `GITHUB_ACTIONS` environment variable, as
#' [documented](https://docs.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables)
#'
#' @noRd
is_github_actions <- function() {
  Sys.getenv("GITHUB_ACTIONS") == "true"
}

#' Browse to URL
#'
#' @details
#' This function is copied from an unexported function in
#' [usethis](https://github.com/r-lib/usethis/blob/23dd62c5e7713ed8ecceae82e6338f795d30ba92/R/helpers.R).
#'
#' @param ... Elements of the URL
#' @param open `[logical(1)]` giving whether the URL should be opened
#' @keywords internal
#' @export
view_url <- function(..., open = interactive()) {
  url <- paste(..., sep = "/")
  if (open) {
    usethis::ui_done("Opening URL {usethis::ui_value(url)}")
    utils::browseURL(url)
  } else {
    usethis::ui_todo("Open URL {usethis::ui_value(url)}")
  }
  invisible(url)
}

#' Remove an unneeded dependency
#' @keywords internal
#' @export
remove_dep <- function(x) {
  desc::desc_del_dep(x)
  usethis::ui_done(
    x = glue::glue(
      "Removing {dep} from DESCRIPTION again, ",
      "because it is already included in the muggle image.",
      dep = x
    )
  )
}

#' Muggle files
#'
#' @param muggle_file
#' File to copy, relative path from built package root.
#'
#' @keywords internal
#' @export
get_muggle_file <- function(muggle_file) {
  system.file(muggle_file, package = "muggle")
}

#' Temporarily get muggle files
#'
#' Copies muggle files ([get_muggle_file()]) to the working directory.
#' Files are deleted when `.local_envir` expires.
#' If file already exists, only a warning is thrown.
#' Useful to avoid pasting boilerplate files in muggle packages.
#'
#' @inheritParams get_muggle_file
#'
#' @inheritParams withr::local_file
#'
#' @keywords internal
#' @export
local_muggle_file <- function(muggle_file, .local_envir = parent.frame()) {
  if (fs::file_exists(muggle_file)) {
    cli::cli_alert_warning(c(
      "File {.file {muggle_file}} already exists. ",
      "Using existing file. ",
      "To use muggle defaults, remove the file."
    ))
  } else {
    target <- withr::local_file(
      .file = muggle_file,
      .local_envir = .local_envir
    )
    fs::file_copy(path = get_muggle_file(muggle_file), new_path = target)
  }
}

#' Determine if code is running inside GitHub Actions
#'
#' Looks for the `GITHUB_ACTIONS` environment variable, as
#' [documented](https://docs.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables)
#'
#' @keywords internal
is_github_actions <- function() {
  Sys.getenv("GITHUB_ACTIONS") == "true"
}

#' Create a muggle package
#'
#' @description
#' Set up, or migrate to a muggle project.
#' Wraps the following steps, *if the respective files
#' or configuration do not already exist*:
#'
#' 1. **Package Structure**:
#'     Sets up scaffolding via [usethis::create_package()]
#'     and asks the user to complete the `DESCRIPTION`.
#' 1. **Editors/IDEs**:
#'     Sets up [vscode](http://code.visualstudio.com)
#'     and RStudio as editors.
#' 1. **Git/GitHub**:
#'     Initialises a git repo via [usethis::use_git()],
#'     creates a repo on GitHub and sets it as an origin remote.
#' 1. **README**:
#'     Adds a `README.md` via [usethis::use_readme_md()]
#'     and asks the user to complete it.
#' 1. **Quality Control**:
#'     Sets up the project for unit tests via [usethis::use_testthat()]
#'     and test coverage via [usethis::use_coverage()].
#' 1. **Documentation**:
#'     Sets up markdown support in roxygen via [usethis::use_roxygen_md()],
#'     package documentation via [usethis::use_package_doc()]
#'     and adds a pkgdown website via [usethis::use_pkgdown()].
#' 1. **Workflow Automation**: sets up caching at [lib_cache_path] and tba.
#' 1. **Compute Environment**: tba.
#'
#'
#' @details # Warning
#' - Must not be run *inside* a package, but at the root of all packages
#' - If run on an existing project,
#'     the project should be under version control, with a clean working tree.
#'     The user should check all changes.
#'
#' @inheritParams usethis::create_package
#' @param license one of the license functions in [usethis]
#' @param license_holder
#' giving the license holder, used as `cph` and `fnd` role in `DESCRIPTION`
#' @inheritParams usethis::use_github
#' @family setup functions
#' @export
create_muggle_package <- function(path,
                                  fields = list(),
                                  license = usethis::use_mit_license,
                                  license_holder = character(),
                                  organisation = NULL,
                                  private = FALSE) {
  # input validation
  checkmate::assert_function(license)
  checkmate::assert_string(license_holder)
  # does not work properly with relative paths
  # at least not with a .git at ~ as on max's machine
  path <- fs::path_abs(path = path)

  # package structure ====
  usethis::create_package(
    path = path,
    fields = fields,
    # set rstudio even if api is not available, useful for other users
    rstudio = TRUE
  )
  if (length(license_holder) == 0) {
    rlang::exec(license)
  } else {
    rlang::exec(.fn = license, license_holder)
    desc::desc_add_author(family = license_holder)
    # for some reason this needs to be a separate call
    desc::desc_add_role(role = c("cph", "fnd"), given = license_holder)
  }

  # ide and editor settings ====
  # configure to never save/load Rdata
  usethis::use_blank_slate("project")
  use_radian()

  # git/github ====
  usethis::use_git()
  # imperfect check for whether github remote is set
  if (nrow(gert::git_remote_list()) == 0) {
    # if there was already a git remote as will be true for existing projects,
    # the whole function would error out here
    usethis::use_github(
      organisation = organisation,
      private = private,
      protocol = "https"
    )
  } else {
    usethis::use_github_links()
  }

  usethis::ui_todo(x = "Edit the {usethis::ui_code('DESCRIPTION')}.")
  usethis::edit_file("DESCRIPTION")

  usethis::use_readme_md()

  # testing ====
  # testthat is already in muggle, is also required in user pkg
  # otherwise there is a check error
  usethis::use_testthat()
  usethis::use_coverage()
  remove_dep("covr")

  # documentation ====
  # cleaner to have this in a separate folder
  usethis::use_roxygen_md()
  usethis::use_package_doc(open = FALSE)
  usethis::use_pkgdown(config_file = "pkgdown/_pkgdown.yml")

  # workflow automation ====
  # set up caching of deps from github actions into container
  fs::dir_create(path = lib_cache_path)
  brio::write_lines(
    text = c("See `help('muggle::lib_cache_path')`"),
    path = fs::path(lib_cache_path, "README.md")
  )
  usethis::ui_done(c(
    "Created {usethis::ui_code(lib_cache_path)} to add cached dependencies ",
    "to docker build context on GitHub actions."
  ))

  # compute environment ====
  # TODO add docker generation

  # final edits ====
  usethis::ui_todo(x = "Edit the {usethis::ui_code('README.md')}.")
  usethis::edit_file("README.md")

  usethis::ui_done(x = "Your package is now set up.")
  usethis::ui_todo(x = "Review and commit all changes.")
}

#' Set up codecov
#' @param reposlug `[character(1)]` giving the `username/repo` URL slug of the project.
#' @family testing functions
#' @export
use_codecov2 <- function(reposlug) {
  usethis::use_coverage(type = "codecov")
  usethis::ui_todo(
    "Add the {usethis::ui_value('Repository Upload Token')} from codecov as a secret called {usethis::ui_value('CODECOV_TOKEN')} on GitHub."
  )
  view_url("https://codecov.io/gh", reposlug, "settings")
  view_url("https://github.com", reposlug, "settings", "secrets")
}

find_dev_ver_number <- function() {
  script <- system.file("scripts", "find_dev_ver_number.sh", package = "muggle")
  ver <- "0.0.0.9000"
  res <- processx::run(script)
  if (res$stdout == "") {
    cli::cli_alert_warning("
      Could not construct a version number using {.code git describe}.
      Maybe you have not created any {.code git tag}s?
      Using {.code {ver}} instead.
    ")
  } else {
    ver <- res$stdout
  }
  return(ver)
}
