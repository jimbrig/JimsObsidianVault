library(pak)
library(pkgdepends)
library(purrr)
library(dplyr)

pkgs <- pkgdepends::lib_status()
pkgs_cran <- pkgs %>% filter(repository == "CRAN", !is.na(package)) %>% pull(package)
pkgs_gh <- pkgs %>% filter(remotetype == "github", !is.na(remotepkgref)) %>% pull(remotepkgref)

purrr::walk(pkgs_cran, pak::pak, ask = FALSE, upgrade = TRUE)
purrr::walk(pkgs_gh, pak::pak, ask = FALSE, upgrade = TRUE)
