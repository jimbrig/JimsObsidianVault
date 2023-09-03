---
ID: "2986fd99-033c-477a-a83b-f5fae36aa9af"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Robocopy.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Windows", "Development", "Development/Configuration"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-08-22 01:15
Last Modified Date: Sunday 22nd August 2021 01:15:38
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: Robocopy
Tags:
  [
    "#Windows",
    "#Development",
    "#Development/Configuration",
    "Development/Tools"
  ]
---

# Robocopy

> `robocopy` is amazing.

## Examples

```powershell
robocopy "C:\bin" "C:\Users\jimmy\OneDrive\Backups\bin" /E
```

*Note: the `/E` flag is used to recursively copy directory contents from one directory to another (including file data, attributes and timestamps).*



***

Links: [[Command Prompt - CMD]] | [[Windows]]

Sources: [Robocopy - Wikipedia](https://en.wikipedia.org/wiki/Robocopy)



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