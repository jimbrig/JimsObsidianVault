---
Date Created: <% tp.file.creation_date("YYYY-MM-DD") %>
Date Modified: <% tp.file.last_modified_date("YYYY-MM-DD") %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Video" ]
Alias: [ "<% (tp.file.title).replace("YouTube - ", "") %>", "<% (tp.file.title).replace("Video - ", "") %>" ]
---

# <% tp.file.title %>

> [!SOURCE] Sources
> - **

## Video

<!-- iframe for the youtube video 
Example:

<iframe title="<Title>" src="<Embed Link>" height="113" width="200" allowfullscreen="" allow="fullscreen" style="aspect-ratio: 1.76991 / 1; width: 100%; height: 100%;"></iframe>

-->

## Notes



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