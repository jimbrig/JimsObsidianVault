
#  ------------------------------------------------------------------------
#
# Title : jimstools build script
#    By : Jimmy Briggs
#  Date : 2020-10-12
#
#  ------------------------------------------------------------------------

if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  pkgload,
  pkgbuild,
  devtools,
  usethis,
  roxygen2,
  sinew,
  docthis,
  desc,
  knitr,
  rmarkdown,
  attachment,
  chameleon,
  checkhelper,
  golem,
  styler,
  spelling,
  pkgdown
)

golem::detach_all_attached()

attachment::att_amend_desc(
  extra.suggests = c("roxygen2", "devtools", "usethis", "desc", "attachment")
)

usethis::use_pkgdown("pkgdown/_pkgdown.yml", destdir = "inst/docs")

pkgdown::clean_site()
pkgdown::build_site()

chameleon::build_pkgdown(yml = "pkgdown/_pkgdown.yml", favicon = "pkgdown/favicon")
chameleon::open_pkgdown_function()

usethis::use_github_action("test-coverage")
usethis::use_github_action("pkgdown")
usethis::use_github_action_check_standard()
knitr::knit("README.Rmd")

devtools::load_all()
devtools::document()

devtools::spell_check()
spelling::update_wordlist()

globals <- checkhelper::get_no_visible()
globals_out <- paste0('"', unique(globals$globalVariables$variable), '"')
cat(globals_out, file = "R/globals.R", sep = "\n", append = TRUE)
usethis::edit_file("R/globals.R")

devtools::check()

devtools::test()

devtools::lint()

devtools::build()

devtools::release()

