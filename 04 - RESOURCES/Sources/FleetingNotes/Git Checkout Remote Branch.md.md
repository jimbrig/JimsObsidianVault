---
ID: "924be276-bbef-4a5e-bc94-ca06ed854a5e"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Git Checkout Remote Branch.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["With", "With", "Appendix"]
Aliases:
  - "<% tp.file.title %>"
---


# Git Checkout Remote Branch

*Source: [dev-notes/git-checkout-remote-branch.md at main Â· brotherkaif/dev-notes (github.com)](https://github.com/brotherkaif/dev-notes/blob/main/git/git-checkout-remote-branch.md)*

## Contents

- [[#With One Remote|With One Remote]]
- [[#With Greater than One Remotes|With Greater than One Remotes]]
- [[#Appendix: Links and References|Appendix: Links and References]]


## With One Remote

With [[03 - AREAS/Tools/Tools - Version Control/Git]] versions â¥ 1.6.6, with only one remote, you can do:

```bash
git fetch
git checkout test
```

`git checkout test` will *NOT* work in modern git if you have multiple remotes. 

In this case use:

```bash
git checkout -b test <name of remote>/test
```

Or the shorthand:

```bash
git checkout -t <name of remote>/test
```

## With Greater than One Remotes

Before you can start working locally on a remote branch, you need to fetch it.

To fetch a branch, you simply need to:

```bash
git fetch origin
```

This will fetch all of the remote branches for you. You can see the branches available for checkout with:

```bash
git branch -v -a
```

With the remote branches in hand, you now need to check out the branch you are interested in, giving you a local working copy:

```bash
git checkout -b test origin/test
```

***

## Appendix: Links and References

- [[2022-09-04]]
- [[03 - AREAS/Tools/Tools - Version Control/Git]]

*Backlinks:*

```dataview
list from [[Git Checkout Remote Branch]] AND -"Changelog"
```

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022



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