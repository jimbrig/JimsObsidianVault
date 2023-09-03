---
ID: "68745efb-6532-4800-b0a7-cfce874302e9"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Code Comments.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Development"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-08-04 15:59
Last Modified Date: Wednesday 4th August 2021 15:59:39
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: Code-Comments
Tags: ["#Development"]
---

# Code Comments

![Code Comments](https://www.donnfelker.com/wp-content/uploads/2019/10/Screen-Shot-2019-10-25-at-1.31.41-PM-1024x479.png)

When itâs it appropriate to comment code?

I follow a simple set of rules:

1.  ==If the code is confusing â I try to refactor the code so that itâs not confusing anymore.==
2.  ==If a refactoring is not possible, **I document the âwhyâ**, not the âhowâ. The âhowâ is already documented: thatâs the code.==

**The âwhyâ explains WHY the code exists** and perhaps some _important and relevant details_ that might not be evident to future maintainers.

_How do I know if I should provide a âwhyâ?_

I ask myself this question:

> In six months will I be able to understand this code in 30 seconds?

If there is any doubt in my mind then I know that I need to provide a comment for that chunk of code.

_Why 30 seconds?_

==The majority of my time as a developer will be spent reading and deciphering existing code. I need to be able to do this as quickly as possible to be efficient. If a comment helps me grok something quickly due to some weird edge-case complexity, then the comment is worth its weight in gold.==


***

Links: [[Dann Felker.md]] | [[../3-Resources/Highlights/Highlights - Code Comments.md]]

Sources: [Code Comments - DONN FELKER](https://www.donnfelker.com/code-comments/)



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