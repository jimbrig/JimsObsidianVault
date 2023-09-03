---
ID: "daf0a1b1-d3cf-4c99-ba2d-b0475baf7ab8"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Memory in R.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Development/R", "Development"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-08-04 17:26
Last Modified Date: Wednesday 4th August 2021 17:26:32
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: Memory-in-R
Tags: [ "#Development/R", "#Development" ]
---

# Memory in R

[[MOC - R|R]] breaks down memory usage into `Vcells` (memory used by vectors) and `Ncells` (memory used by everything else).

However, neither this distinction nor the `gc trigger` and `max used` columns are typically important. What weâre usually most interested in is the the first column: the total memory used.

A helpful function one can use for this is `pryr::mem_used` which wraps around `gc()` to return the total amount of memory (in megabytes) currently used by R.

`pryr::object_size()` is another helpful function which works similarly to `utils::object.size()` but counts more accurately and includes the size of environments. 

`pryr::compare_size` makes it easy to compare the output of `object_size` and `object.size`.

***

Links: [[MOC - R]] | [[RStudio Configuration Notes]]

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