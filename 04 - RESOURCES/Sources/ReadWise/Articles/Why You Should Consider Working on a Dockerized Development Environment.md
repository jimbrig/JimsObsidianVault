---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://www.brodrigues.co/blog/2023-05-08-dock_dev_env/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Why You Should Consider Working on a Dockerized Development Environment", "Why You Should Consider Working on a Dockerized Development Environment"]
---
# Why You Should Consider Working on a Dockerized Development Environment

## Metadata
- Author: [[brodrigues.co]]
- Full Title: Why You Should Consider Working on a Dockerized Development Environment
- Category: #Type/Highlight/Article
- URL: https://www.brodrigues.co/blog/2023-05-08-dock_dev_env/

## Highlights
- In this blog post, I’ll discuss something that I’ve been trying for some time now: working directly from a dockerized environment. The idea is to have a Docker image that comes with R, all the usual packages I use for development, Quarto, a LaTeX distribution (that I installed with `{tinytex}`) and finally, my IDE of choice, Spacemacs (if you use RStudio, just read on, I’ll explain how you can achieve the same thing but with RStudio instead). ([View Highlight](https://read.readwise.io/read/01h0955vkscy1tfbmg7f6mfcpn))
- If I want to dockerize a `{targets}` pipeline, I can write a new Dockerfile that builds upon this image which ensures that there are no discrepancies between the development environment and the production environment. And because I’m building the image on top of a Rocker image, everything just work. If I need to install a package that might be tricky to install (for example, a package that depends on `{rJava}`, using Docker might be the simplest way to get it to work. ([View Highlight](https://read.readwise.io/read/01h09568fdjh7qm6t63whcg1g0))
- So, here’s the Dockerfile: ([View Highlight](https://read.readwise.io/read/01h0956bvqw53mxafrmkvhj9cp))
- # This builds upon the Rocker project's versioned image for R version 4.3 FROM rocker/r-ver:4.3 # install `gpg-agent` and `software-properties-common` which are needed to add an Ubuntu ppa to install Emacs RUN apt-get update \ && apt-get install -y --no-install-recommends \ gpg-agent software-properties-common # add the ppa which includes the latest version of Emacs RUN add-apt-repository ppa:kelleyk/emacs # Install `git`, `wget` and the latest `Emacs` RUN apt-get update \ && apt-get install -y --no-install-recommends \ git \ wget \ emacs28-nox # Install spacemacs by cloning its repository RUN git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d # Download my .spacemacs config file RUN wget https://raw.githubusercontent.com/b-rodrigues/dotfiles/master/dotfiles/.spacemacs -O ~/.spacemacs # This launches emacs in daemon mode. This is needed to initialize spacemacs. # Running it in daemon mode is required because a Dockerfile must be setup non-interactively RUN emacs --daemon # Install a bunch of Ubuntu dependencies. These are typical dependencies required to use some # R packages on Linux. RUN apt-get update \ && apt-get install -y --no-install-recommends \ aspell \ aspell-en \ aspell-fr \ aspell-pt-pt \ libfontconfig1-dev \ libglpk-dev \ libxml2-dev \ libcairo2-dev \ libgit2-dev \ default-libmysqlclient-dev \ libpq-dev \ libsasl2-dev \ libsqlite3-dev \ libssh2-1-dev \ libxtst6 \ libcurl4-openssl-dev \ libharfbuzz-dev \ libfribidi-dev \ libfreetype6-dev \ libpng-dev \ libtiff5-dev \ libjpeg-dev \ libxt-dev \ unixodbc-dev \ pandoc # Download the latest version of Quarto RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.340/quarto-1.3.340-linux-amd64.deb -O ~/quarto.deb # Install the latest version of Quarto RUN apt-get install --yes ~/quarto.deb # Remove the installer RUN rm ~/quarto.deb # Create a directory to host my projects RUN mkdir /root/projects/ # Write a bunch of lines to the .Rprofile # This makes sure that the httpgd server runs on localhost and on the port 8888 RUN echo 'options(httpgd.host = "0.0.0.0", httpgd.port = 8888, httpgd.token = "aaaaaaaa")' >> /root/.Rprofile # This option clones renv cache folders inside the root folder of the projects. This makes # sure that they stay persistent across reboots. RUN echo 'options(renv.config.cache.symlinks = FALSE)' >> /root/.Rprofile # Serve shiny apps through localhost and port 8888 RUN echo 'options(shiny.host = "0.0.0.0", shiny.port = 8888)' >> /root/.Rprofile # Set the CRAN package repositories to the PPPM at the 28th of April RUN echo 'options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/cran/__linux__/jammy/2023-04-28"))' >> /root/.Rprofile # Install the usual packages I use RUN R -e "install.packages(c('quarto', 'remotes', 'tinytex', 'tidyverse', 'arrow', 'chronicler', 'janitor', 'targets', 'tarchetypes', 'openxlsx', 'shiny', 'flexdashboard', 'data.table', 'httpgd', 'blogdown', 'bookdown'))" # Install the g2r package (not yet available on CRAN) RUN R -e "remotes::install_github('devOpifex/g2r')" # Install a LaTeX distro using tinytex RUN R -e "tinytex::install_tinytex()" # Install hugo for blogging RUN R -e "blogdown::install_hugo()" # Expose port 8888 EXPOSE 8888 ([View Highlight](https://read.readwise.io/read/01h0956gcgjv3deyzae0wjhv7z))
- first, why use a versioned image, and why use the PPPM at a specific date? ([View Highlight](https://read.readwise.io/read/01h0957e15amgp8y8wa0fhza8z))
- Then, what’s with all the options that I write to the `.Rprofile`? Well, don’t forget that when I will be running the Docker container defined by this image, I will be using Emacs inside a terminal. So if I want to see plots for example, I need to use the `{httpgd}` package. This package provides a graphics device that runs on a web server, so if I tell `{httpgd}` to serve the images over port `8888`, and then expose this port in the Dockerfile, I can access `{httpgd}` from my web browser by pointing it to `http://localhost:8888`. ([View Highlight](https://read.readwise.io/read/01h0957wv11xdsb6xxv05jf43z))