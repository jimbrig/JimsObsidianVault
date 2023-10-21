#' Multi Filt
#'
#' Filter across multiple variables.
#'
#' @details NOTE: this function currently only supports character and factor level
#'   filtering by using the `dplyr::filter(<var> %in% c(<filts>))` syntax. For numeric
#'   and date level filtering will need to incorporate expressions like `<= 5` as
#'   `filt` arguments.
#'
#' @param data data
#' @param vars variables
#' @param filts filters
#'
#' @return filtered df
#' @export
#'
#' @importFrom dplyr filter
#' @importFrom purrr map2
#' @importFrom rlang quo
#'
#' @examples
#' library(dplyr)
#' data <- datasets::iris
#' str(data)
#'
#' iris_filtered <- multi_filt(data, vars = list("Species"), filts = list(c("setosa", "versicolor")))
#'
#' str(iris_filtered) # filtered for only Species %in% c("setosa" and "versicolor")
multi_filt <- function(data, vars, filts) {

  fp <- purrr::map2(vars, filts, function(x, y) rlang::quo((!!(as.name(x))) %in% !!y))

  dplyr::filter(data, !!!fp)

}
