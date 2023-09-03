---
ID: "de51ccad-d64f-48d9-9435-6d68308a339c"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "R - Packages for Viewing and Editing Data.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# R - Packages for Viewing and Editing Data

## Overview

### DataEditR

- [DataEditR]()

```R
install.packages("DataEditR")
library(DataEditR)
data_edit(iris)
```

![](https://miro.medium.com/max/700/1*D6T9pdO5k7YPYf6iXJ-R9w.png)

### editData

- [editData]()


```R
remotes::install_github(âcardiomoon/editDataâ)
require(editData)
editData(iris)
```

![](https://miro.medium.com/max/700/1*ln0M50NXO-hp_3GizN00JQ.png)

editData comes with the capacity to _add rows right from the viewer_

![](https://miro.medium.com/max/700/1*KSpZu2Oa_-Y-JT65pm_5bw.png)

***

#### Related

- [[Development]]
- [[2-Areas/MOCs/R]]


*Backlinks:*

```dataview
list from [[R - Packages for Viewing and Editing Data]] AND -"Changelog"
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