#! C:\\Program Files\\R\\R-4.1.0\\bin\\x64\\Rscript --vanilla --default-packages=utils,pak

excludepkgs <- c("shinydashboardPlus")

oldpkgs <- setdiff(row.names(old.packages()), excludepkgs)

message("Updating `pak`...")
require(pak)
pak::pak_update()

if (length(oldpkgs) == 0) {
  message("No packages need to be updated currently.")
} else {
  message(paste0("Updating ", length(oldpkgs), " packages..."))
  pak::pak(oldpkgs)
}

q()
