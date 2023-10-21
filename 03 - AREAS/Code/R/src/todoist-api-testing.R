# token <- Sys.getenv("TODOIST_API_TOKEN")

library(dplyr)
library(rtodoist)
library(htmltools)

if (use_token() == "") {
  Sys.setenv("TODOIST_API_TOKEN" = "a432ba984a57c6d1edcfc746bde78664b28ae894")
}

# helpers
use_token()

get_proj_id <- function(name) {
  if (!exists("projects")) {
    projects <- proj_get_all()
  }
  hold <- projects$id[match(name, projects$name)]
  return(as.character(hold))
}

projects <- proj_get_all()
glimpse(projects)

tasks <- task_get_all() %>%
  left_join(
    select(projects, project_id = id, project_name = name),
    by = "project_id")

glimpse(tasks)

# add a new project
add_proj <- function (name, parent_id = NULL, token = use_token()) {

  current_projects <- proj_get_all(token = token)

  if (name %in% current_projects$name) {
    stop("Project already exists")
  }

  projects_api_url <- "https://api.todoist.com/rest/v1/projects"


  new_project <- httr::POST(url = projects_api_url, header_post(token = token),
                            body = list(name = name, parent = parent_id), encode = "json")

  # new_project <- proj_add_quick(name, parent_id, token)
  return(invisible(new_project))
}

header_post <- function(token = use_token()) {
  httr::add_headers(Authorization = paste("Bearer ",
                                          token), `Content-Type` = "application/json",
                    `X-Request-Id` = uuid::UUIDgenerate())
}


add_proj("test2", parent_id = get_proj_id("Incubate"))

proj_get_by_id <- function(id, token = use_token()) {
  purrr::map_dfr(id, ~{
    httr::GET(url = paste0(projects_api_url, "/", .x),
              header_get(token = token)) %>% httr::content("text",
                                                           encoding = "UTF-8") %>% jsonlite::fromJSON() %>%
      as.data.frame() %>% dplyr::mutate_if(is.factor, as.character) %>%
      dplyr::bind_rows(empty_project_df, .)
  })
}
