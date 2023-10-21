addcode <- function(path = NA, codedir = getOption("code_dir"), git = TRUE) {

  stopifnot(rstudioapi::isAvailable())
  if (!is.na(path)) stopifnot(fs::file_exists(path))
  if (is.na(path)) path <- rstudioapi::getActiveDocumentContext()$path
  id <- rstudioapi::getActiveDocumentContext()$id

  # ensure saved
  rstudioapi::documentSave(id)


}

view_path <- function() {
  writeLines(strsplit(Sys.getenv("PATH"), ";")[[1]])
}

editrprof <- function() {
  file.edit("~/.R/.Rprofile")
}

editrenv <- function() {
  file.edit("~/.R/.Renviron")
}

editextras <- function() {
  file.edit("~/.R/rprofile_extras.R")
}

editsecrets <- function() {
  file.edit("~/.R/secrets.Renviron")
}

detach_all_attached <- function() {

  all_attached <- paste(
    "package:", names(utils::sessionInfo()$otherPkgs),
    sep = ""
  )

  try({
    suppressWarnings(
      invisible(
        lapply(
          all_attached,
          detach,
          character.only = TRUE,
          unload = TRUE
        )
      )
    )
  }, silent = TRUE)

}

#' Generalized Search and Search Engine Examples
#'
#' Use these functions to search the web directly from your browser,
#' building advanced queries and supplying common useful R related domains.
#'
#' @param s string to search for (`%s` in the query URL)
#' @param query_url string representing the URL to query; defaults to Google
#'
#' @name search
#'
#' @keywords search_engines
#'
#' @references
#'
#' @examples
#' # default search on google
#' search("polished.tech")
#'
#' # search github (note: &ref=opensearch)
#' search("polished", "https://github.com/search?q=%s&ref=opensearch")
#'
#' # search Github with language:r, org:tychobra for 'polished' (note: '%3A' represents a ':')
#' search("polished", "https://github.com/search?q=%s+language%3Ar+org%3Atychobra")
# search <- function(s, query_url = "https://google.com/search?q=") {
#
#   url <- paste0(query_url, s)
#
#   utils::browseURL(url)
#
# }

#' Search Github
#'
#' Query Github's internal search engine.
#'
#' @param s string to search for
#' @param type what to search for, see details for options
#' @param language optional language filter
#' @param topic optional topic filter
#' @param user optional user filter
#' @param org optional org filter
#'
#' @describeIn search
#'
#' @return
#'
#' @export
#'
#' @examples
#' search_gh("websocket", language = "r", topic = "rshiny")
#'
#' # search your org
#' search_gh("polished", org = "tychobra")
search_gh <- function(s,
                      type = "all",
                      language = NULL,
                      topic = NULL,
                      user = NULL,
                      org = NULL) {

  types <- c("all",
             "repo",
             "code",
             "commit",
             "issue",
             "discussion",
             "package",
             "marketplace",
             "topic",
             "wiki",
             "user")

  match.arg(type, types)
  type_query <- ifelse(type == "all", "&ref=opensearch", paste0("&type=", type))
  base_url <- "https://github.com/search?q="
  lang_query <- ifelse(is.null(language), "", paste0("+language%3A", language))
  topic_query <- ifelse(is.null(topic), "", paste0("+topic%3A", topic))
  user_query <- ifelse(is.null(user), "", paste0("+user%3A", user))
  org_query <- ifelse(is.null(org), "", paste0("org%3A", org))
  query <- paste0(s, " ", lang_query, topic_query, user_query, org_query, type_query)

  url <- paste0(base_url, query)

  utils::browseURL(url)

  invisible(return(url))

}

search_ghr <- function(s, ...) {
  search_gh(s, language = "R")
}

search_tychobra <- function(s, ...) {
  search_gh(s, org = "tychobra")
}

search_cran <- function(s, ...) {
  browseURL(paste0("https://github.com/cran/", s))
  #search_gh(s, org = "cran")
}


#' Search RSeek.org
#'
#' Query a search on [rseek.org](https://rseek.org/).
#'
#' @param s string to search for
#' @export
#'
#' @describeIn search
#'
#' @references
#' - <http://www.sashagoodman.com/>
search_rseek <- function(s, language = NULL, org = NULL) {
  url <- paste0("http://www.rseek.org/?q=", s)
  utils::browseURL(url)
}

#' Search Finzi
#'
#' @param s string to search for
#'
#' @describeIn search
#'
#' @references
#' - <http://finzi.psych.upenn.edu/search.html>
#' - <http://finzi.psych.upenn.edu/search/manual.html#query>
#'
#' @export
search_finzi <- function(s) {

  url <- paste0(
    "http://finzi.psych.upenn.edu/cgi-bin/namazu.cgi?query=",
    s,
    "&max=100&result=normal&sort=score&idxname=functions&idxname=views"
  )

}

#' Search Nabble R Forum
#'
#' Query a search on the R Nabble Forum. Nabble is an innovative search engine
#' for R messages.
#'
#' @describeIn search
#'
#' @param s string to search for
#'
#' @export
#' @references
#' - <https://cloud.r-project.org/search.html>
#' - <http://n4.nabble.com/help/Answer.jtp?id=31>
search_nabble <- function() {

  url <- paste0(
    "https://r.789695.n4.nabble.com/template/NamlServlet.jtp?macro=search_page&node=789695&query=", s
  )

  utils::browseURL(url)

}

#' Search Google
#'
#' @describeIn search
#'
#' @param s string to search for
#'
#' @return
#' @export
search_google <- function(s) {
  url <- paste0("https://www.google.com/search?q=", s)
  utils::browseURL(url)
}

#' Search R Project Domain on Google
#'
#' @param s string to search for
#'
#' @describeIn search
#'
#' @export
#'
#' @details See <https://cloud.r-project.org/search.html> which showcases Google's
#'   advanced search feature to query only R-Project domain sites via the
#'   [Google Search Engine](http://www.google.com/advanced_search).
search_rproject <- function(s) {

  url <- paste0(
    "https://www.google.com/search?q=", s,
    "&domains=r-project.org&sitesearch=r-project.org&btnG=Google+Search"
  )

  utils::browseURL(url)

}

#' Search Rseek
#'
#' @param s
#' @param language
#' @param org
#'
#' @return
#' @export
#'
#' @examples
search_rseek <- function(s, language = NULL, org = NULL) {
  url <- paste0("http://www.rseek.org/?q=", s)
  utils::browseURL(url)
}

