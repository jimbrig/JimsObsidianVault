---
Date Created: <% tp.file.creation_date("YYYY-MM-DD") %>
Date Modified: <% tp.file.last_modified_date("YYYY-MM-DD") %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Tool", "#Type/Tool/App", "#Topic/Software" ]
Alias: [ "<% (tp.file.title).replace("Tool - ", "") %>", "<% (tp.file.title).replace("Tool - ", "") + ' Application' %>" ]
---

# <% (tp.file.title).replace("Tool - ", "") %>  


## Overview

<!-- TOC -->

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
