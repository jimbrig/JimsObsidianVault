---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://blog.r-hub.io/2022/09/12/r-dependency/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Minimum R Version Dependency in R Packages
  - Minimum R Version Dependency in R Packages
---
# Minimum R Version Dependency in R Packages

## Metadata
- Author: [[Transitive approach]]
- Full Title: Minimum R Version Dependency in R Packages
- Category: #Type/Highlight/Article
- URL: https://blog.r-hub.io/2022/09/12/r-dependency/

## Highlights
- On the opposite, other projects consider that packages are by default compatible with all R versions, until they explicitly add a feature associated with a new R version, or until tests prove it otherwise.
- So, a strategy could be to compute your package transitive minimum R version with the following function and decide that you can use base R features up to this version
