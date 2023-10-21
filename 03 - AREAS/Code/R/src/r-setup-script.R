
#  ------------------------------------------------------------------------
#
# Title : R Configuration / Setup Script
#    By : Jimmy Briggs
#  Date : 2019-12-20
#
#  ------------------------------------------------------------------------

# NOTE: This script should be run in RStudio as an Admin...

# install packages --------------------------------------------------------
if (!require(pacman)) install.packages("pacman")

pacman::p_load(devtools,
               installr,
               tinytex,
               rstudioapi,
               magrittr,
               dplyr,
               pkgbuild)

rstudioapi::restartSession()


# configure RStudio settings ----------------------------------------------

# disable reloading of workspace between sessions
usethis::use_blank_slate(scope = "user")

# review system environment variables:
Sys.getenv()

# configure your R library path for R packages
.libPaths()

# copy packages to new R-version's windows library
libdir_prior <- file.path("<enter prior win-library path here>")
libdir_current <- file.path("<enter current win-library path here>")
installr::copy.packages.between.libraries(
  from = libdir_prior, to = libdir_current
)

# check
.libPaths()[1] == libdir

# configure dotfiles .Rprofile & .Renvrion --------------------------------

# review dotfiles
usethis::edit_r_environ(scope = "user") # (RTools Path, github PAT, keys, etc.)
usethis::edit_r_profile(scope = "user") # (various options for packages)

# additional software ---------------------------------------------
pkgbuild::setup_rtools()

# Rtools
installr::install.rtools()
rstudioapi::restartSession()
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")

# git
installr::install.git()
rstudioapi::restartSession()

# tinytex
tinytex::install_tinytex()
rstudioapi::restartSession()

tinytex:::is_tinytex()
# tinytex::use_tinytex()

install.packages("blogdown")
blogdown::install_hugo()

# java
installr::install.java()

# pandoc
installr::install.pandoc()

# node.js (only if desired)
installr::install.nodejs()

# github Git Client (only if desired)
# installr::install.github()

# inno (only if desired)
installr::install.inno()
