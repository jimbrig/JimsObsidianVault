FROM rocker/r-base:latest

RUN apt-get update -qq && apt-get install -y \
    libssl-dev \
    libcurl4-gnutls-dev

# install R package
ENV RENV_VERSION 0.10.0-26
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

COPY plumbpkg /tmp/plumbpkg
RUN R -e "renv::install('/tmp/plumbpkg')"

COPY start_api.R /start_api.R

EXPOSE 8000

# set entry point
ENTRYPOINT ["Rscript", "entrypoint.R"]
