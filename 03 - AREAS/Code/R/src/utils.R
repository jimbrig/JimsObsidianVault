dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

dropNullsOrEmpty <- function(x) {
  x[!vapply(x, nullOrEmpty, FUN.VALUE = logical(1))]
}

nullOrEmpty <- function(x) {
  is.null(x) || length(x) == 0 || x == ""
}

`%||%` <- function(x, y) {
  if (!is.null(x)) x else y
}

dropListColumns <- function(x) {
  type_col <- vapply(X = x, FUN = typeof, FUN.VALUE = character(1),
                     USE.NAMES = FALSE)
  x[, type_col != "list", drop = FALSE]
}

#' @importFrom htmltools tagList tags doRenderTags
help_popup <- function(text) {
  tagList(
    tags$span(
      icon("question"),
      `data-toggle` = "popover",
      `data-trigger` = "focus",
      title = i18n("Help"),
      `data-html` = "true",
      `data-content` = htmltools::doRenderTags(text),
      tabindex = "0",
      role = "button"
    ),
    tags$script(
      "$(function () { $(\'[data-toggle=\"popover\"]\').popover({container: 'body'}); })"
    )
  )
}

#' Get variables classes from a \code{data.frame}
#'
#' @param data a \code{data.frame}
#'
#' @return a \code{character} vector as same length as number of variables
#' @noRd
#'
#' @examples
#'
#' get_classes(mtcars)
get_classes <- function(data) {
  classes <- lapply(
    X = data,
    FUN = function(x) {
      paste(class(x), collapse = ", ")
    }
  )
  unlist(classes, use.names = FALSE)
}

#' Get count of unique values in variables of \code{data.frame}
#'
#' @param data a \code{data.frame}
#'
#' @return a \code{numeric} vector as same length as number of variables
#' @noRd
#'
#' @importFrom data.table uniqueN
#'
#' @examples
#' get_n_unique(mtcars)
get_n_unique <- function(data) {
  u <- lapply(data, FUN = function(x) {
    if (is.atomic(x)) {
      uniqueN(x)
    } else {
      NA_integer_
    }
  })
  unlist(u, use.names = FALSE)
}

#' Variables summary
#'
#' @param data a \code{data.frame}
#'
#' @return a \code{data.frame}
#' @noRd
#'
#' @examples
#'
#' summary_vars(iris)
#' summary_vars(mtcars)
summary_vars <- function(data) {
  data <- as.data.frame(data)
  datsum <- data.frame(
    name = names(data),
    class = get_classes(data),
    n_missing = unname(colSums(is.na(data))),
    stringsAsFactors = FALSE
  )
  datsum$p_complete <- 1 - datsum$n_missing / nrow(data)
  datsum$n_unique <- get_n_unique(data)
  datsum
}

#' @title Convert to textInput
#'
#' @description Convert a variable to several text inputs to be displayed in a \code{DT::datatable}.
#'
#' @param data a \code{data.frame}
#' @param variable name of the variable to replace by text inputs
#' @param id a common id to use for text inputs, will be suffixed by row number
#' @param width width of input
#'
#' @return a \code{data.frame}
#' @noRd
#' @importFrom htmltools doRenderTags
#' @importFrom shiny textInput
set_input_text <- function(data, variable, id = "variable", width = "100%") {
  values <- data[[variable]]
  text_input <- mapply(
    FUN = function(inputId, value) {
      doRenderTags(textInput(
        inputId = inputId,
        label = NULL,
        value = value,
        width = width
      ))
    },
    inputId = paste(id, pad0(seq_along(values)), sep = "-"),
    value = values,
    SIMPLIFY = FALSE,
    USE.NAMES = FALSE
  )
  data[[variable]] <- text_input
  data
}

#' Convert rownames to checkboxes
#'
#' @param data a \code{data.frame}
#' @param id a common id to use for text inputs, will be suffixed by row number
#'
#' @return a \code{data.frame}
#' @noRd
#'
#' @importFrom htmltools tagAppendAttributes doRenderTags
#' @importFrom shinyWidgets prettyCheckbox
#'
#' @note
#' \code{shinyWidgets::prettyCheckbox} HTML dependency need to be included manually.
set_input_checkbox <- function(data, id = "selection") {
  checkboxes <- lapply(
    FUN = function(i) {
      tag <- prettyCheckbox(
        inputId = paste(id, i, sep = "-"),
        label = NULL,
        value = TRUE,
        status = "primary",
        thick = TRUE,
        outline = TRUE,
        shape = "curve",
        width = "100%"
      )
      tag <- tagAppendAttributes(tag, style = "margin-top: 5px;")
      doRenderTags(tag)
    },
    X = pad0(seq_len(nrow(data)))
  )
  rownames(data) <- unlist(checkboxes, use.names = FALSE)
  data
}
