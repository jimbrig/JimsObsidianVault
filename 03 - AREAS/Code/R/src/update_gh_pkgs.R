require(dplyr)
require(magrittr)

pacman::p_load_current_gh("hrbrmstr/dtupdate")

x <- dtupdate::github_update() %>%
  dplyr::filter(`*` == "*")

pkgs <- x$source %>%
  stringr::str_remove_all(pattern = c("Github ")) %>%
  stringr::str_sub(2L, nchar(.) - 1)

remotes::install_github(pkgs, character.only = TRUE)

