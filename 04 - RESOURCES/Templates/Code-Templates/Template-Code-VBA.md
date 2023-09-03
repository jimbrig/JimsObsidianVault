---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev/VBA", "#Topic/Dev/Windows"]
Alias: [ "<% (tp.file.title).replace("VBA - ", "") %>" ]
---



# <% (tp.file.title).replace("VBA - ", "") %>

> [!source] Sources
> - *<% tp.file.cursor(2) %>*

<!-- TOC -->

## Code

*Link: <% tp.file.cursor(3) %>*

```vba
<% tp.file.cursor(1) %>
```

## Details

> Details about how the code works and what it accomplishes.

<% tp.file.cursor(4) %>


***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[Code/VBA/_README|VBA Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOC - Microsoft|Microsoft Windows]]
- [[MOC - Software|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>

