
# installr::install.java()
#
# drat::addRepo("stlarepo")
# install.packages("dir2json")

explore_dir_tree <- function(path = ".") {

  dir2json::shinyDirTree(".")

}

dir_tree <- function(path, recurse = TRUE) {

  fs::dir_tree(path, recurse)

}


