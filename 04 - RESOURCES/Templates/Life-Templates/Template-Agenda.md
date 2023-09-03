---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: 
  - Type/Agenda
  - Type/Project/Support
Alias: [ "<% tp.file.title %>" ]
Status: Triage
Done: false
Priority: 0
Cover:
Due-Date: {{date}}
Project-Exclude: false
---

# <% tp.file.title %>

> [!NOTE] 
> - **Meeting Date: <% tp.date.now() %>**
> - **Participants:**
> 	- Myself

## Agenda

1. Agenda

## Meeting Notes

- Notes

## To Do

- [ ] Triage/Follow-Up 

***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

- [[Life/Projects/_README|Projects]]

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"Changelog" AND -"<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>