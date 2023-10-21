

# r-hub/sysreqs package ---------------------------------------------------

pak::pak("r-hub/sysreqs")
library(sysreqs)

# we will use tidyverse as an example package
pkg <- "tidyverse"

# pull DESCRIPTION from installation folder of package
dsc <- desc::description$new(fs::path(.libPaths()[1], pkg, "DESCRIPTION"))

# get sysreqs from description and for linux platform
reqs <- sysreqs:::get_sysreqs(dsc$get("SystemRequirements"),
                              platform = "r-release-linux-x86_64")

# https://github.com/r-hub/sysreqs/blob/master/R/sysreqs.R
get_sysreqs_simple <- function(pkg) {
  dsc <- desc::description$new(fs::path(.libPaths()[1], pkg, "DESCRIPTION"))
  sysreqs:::get_sysreqs(dsc$get("SystemRequirements"), platform = "r-release-linux-x86_64")
}

get_sysreqs_simple("dplyr")

??sysreqs

dep::get_sysreqs(c("dplyr", "tidyr"))

sysreqqs <- function(pkgs) {

  platform <- "linux-x86_64-debian-gcc"
  if( is.null(pkgs) ) return(NULL)
  paste0('https://sysreqs.r-hub.io/pkg/',
         paste(pkgs, collapse= ','),
         '/',
         platform) %>%
    httr::GET() %>%
    httr::content(type = 'application/json', as = 'parsed') %>%
    unlist()

}



sysreqqs(pkgs = c("magick", "sf"))

get_sysreqs(pkgs = c('magick', 'sf'))
get_sysreqs('tidyverse')
get_sysreqs('fortune')
get_sysreqs(NULL)

make_sysreqs_install_instructions <- function(pkgs = 'sf') {
  sysreqs_install_lines <-
    c(
      "export DEBIAN_FRONTEND=noninteractive",
      "apt-get -y update",
      "apt-get install -y",
      paste(get_sysreqs(pkgs))
    )
  paste(sysreqs_install_lines, sep = "\n")
}

## from: list of rocker base images to start from

use_dockerfile <-
  function(
    from = c('r-ver', 'verse', 'shinyverse', 'spatial'),
    r_version = paste(getRversion(), sep = '.')
  ){

    dockerfile_lines <-
      c(
        paste0('FROM ', 'rocker/', from[1], ':', r_version),
        "RUN echo \"options(repos = c(CRAN = 'https://cran.rstudio.com/'), prompt='R > ', download.file.method = 'libcurl')\" > /.Rprofile",
        "ENV R 'R --no-environ --no-site-file --no-restore --quiet --no-save'",
        "RUN $R -e \"source('https://install-github.me/cole-brokamp/dep@0.1.1')\"",
        ## paste('RUN', make_sysreqs_install_instructions()),
        "COPY DESCRIPTION /code/",
        "RUN $R -e \"dep::loy('/code')\"",
        ## RUN useradd --create-home coder
        ## WORKDIR /home/coder
        ## USER coder
        "COPY . /code",
        "WORKDIR /code",
        "CMD [ \"R\", \"--quiet --no-save --no-restore\" ]"
      )

    cat(dockerfile_lines, file = 'Dockerfile', sep = '\n')

  }

use_docker_compose_file <-
  function(){
    ## TODO: write function that will create docker-compose file
    ## this would autofill in the correct defaults for "docker run" and also map $PWD to /code in the container
  }

# sysreqs::current_platform()
