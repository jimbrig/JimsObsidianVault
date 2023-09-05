---
Date Created: 2023-08-30
Date Modified: 2023-08-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Topic/Dev/R", "#Type/Tool/R", "#Status/Permanent" ]
Alias: [ "rworkflows" ]
Type: Tool
Topic: Dev/R
Status: Permanent
Sources: [ "https://cran.r-project.org/web/packages/rworkflows/index.html" ]
cssclasses:
Cover:
---

# rworkflows

> [!SOURCE] Sources:
> - *[CRAN - Package rworkflows (r-project.org)](https://cran.r-project.org/web/packages/rworkflows/index.html)*
> - *[neurogenomics/rworkflows: Continuous integration for R packages. Automates testing, documentation website building, and containerised deployment. (github.com)](https://github.com/neurogenomics/rworkflows)*
> - *[Test, Document, Containerise, and Deploy R Packages • rworkflows (neurogenomics.github.io)](https://neurogenomics.github.io/rworkflows/)*

## Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Documentation](#documentation)
- [GitHub Secrets](#github-secrets)
- [Dependency Graph](#dependency-graph)
- [See Also](#see-also)


## Overview

**rworkflows** is an [[R Package]] dedicated to designing *robust, reusable, and flexible actions specifically for the development of [[R Packages]].*

Currently `rworkflows` supports the following tasks:

1. Builds [[Docker]] Container to run subsequent steps within
2. Builds and checks your R package (with [**CRAN**](https://cran.r-project.org/) and/or [**Bioconductor**](https://bioconductor.org/) checks).
2. Runs [unit tests](https://testthat.r-lib.org/).
3. Runs [code coverage tests](https://covr.r-lib.org/) and uploads the results to [**Codecov**](https://about.codecov.io/).
4. (Re)builds and launches a documentation website for your R package.
5. Pushes an [**Rstudio**](https://posit.co/) [**Docker**](https://www.docker.com/) container to [**DockerHub**](https://hub.docker.com/) with your R package and all its dependencies pre-installed.

Importantly, this **workflow** is designed to work with any R package out-of-the-box. This means you won’t have to manually edit any [[YAML]] files, just run the `rworkflows::use_workflow()` function and you’re ready to go!

> [!NOTE] Note:
> **Note**: `rworkflows` uses, was inspired by, and benefits from the work of many other projects, especially:  
[`biocthis`](https://github.com/lcolladotor/biocthis), [`usethis`](https://github.com/r-lib/usethis), [`actions/`](https://github.com/actions), [`r-lib/actions`](https://github.com/r-lib/actions), [`bioc-actions`](https://github.com/grimbough/bioc-actions), [`JamesIves/github-pages-deploy-action`](https://github.com/JamesIves/github-pages-deploy-action), [`docker/build-push-action`](https://github.com/docker/build-push-action), [`bioconductor_docker`](https://github.com/Bioconductor/bioconductor_docker). For more details on how these projects relate to `rworkflows`, please see [below](https://github.com/neurogenomics/rworkflows#acknowledgments).

## Quick Start

- Install and create the workflow in your R package’s project folder.

```R
if(!require("rworkflows")) pak::pak("rworkflows")

path <- rworkflows::use_workflow()
```

- Push to [[GitHub]], and let everything else run automatically! You can check the status of your workflow by clicking on the _Actions_ tab in your GitHub repo.

```bash
git add .
git commit -m "Added rworkflows"
git push
```

> [!NOTE] Note:
> If you want to skip running **GitHub Actions** on a particular push, simply add “[skip ci]” somewhere in the commit message, e.g.: `git commit -m "Update README [skip ci]"`

## Documentation

- [Getting Started Vignette](https://neurogenomics.github.io/rworkflows/articles/rworkflows.html)
- [rworkflows: taming the Wild West of R packages (youtu.be)](https://youtu.be/nLIG2prEmCg)

> [!video]- View Video
> <iframe title="rworkflows: taming the Wild West of R packages" src="https://www.youtube.com/embed/nLIG2prEmCg?feature=oembed" height="113" width="200" allowfullscreen="" allow="fullscreen" style="aspect-ratio: 1.76991 / 1; width: 100%; height: 100%;"></iframe>

## GitHub Secrets

Before pushing changes to your new R package, you will need to set up one or more [GitHub Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets):

- `PAT_GITHUB` [Required]: Speeds up installations and gives access to private repos on GitHub Actions. You can generate your very own Personal Authentication Token with `usethis::create_github_token()`. See the [GitHub docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) for details.
- `DOCKER_TOKEN` [Optional]: Allows GitHub Actions to push to a [DockerHub](https://hub.docker.com/) account.

## Dependency Graph

Interactive graph showing all the GitHub repos that currently use the `rworkflows` action.

See [Dependency graph • rworkflows (neurogenomics.github.io)](https://neurogenomics.github.io/rworkflows/articles/depgraph).

## See Also

- [[03 - AREAS/Tools/Tools - R/R - usethis|usethis]] ([r-lib/usethis: Set up commonly used 📦 components (github.com)](https://github.com/r-lib/usethis))
- [GitHub Actions](https://github.com/actions)
- [r-lib/actions: GitHub Actions for the R community](https://github.com/r-lib/actions)
- [grimbough/bioc-actions: GitHub Actions for developing and maintaining Bioconductor packages](https://github.com/grimbough/bioc-actions)
- [JamesIves/github-pages-deploy-action: 🚀 Automatically deploy your project to GitHub Pages using GitHub Actions. This action can be configured to push your production-ready code into any branch you'd like.](https://github.com/JamesIves/github-pages-deploy-action)
- [docker/build-push-action: GitHub Action to build and push Docker images with Buildx](https://github.com/docker/build-push-action)
- [Bioconductor/bioconductor_docker: Docker Containers for Bioconductor - NEW! (github.com)](https://github.com/Bioconductor/bioconductor_docker)
- [combiz/scFlow: Single-cell/nuclei RNA-seq analysis tools in R for a complete workflow. (github.com)](https://github.com/combiz/scFlow)
- [[GitHub Actions CLI (act)]] ([nektos/act: Run your GitHub Actions locally 🚀](https://github.com/nektos/act))

***

## Appendix: Links and References

*Note created on [[2023-08-30]] and last modified on [[2023-08-30]].*

### Internal Linked Notes

- [[GitHub Actions CLI (act)]]
- [[R Packages]]
- [[03 - AREAS/Tools/_README|Tools]]
- [[03 - AREAS/Tools/Tools - R/R - usethis|usethis]]
- [[GitHub Actions]]

### External References

#### Backlinks

```dataview
list from [[R - rworkflows]] AND -"CHANGELOG" AND -"03 - AREAS/Tools/Tools - R/R - rworkflows"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023