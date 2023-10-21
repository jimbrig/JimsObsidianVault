#' Multi Filt
#'
#' Filter across multiple variables.
#' 
#' @details NOTE: this function currently only supports character and factor level 
#'   filtering by using the `dplyr::filter(<var> %in% <filts>)` syntax. For numeric 
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
# iris


# library(dplyr)
# dat <- iris %>% mutate(Species = as.character(Species))
# multi_filt(dat, vars = "Species", filts = c(unique(dat$Species)[1:2]))


#' Multi Filt
#'
#' Filter across multiple variables.
#'
#' @param data data
#' @param vars variables
#' @param filts filters
#'
#' @return filtered df
#' @export
#' @importFrom dplyr filter
#' @importFrom purrr map2
#' @importFrom rlang quo
multi_filt <- function(data, vars, filts) {
  
  fp <- purrr::map2(vars, filts, function(x, y) {
    
    if (!is.character(data[[x]]) && !is.factor(data[[x]])) {
      
      txt <- paste0(x, y)
      expr <- rlang::quos(!!txt)
      rlang::quo((!!!expr))
      
    } else {
      
      rlang::quo((!!(as.name(x))) %in% !!y)
      
    }
    
    
  })
  
  dplyr::filter(data, !!!fp)
  
}

# str(iris)
# multi_filt(iris, vars = c("Sepal.Length", "Species"), filts = list(" <= 5", c("setosa")))


#' Pull all unique values for a variable
#'
#' @param data data.frame
#' @param var variable name
#' @param sort logical (default = TRUE)
#' @param decreasing logical (default = FALSE)
#' @param names logical (default = TRUE)
#'
#' @return vector
#'
#' @importFrom rlang sym !!
#' @importFrom dplyr pull
#' @importFrom purrr set_names
#'
#' @export
pull_unique <- function(data, var, sort = TRUE,
                        decreasing = FALSE, names = TRUE) {
  
  hold <- data %>%
    dplyr::pull(!!rlang::sym(var)) %>%
    unique()
  
  if (sort) hold <- hold %>% sort(decreasing = decreasing)
  if (names) hold <- hold %>% purrr::set_names()
  
  return(hold)
  
}

#' Get column classes from a data.frame
#'
#' @param data data.frame input
#'
#' @return if each column only has one associated class, a named character vector
#'   is returned with the names equal to the column names and values equal to
#'   the classes. If some columns have more than a single class, a named list
#'   with column names as names and classes as values is returned.
#' @export
#'
#' @examples
#' data <- data.frame(a = c(1:3), b = letters[1:3], c = c(TRUE, FALSE, TRUE))
#' get_col_classes(data)
#'
#' @importFrom purrr map simplify
get_col_classes <- function(data) {
  hold <- data %>% purrr::map(class)
  if (all(purrr::map(hold, length) == 1)) hold <- purrr::simplify(hold)
  return(hold)
}


#' Get Choices
#'
#' @param df data
#' @param var variable
#'
#' @export
#'
#' @return named list
#'
#' @importFrom dplyr filter
#' @importFrom rlang set_names
get_choices <- function(df, var) {
  
  hold <- dplyr::filter(df, variable == var)
  
  vals <- pull_unique(hold, "value")
  # labs <- pull_unique(hold, "value_label")
  
  rlang::set_names(vals, labs)
  
}

var_input <- function(dat, lab, excludes = NULL, ns = NULL) {
  
  if (is.null(ns)) ns <- function(x) return(x)
  
  shiny::varSelectInput(
    ns(deparse(substitute(dat))),
    label = lab,
    data = dat, 
    selected = colnames(dat) %>% setdiff(excludes),
    multiple = TRUE
  )
  
  
}

filters_ui <- function(id, dat, excludes = NULL) {
  
  dat <- dat %>%
    dplyr::mutate_if(is.integer, as.numeric)
  
  ns <- NULL # shiny::NS(id)
  
  vars <- names(dat) %>% setdiff(excludes)
  
  choices <- purrr::map(vars, function(x) pull_unique(dat, x)) %>%
    rlang::set_names(vars)
  
  params <- list(
    col = vars,
    lab = vars,
    choices = choices
  )
  
  filter_inputs <- purrr::pmap(
    params, filter_input, dat = dat, ns = NULL
  ) %>%
    rlang::set_names(vars)
  
  htmltools::tagList(
    shiny::fluidRow(
      shiny::column(
        12,
        var_input(dat, lab = "Select Variables for Filtering:", excludes = excludes )
      )
    ),
    shiny::fluidRow(
      shiny::column(
        12,
        filter_inputs
      )
    )
  )
    
}

# filters_ui(id = "filts", dat)

#' Filter Input
#'
#' @param ns namespace
#' @param col column
#' @param lab label
#' @param dat data
#' @param choices choices list
#'
#' @return htmlwidget
#' @export
filter_input <- function(dat, col, lab, choices, ns = NULL) {
  
  if (is.null(ns)) ns <- function(x) return(x)
  
  dat_col <- dat[[col]]
  
  UseMethod("filter_input", dat_col)
  
  # if (col %in% c("entity_id", "loss_run_id")) {
  #   class(dat_col) <- c("id", class(dat_col))
  # }
  
  
  
}

filter_input.default <- function(dat, col, lab, choices, ns) {
  
  htmltools::div(
    style = "opacity: 0.5;",
    htmltools::p(
      width = "100%", 
      align = "center", 
      "Don't know how to filter for class ",
      shiny::code(
        class(dat)
      )
    )
  )
  
}

#' @describeIn filter_input - Character
#' @export
#' @importFrom shiny selectInput
filter_input.character <- function(dat, col, lab, choices, ns) {
  
  shiny::selectInput(
    ns(col),
    lab = col,
    choices = choices,
    selected = choices
  )
  
}

#' @describeIn filter_input Factor
#' @export
#' @importFrom shiny selectInput
filter_input.factor <- function(dat, col, lab, choices, ns) {
  
  shiny::selectInput(
    ns(col),
    lab = col,
    choices = choices,
    selected = choices
  )
  
}

#' @describeIn filter_input Logical
#' @export
#' @importFrom shiny checkboxInput
filter_input.logical <- function(dat, col, lab, choices, ns) {
  
  shiny::checkboxInput(
    ns(col),
    lab = col,
    value = TRUE
  )
  
}

#' @describeIn filter_input ID (Text)
#' @export
#' @importFrom shiny textInput
filter_input.id <- function(dat, col, lab, choices, ns) {
  
  shiny::textInput(
    ns(col),
    lab = col,
    value = "Placeholder"
  )
  
}

#' @describeIn filter_input Numeric (Slider)
#' @export
#' @importFrom shiny numericInput
filter_input.numeric <- function(dat, col, lab, choices, ns) {
  
  shiny::sliderInput(
    ns(col),
    lab = col,
    min = min(dat[[col]], na.rm = TRUE),
    max = max(dat[[col]], na.rm = TRUE),
    value = c(min(dat[[col]], na.rm = TRUE), max(dat[[col]], na.rm = TRUE))
  )
  
}

#' @describeIn filter_input Date Range
#' @export
#' @importFrom shiny dateRangeInput
filter_input.date <- function(dat, col, lab, choices, ns) {
  
  shiny::dateRangeInput(
    ns(col),
    lab = col,
    start = min(dat[[col]], na.rm = TRUE),
    end = max(dat[[col]], na.rm = TRUE),
    min = min(dat[[col]], na.rm = TRUE),
    max = max(dat[[col]], na.rm = TRUE)
  )
  
}



