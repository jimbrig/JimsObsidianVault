if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  remotes,
  devtools,
  pkgbuild,
  usethis,
  zip,
  fs
)

if (Sys.getenv("GITHUB_PAT") == "") stop("Run usethis::browse_github_pat()")
if (!pkgbuild::has_rtools()) stop("Run installr::install.R.tools()")

# install theme package `rscodeio`
remotes::install_github("anthonynorth/rscodeio")
# bundle into zip and stash in dotfiles
pkgpath <- fs::path_package("rscodeio")
to <- fs::path_home("dotfiles", "rstudio", "themes", "rscodeio")
fs::dir_copy(pkgpath, to, overwrite = TRUE)
zip::zipr("rscodeio.zip", to, root = dirname(to))

# restart as admin
rscodeio::install_theme()