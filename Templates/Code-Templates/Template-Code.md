---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: [ "<% (tp.file.title).replace("Code - ", "") %>" ]
---

# <% (tp.file.title).replace("Code - ", "") %>

> [!NOTE] About
> <% tp.file.cursor(1) %>

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

```shell

```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]

### External References



#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>

