---
ID: "824e41db-0d3f-41e9-a28b-368686d3f3e7"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "R - Useful Basic R Housekeeping Commands.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Package", "Update", "List", "Package", "Unload", "R", "Update", "Miscellaneous", "Check", "Restart", "Related"]
Aliases:
  - "<% tp.file.title %>"
---


# R - Useful Basic R Housekeeping Commands

## Contents

- [[#Package Management|Package Management]]
	- [[#Update Packages|Update Packages]]
	- [[#List Outdated Packages|List Outdated Packages]]
	- [[#Package Version|Package Version]]
	- [[#Unload Packages|Unload Packages]]
- [[#R Administration|R Administration]]
	- [[#Update R|Update R]]
- [[#Miscellaneous|Miscellaneous]]
	- [[#Check size of object in memory|Check size of object in memory]]
	- [[#Restart RStudio|Restart RStudio]]
		- [[#Related|Related]]


## Package Management

### Update Packages

```R
update.packages()
```

### List Outdated Packages

```R
old.packages()
```

### Package Version

```R
packageVersion("dplyr")
```

### Unload Packages

```R
detach("package:dplyr", unload = TRUE)
```

## R Administration

### Update R

- Use [`installR`]() - *WINDOWS ONLY*

```R
library(installR)
updateR()
```

- Use [`updateR`](https://github.com/AndreaCirilloAC/updateR)

```R
remotes::install_github("AndreaCirilloAC/updateR")
library(updateR)
updateR(auto = TRUE, .Rprofile = NULL)
```

## Miscellaneous

### Check size of object in memory

```R
pryr::object_size(df)
```

### Restart RStudio

```R
.rs.restartR()
```



***

#### Related

- [[Development]]
- [[2-Areas/MOCs/R]]


*Backlinks:*

```dataview
list from [[R - Useful Basic R Housekeeping Commands]] AND -"Changelog"
```

***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>