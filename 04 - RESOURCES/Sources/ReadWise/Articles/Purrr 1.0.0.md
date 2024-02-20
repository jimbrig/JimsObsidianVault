---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://r-craft.org/r-news/purrr-1-0-0/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Purrr 1.0.0
  - Purrr 1.0.0
---
# Purrr 1.0.0

## Metadata
- Author: [[Posts | Tidyverse]]
- Full Title: Purrr 1.0.0
- Category: #Type/Highlight/Article
- URL: https://r-craft.org/r-news/purrr-1-0-0/

## Highlights
- With purrr, you can easily “kitten” your functions together to perform complex operations, “paws” for a moment to debug and troubleshoot your code, while “feline” good about the elegant and readable code that you write. Whether you’re a “cat”-egorical beginner or a seasoned functional programming “purr”-fessional, purrr has something to offer. So why not “pounce” on the opportunity to try it out and see how it can “meow”-velously improve your R coding experience?
- This is a big release, adding some long-needed functionality (like progress bars!) as well as really refining the core purpose of purrr.
- improvements to the map family, new
  keep_at() and
  discard_at() functions, and improvements to flattening and simplification
- There are four important changes that you should be aware of:
  pluck() behaves differently when extracting 0-length vectors.
  The
  map() family uses the tidyverse rules for coercion and recycling.
  All functions that modify lists handle NULL consistently.
  We’ve deprecated functions that aren’t related to the core purpose of purrr.
