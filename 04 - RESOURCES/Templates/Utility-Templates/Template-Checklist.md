---
Date Created: <% tp.file.creation_date("YYYY-MM-DD") %>
Date Modified: <% tp.file.last_modified_date("YYYY-MM-DD") %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Checklist", "#Type/List", "#Topic/Productivity", "#Status/WIP"  ]
Alias: [ "<% (tp.file.title).replace("Checklist - ", "") %>", "<% (tp.file.title).replace("Checklist - ", "") + ' Checklist' %>" ]
Type: Checklist
Topic: Unknown
Status: WIP
Sources: []
---

# <% (tp.file.title).replace("Checklist - ", "") + ' Checklist' %>

> [!SOURCE] Sources:
> - 

## Overview

<!-- [TOC] -->

*Example Flow Chart*

```mermaid
graph TB
	subgraph start[Getting Started]
		install[Installation]
		config[Configuration]
	end
	
	subgraph usage[Usage]
		example1[Example 1]
	end
	
	start --> usage
	install --> config	
```


## Steps



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