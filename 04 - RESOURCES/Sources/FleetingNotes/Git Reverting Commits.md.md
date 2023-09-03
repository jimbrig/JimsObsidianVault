---
ID: "b77f5f37-aab5-4953-98f2-ae51d8df3238"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Git Reverting Commits.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# Git Reverting Commits

*Source: [dev-notes/git-checkout-remote-branch.md at main Â· brotherkaif/dev-notes (github.com)](https://github.com/brotherkaif/dev-notes/blob/main/git/git-remove-commits.md)*

## Revert and Keep Changes


> [!NOTE] 
> This solution works if the commit to be removed is the last committed one.

- Copy the commit reference you like to go back to from the log:

```bash
git log
```

- Reset git to the commitâs reference:

```bash
git reset <commit_ref>
```

- Stash/Store the local changes from the wrong commit to use later after pushing to remote:

```bash
git stash
```

- Push the changes to remote repository, (`-f` or `--force`):

```bash
git push -f
```

- Get back the stored changes to local repository:

```bash
git stash apply
```

- In case you have untracked/new files in the changes, you need to add them to git before committing:

```bash
git add .
```

- Add whatever extra changes you need, then commit the needed files, (or use a dot '.' instead of stating each file name, to commit all files in the local repository:

```bash
git commit -m "<new_commit_message>" <file1> <file2> ...
```

or,

```bash
git commit -m "<new_commit_message>" .
```

***

## Appendix: Links and References

- [[2022-09-04]]
- [[03 - AREAS/Tools/Tools - Version Control/Git]]

*Backlinks:*

```dataview
list from [[Git Reverting Commits]] AND -"Changelog"
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