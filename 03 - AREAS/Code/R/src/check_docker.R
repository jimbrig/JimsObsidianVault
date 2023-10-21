#' Check if `docker` is in execution path
#'
#' @description Check if the docker executable is available in the
#'    computers path. Not necessary for setting up dockerfile's, but expected to pass if
#'    you are expecting to take advantage of {dockyards} docker interactions.
#'
#' @return TRUE/FALSE
#'
#' @export
#'
#' @examples
#' check_docker()
check_docker <- function() {

  cmd <- suppressWarnings({
    system2(
      "docker",
      stdout = FALSE,
      stderr = FALSE
    )
  })
  return(cmd == 0)
}

