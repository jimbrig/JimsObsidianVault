---
Date: 2023-10-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Note"
  - "#Topic/Dev/R"
Aliases:
  - tidyeval
  - tidy evaluation
  - programming with dplyr
---

# R - Tidy Evaluation and Programming with dplyr

> [!SOURCE] Sources
> - *[Programming with dplyr • dplyr (tidyverse.org)](https://dplyr.tidyverse.org/articles/programming.html)*
> - *[Package Building (jthomasmock.github.io)](https://jthomasmock.github.io/pkg-building/#43)*
> - *[rlang 0.4.0 (tidyverse.org)](https://www.tidyverse.org/blog/2019/06/rlang-0-4-0/#a-simpler-interpolation-pattern-with)*
> - *[Introduction | Advanced R (hadley.nz)](https://adv-r.hadley.nz/metaprogramming.html)*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

Most [[R Package - dplyr|dplyr]] verbs use *tidy evaluation*, a special type of *non-standard evaluation* used throughout the [[Tidyverse]].

This is how packages such as [[dplyr]] the ability to accept unquoted function arguments representing data frame columns and not objects.

For example, the code below knows where and how to find the `cyl` column (not object) and also knows how to find the `mpg` column (not objects):

```R
mtcars |>
	dplyr::group_by(cyl) |>
	summarize(n = n(), mean = mean(mpg))
```

An easy method to get the most from tidy evaluation is working with two concepts:

1. Embrace variables with `{{ var }}` brackets.
2. Pass the dots with `...` for many arguments.

> [!TIP] Tip
> You can always revert back to using `rlang`'s `.data[[var]]` syntax is you want to use "strings" instead of bare columns.

```R
library(dplyr)
car_summary <- function(var) {
	mtcars |>
		group_by({{var}}) |>
		  summarize(
			  mean = mean(mpg),
			  n = n()
		)
}
```

```R
library(dplyr)
car_summary_dots <- function(...) {
  mtcars |>
    group_by(...) |> 
    summarize(
      mean = mean(mpg),
      n = n(),
      .groups = "drop"
    )
}
```

```R
library(dplyr)
my_car_summary_dots2 <- function(var, ...){
  mtcars |>
    group_by({{var}}) |> 
    summarize(
      mean = mean(mpg),
      n = n(),
      ...,
      .groups = "drop"
    )
}
```

```R
var_summary <- function(data, var) {
  data |>
    summarise(
      n = n(), 
      min = min({{ var }}), 
      max = max({{ var }}),
      .groups = "drop")
}
```

`rlang` approach:

```R
var_summary2 <- function(data, var) {
  data |>
    summarise(n = n(), 
              min = min(.data[[var]]), 
              max = max(.data[[var]]),
              .groups = "drop")
}
```


***

## Appendix: Links and References

*Note created on [[2023-10-10]] and last modified on [[2023-10-10]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[R - Tidy Evaluation and Programming with dplyr]] AND -"CHANGELOG" AND -"00 - INBOX/R - Tidy Evaluation and Programming with dplyr"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

