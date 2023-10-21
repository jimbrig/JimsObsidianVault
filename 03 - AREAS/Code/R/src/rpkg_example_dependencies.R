# No Remotes ----
# Attachments ----
to_install <- c("dplyr", "fs", "htmltools", "lubridate", "magrittr", "openxlsx", "purrr", "qs", "readr", "rlang", "rstudioapi", "shiny", "stringr", "tibble", "tidyr", "usethis")
  for (i in to_install) {
    message(paste("looking for ", i))
    if (!requireNamespace(i)) {
      message(paste("     installing", i))
      install.packages(i)
    }
  }
