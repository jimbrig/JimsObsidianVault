---
ID: "e09dd313-01ac-4856-aa34-22192cc14bab"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Windows Batch Scripting Common Shortcuts.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# Windows Batch Scripting Common Shortcuts

*Sources: https://ss64.com/nt/syntax-args.html | https://superuser.com/questions/224416/what-do-df0-and-df1-mean-in-a-batch-file*

*See Also: [[Batch - Magic Variables]]*

## List of Common Shortcuts

`%~f1` - expands `%1` to a Fully qualified path name - C:\utils\MyFile.txt

`%~d1` - expands `%1` to a Drive letter only - C:

`%~p1` - expands `%1` to a Path only - \utils\

`%~n1` - expands `%1` to a file Name, or if only a path is present (with no trailing backslash) - the last folder in that path

`%~x1` - expands `%1` to a file eXtension only - .txt

`%~s1` - changes the meaning of `f`, `n` and `x` to reference the Short name (see note below)

`%~1` - expand `%1` removing any surrounding quotes (")

`%~a1` - display the file attributes of `%1`

`%~t1` - display the date/time of `%1`

`%~z1` - display the file size of `%1`

`%~$PATH:1` - search the `PATH` environment variable and expand `%1` to the fully qualified name of the first match found.

The modifiers above can be combined:

`%~dp1` - expands `%1` to a drive letter and path only

`%~nx2` - expands `%2` to a file name and extension only

***

## Appendix: Links

- [[Code]]
- [[Development]]
- [[2-Areas/Code/Windows/_README|Windows]]
- [[Microsoft DOS]]
- [[Batch Scripting Tips and Tricks]]
- [[CLI Tools List]]
- [[Add a GUI to Batch File Scripts on Windows]]
- [[Batch - Magic Variables]]

*Backlinks:*

```dataview
list from [[Windows Batch Scripting Common Shortcuts.md]] AND -"Changelog"
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