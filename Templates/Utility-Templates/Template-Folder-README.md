---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Readme", "#Topic/Meta"  ]
Alias: [ "<% tp.file.folder(false) %>" ]
---

# <% tp.file.folder(false) %>

> [!NOTE] About
> This folder houses <% tp.file.cursor(1) %>.

## Overview

## Contents

```dataview
LIST FROM "<% tp.file.folder(true) %>" AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/_README"
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

