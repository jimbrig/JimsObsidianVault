#!/usr/bin/env Rscript

# parse inputs
.libPaths("C:/Users/Jimmy Briggs/.R/lib/4.0")

doc <- "Usage:
    pak [install] [--deployment]
    pak init
    pak add <package>... [--remote=<remote>]..."

opts <- docopt::docopt(doc)

if (opts$add) {
  pak::pak(opts$package)
}

# args <- commandArgs()

# pak::pak(args[[1]])

