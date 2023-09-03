---
Date Created: 2023-08-30
Date Modified: 2023-08-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Topic/Dev/R", "#Type/Tool/R", "#Status/Permanent" ]
Alias: [ "S7" ]
Type: Tool
Topic: Dev/R
Status: Permanent
Sources: [ "https://cran.r-project.org/web/packages/S7/index.html" ]
---

# S7

> [!SOURCE] Sources:
> - *[CRAN - Package S7 (r-project.org)](https://cran.r-project.org/web/packages/S7/index.html)*
> - *[RConsortium/OOP-WG: S7: a new OO system for R (github.com)](https://github.com/rconsortium/OOP-WG/)*
> - *[An Object Oriented System Meant to Become a Successor to S3 and S4 • S7 (rconsortium.github.io)](https://rconsortium.github.io/OOP-WG/)*

## Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
	- [Properties](#properties)
	- [Generics and Methods](#generics-and-methods)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

- **S7** is a new [[OOP]] system designed to be a successor to [[S3]] and [[S4]]. 
- It has been designed and implemented collaboratively by the [[R Consortium]] [[Object-Oriented Programming]] Working Group, which includes representatives from [[R-Core]], [[Bioconductor]], the [[Tidyverse]], [[Posit]], and the wider R community.
- S7 is somewhat experimental; we are confident in the design but it has relatively little usage in the wild currently. 
- We hope to avoid any major breaking changes, but reserve the right if we discover major problems.

## Installation

```R
pak::pak("S7")
```

## Usage

The example below illustrates creating a new *S7 Class Object*.

> [!NOTE] Note
> `S7` classes have a formal definition, which includes a list of properties and an optional validator. Use `new_class()` to define new classes with `S7`.

```R
library(S7)

range <- new_class("range",
  properties = list(
    start = class_double,
    end = class_double
  ),
  validator = function(self) {
    if (length(self@start) != 1) {
      "@start must be length 1"
    } else if (length(self@end) != 1) {
      "@end must be length 1"
    } else if (self@end < self@start) {
      "@end must be greater than or equal to @start"
    }
  }
)
```

- `[new_class()](https://rconsortium.github.io/OOP-WG/reference/new_class.html)` returns the class object, which is also the constructor you use to create instances of the class:

```R
x <- range(start = 1, end = 10)
x
```

### Properties

The data possessed by an object is called its **properties**. Use `@` to get and set properties:

```
x@start
#> [1] 1
x@end <- 20
x
#> <range>
#>  @ start: num 1
#>  @ end  : num 20
```

Properties are automatically validated against the type declared in `[new_class()](https://rconsortium.github.io/OOP-WG/reference/new_class.html)` (`double` in this case), and with the class **validator**:

```
x@end <- "x"
#> Error: <range>@end must be <double>, not <character>
x@end <- -1
#> Error: <range> object is invalid:
#> - @end must be greater than or equal to @start
```

### Generics and Methods

Like [[S3]] and [[S4]], S7 uses **functional OOP** where methods belong to **generic** functions, and method calls look like all other function calls: `generic(object, arg2, arg3)`. This style is called functional because from the outside it looks like a regular function call, and internally the components are also functions.

Use `[new_generic()](https://rconsortium.github.io/OOP-WG/reference/new_generic.html)` to create a new generic: the first argument is the generic name (used in error messages) and the second gives the arguments used for dispatch. The third, and optional argument, supplies the body of the generic. This is only needed if your generic has additional arguments that aren’t used for method dispatch.

```R
inside <- new_generic("inside", "x")
```

Once you have a generic, you can define a method for a specific class with `method<-`:

```R
# Add a method for our class
method(inside, range) <- function(x, y) {
  y >= x@start & y <= x@end
}

inside(x, c(0, 5, 10, 15))
```

***

## Appendix: Links and References

*Note created on [[2023-08-30]] and last modified on [[2023-08-30]].*

### Internal Linked Notes

- [[R Packages]]
- [[R - S3]]
- [[R - S4]]
- [[R - R6]]
- [[03 - AREAS/Tools/_README|Tools]]


### External References

#### Backlinks

```dataview
list from [[R - rworkflows]] AND -"CHANGELOG" AND -"03 - AREAS/Tools/Tools - R/R - rworkflows"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023