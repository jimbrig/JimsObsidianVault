
update_gh_pkgs <- dtupdate::github_update(TRUE, TRUE)

### DEPRECATED ###

# update_github_pkgs <- function(auto.install = TRUE,
#                                ask = TRUE,
#                                widget = FALSE,
#                                dependencies = TRUE,
#                                libpath = .libPaths()[1]) {
#
#   require(dplyr)
#   require(magrittr)
#   require(pak)
#
#   pacman::p_load_current_gh("hrbrmstr/dtupdate")
#
#   x <- dtupdate::github_update() %>%
#     dplyr::filter(`*` == "*")
#
#   pkgs <- x$source %>%
#     stringr::str_remove_all(pattern = c("Github ")) %>%
#     stringr::str_sub(2L, nchar(.) - 1)
#
#   pak::pak(pkgs, upgrade = TRUE)
#
# }

# library('devtools')
# library('utils')
# library('httr')
#
# update_github <- function(ask = TRUE, ...) {
#     installed <- installed.packages()
#     oldVersion <- installed[, 'Version']
#     urls <- sapply(names(oldVersion), function(x) {
#       d <- packageDescription(x)
#       if ('URL' %in% names(d) && grepl('github', d$URL))
#         urlout <- strsplit(d$URL, 'github.com/')[[1]][2]
#       if ('BugReports' %in% names(d) &&
#           grepl('github', d$BugReports)) {
#         urlout <- gsub('/issues', '', d$BugReports)
#         urlout <- strsplit(urlout, 'github.com/')[[1]][2]
#       } else
#         urlout <- NULL
#       return(urlout)
#     })
#     toUpdate <- cbind.data.frame(
#       urls = unlist(urls),
#       oldVersion = unname(oldVersion)[!sapply(urls, is.null)],
#       stringsAsFactors = FALSE
#     )
#     toUpdate$newerVersion <- apply(toUpdate, 1, function(x) {
#       desc <- paste('https://raw2.github.com/',
#               x[1],
#               '/master/DESCRIPTION',
#               sep = '')
#       tmp <- tempfile()
#       writeLines(content(GET(desc)), tmp)
#       desc <- read.dcf(tmp)
#       if (package_version(desc[, 'Version']) > package_version(x[2]))
#         return(TRUE)
#       else
#         return(FALSE)
#     })
#     #print(toUpdate) # just for quick debugging purposes
#
#     if (ask) {
#       if (.Platform$OS.type == "windows" || .Platform$GUI ==
#           "AQUA" ||
#           (capabilities("tcltk") && capabilities("X11"))) {
#         k <- select.list(
#           toUpdate[toUpdate$newerVersion == TRUE, 1],
#           toUpdate[toUpdate$newerVersion == TRUE, 1],
#           multiple = TRUE,
#           title = "Packages to be updated",
#           graphics = TRUE
#         )
#       }
#       else
#         k <- text.select(toUpdate[, 1])
#     } else
#       k <- toUpdate[, 1]
#
#     # install from Github
#     sapply(k, function(x) {
#       tryCatch(
#         install_github(x, ...),
#         error = function(e)
#           NULL
#       )
#     })
#
#     installed2 <- installed.packages()
#     newVersion <-
#       installed2[rownames(installed2) %in% rownames(toUpdate), 'Version']
#     toUpdate <- cbind(toUpdate, newVersion)
#
#     return(toUpdate)
#   }
#
# update_github()
