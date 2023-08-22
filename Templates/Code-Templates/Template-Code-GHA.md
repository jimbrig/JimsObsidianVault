---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GitHub", "#Type/Code/YAML", "#Topic/Dev/DevOps"]
Alias: [ "<% (tp.file.title).replace("GHA - ", "") %>" ]
---

# <% (tp.file.title).replace("GHA - ", "") %>

> [!NOTE] About
> <% tp.file.cursor(1) %>

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

```yaml

```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[Code/YAML/GitHub Actions/_README|GitHub Action Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOC - Software|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>

