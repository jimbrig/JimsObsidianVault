---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/MOC", "#Topic/Undefined" ]
Alias: [ "<% (tp.file.title).replace("MOC - ", "") %>", "<% (tp.file.title).replace("MOC - ", "") + ' Map of Content' %>" ]
---

# <% (tp.file.title).replace("MOC - ", "") + ' Map of Content' %>

## Overview


## Notes

```dataview
list from [[]] and !outgoing([[]]) 
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