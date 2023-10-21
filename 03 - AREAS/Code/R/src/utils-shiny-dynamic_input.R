#' Get Choices
#'
#' Returns a named, character vector of unique values from a specified
#' character or factor column in a data.frame.
#'
#' @param df data data.frame to pull from
#' @param var character string specifying column to pull choices from

#' @export

#' @return named list of unique avaiable choices from a column in `df`.

#' @importFrom dplyr filter
#' @importFrom rlang set_names
get_choices <- function(df, var) {

  hold <- dplyr::filter(df, variable == var)

  vals <- pull_unique(hold, "value")
  labs <- pull_unique(hold, "value_label")

  rlang::set_names(vals, labs)

}

#' Edit Input
#'
#' @param ns namespace Namespace of environment the input should be created in
#' @param col column column of data to create widget based off of.
#' @param lab label Label to place above widget
#' @param dat data data frame to derive input's choices from
#' @param choices choices list
#' @param id_cols unique scenario where you want to specify some character columns
#'   as class `id` instead of character to use a textInput as opposed to a selectInput.
#'
#' @return htmlwidget
#' @export
edit_input <- function(ns = NULL, col, lab, dat, choices, id_cols = NULL) {

  dat_col <- dat[[col]]

  if (is.null(ns)) ns <- function(x) return(x)

  if (!is.null(id_cols) {
    if (col %in% c(id_cols)) {
      class(dat_col) <- c("id", class(dat_col))
    }
  }

  UseMethod("edit_input", dat_col)

}

#' @describeIn edit_input Edit Input - Character
#' @export
#' @importFrom shiny selectInput
edit_input.character <- function(ns, col, lab, dat, choices) {

  shiny::selectInput(
    ns(col),
    lab,
    choices = choices[[col]],
    selected = ifelse(is.na(dat[1,1]), "", dat[[col]])
  )

}

#' @describeIn edit_input Edit Input - Logical
#' @export
#' @importFrom shiny checkboxInput
edit_input.logical <- function(ns, col, lab, dat, choices) {

  shiny::checkboxInput(
    ns(col),
    lab,
    value = ifelse(is.na(dat[1,1]), TRUE, dat[[col]]),
  )

}

#' @describeIn edit_input Edit Input - ID
#' @export
#' @importFrom shiny textInput
edit_input.id <- function(ns, col, lab, dat, choices) {

  shiny::textInput(
    ns(col),
    lab,
    value = ifelse(is.na(dat[1,1]), "", dat[[col]])
  )

}

#' @describeIn edit_input Edit Input - Numeric
#' @export
#' @importFrom shiny numericInput
edit_input.numeric <- function(ns, col, lab, dat, choices) {

  shiny::numericInput(
    ns(col),
    lab,
    value = ifelse(is.na(dat[1,1]), "", dat[1, col]),
    min = 0,
    step = 1
  )

}

#' @describeIn edit_input Edit Input - Numeric
#' @export
#' @importFrom shiny dateInput
edit_input.date <- function(ns, col, lab, dat) {

  min_date <- min(dat[[col]], na.rm = TRUE)
  max_date <- max(dat[[col]], na.rm = TRUE)

  shiny::dateInput(
    ns(col),
    lab,
    value = ifelse(is.na(dat[1,1]), "", dat[1, col]),
    min = min_date,
    max = max_date
  )

}
