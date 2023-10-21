#!/usr/bin/env Rscript

pacman::p_load(
  argparse,
  humaniformat,
  glue,
  RCurl,
  gh,
  purrr,
  rappdirs,
  rmarkdown,
  pkgdown,
  codemetar,
  git2r,
  usethis,
  devtools,
  fs
)

options(echo = TRUE)

# arguments passed from the batch file to R variables
args = commandArgs(trailingOnly = TRUE)
if (length(args) == 0) {
  print("No arguments supplied, must supply a project name.")
}

parser <- argparse::ArgumentParser(
  description = "Create an R project."
)

parser$add_argument(
  "-n",
  "--name",
  nargs = 1,
  help = "R Project Name",
  default = "newrproj"
)

parser$add_argument(
  "-rs",
  "--rstudio",
  help = "Use RStudio to create project.",
  action = "store_true",
  default = TRUE
)

parser$add_argument(
  "--git",
  help = "Create a git repository for the created project, if one does not already exist.",
  action = "store_true",
  default = TRUE
)

parser$add_argument(
  "-gh",
  "--github",
  help = "Push to github after initializing",
  action = "store_true",
  default = FALSE
)

parser$add_argument(
  "-o",
  "--organization",
  type = "character",
  help = "Github Organization",
  default = "jimbrig"
)

parser$add_argument(
  "-p",
  "--private",
  action = "store_true",
  help = "whether to use a private repository",
  default = TRUE
)

args <- parser$parse_args()

wd <- normalizePath(
  fs::path_home("Projects", args$name),
  mustWork = FALSE
)

parent <- dirname(wd)

setwd(parent)

proj_dir <- args$name

tmp <- tempdir()
if (!dir.exists(tmp)) dir.create(tmp)
zpth <- file.path(tmp, "project.zip")
down <- purrr::safely(download.file)("https://github.com/jimbrig/rproject-template/archive/master.zip",
                              destfile = zpth, quiet = TRUE)
zdir <- user_data_dir("mkrpkg")
if (is.null(down$error)) {
  if (!dir.exists(zdir)) dir.create(zdir)
  file.copy(zpth, zdir, overwrite = TRUE)
}


usethis::create_from_github(
  repo_spec = "jimbrig/rproject-template",
  destdir = proj_dir,
  protocol = "ssh"
)

usethis::create_project(
  proj_dir
)

parser$add_argument("--author", help = "package author name", default = git2r::config()$global$user.name)
parser$add_argument("--email", help = "author email", default = git2r::config()$global$user.email)


parser$add_argument("--pkgdown", help = "build pkgdown site", action = "store_true", default = FALSE)


parser$add_argument("gh", )








parser$add_argument("-o", "--organization", type="character", help = "github organization", default = NULL)

parser$add_argument("-d", "--description", type="character", default = "It does some stuff")


parser$add_argument("--parent", help = "parent directory for project", default = getOption("projects.dir"))
parser$add_argument("--orcid", help = "author ORCiD", default = getOption("orcid"))

parser$add_argument("--codemeta", help = "create codemeta.json", action = "store_true", default = TRUE)







gh


outputFolder = args[[1]]
value = as.integer(args[[2]])
