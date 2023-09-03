---
ID: "fc2e9958-3b28-4b3c-8c75-ca6def19aa10"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Using Git Worktree.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["YouTube", "Description", "Examples"]
Aliases:
  - "<% tp.file.title %>"
---


# Using Git Worktree

*Source: [Git - git-worktree Documentation (git-scm.com)](https://git-scm.com/docs/git-worktree)*

## Contents

- [[#YouTube Video|YouTube Video]]
- [[#Description|Description]]
- [[#Examples|Examples]]


## YouTube Video

*Source: [Git's Best And Most Unknown Feature - YouTube](https://www.youtube.com/watch?v=2uEqYw-N8uE)*

<details><summary>View Video:</summary><p>
<iframe title="Git's Best And Most Unknown Feature" src="https://www.youtube.com/embed/2uEqYw-N8uE?feature=oembed" height="113" width="200" allowfullscreen="" allow="fullscreen" style="aspect-ratio: 1.76991 / 1; width: 100%; height: 100%;"></iframe>	
</p></details>



## Description

Manage multiple working trees attached to the same repository.

A git repository can support multiple working trees, allowing you to check out more than one branch at a time. WithÂ `git worktree add`Â a new working tree is associated with the repository, along with additional metadata that differentiates that working tree from others in the same repository. The working tree, along with this metadata, is called a "worktree".

This new worktree is called a "linked worktree" as opposed to the "main worktree" prepared byÂ [git-init[1]](https://git-scm.com/docs/git-init)Â orÂ [git-clone[1]](https://git-scm.com/docs/git-clone). A repository has one main worktree (if itâs not a bare repository) and zero or more linked worktrees. When you are done with a linked worktree, remove it withÂ `git worktree remove`.

In its simplest form,Â `git worktree add <path>`Â automatically creates a new branch whose name is the final component ofÂ `<path>`, which is convenient if you plan to work on a new topic. For instance,Â `git worktree add ../hotfix`Â creates new branchÂ `hotfix`Â and checks it out at pathÂ `../hotfix`. To instead work on an existing branch in a new worktree, useÂ `git worktree add <path> <branch>`. On the other hand, if you just plan to make some experimental changes or do testing without disturbing existing development, it is often convenient to create aÂ _throwaway_Â worktree not associated with any branch. For instance,Â `git worktree add -d <path>`Â creates a new worktree with a detachedÂ `HEAD`Â at the same commit as the current branch.

If a working tree is deleted without usingÂ `git worktree remove`, then its associated administrative files, which reside in the repository (see "DETAILS" below), will eventually be removed automatically (seeÂ `gc.worktreePruneExpire`Â inÂ [git-config[1]](https://git-scm.com/docs/git-config)), or you can runÂ `git worktree prune`Â in the main or any linked worktree to clean up any stale administrative files.

If the working tree for a linked worktree is stored on a portable device or network share which is not always mounted, you can prevent its administrative files from being pruned by issuing theÂ `git worktree lock`Â command, optionally specifyingÂ `--reason`Â to explain why the worktree is locked.

## Examples

You are in the middle of a refactoring session and your boss comes in and demands that you fix something immediately. You might typically useÂ [git-stash[1]](https://git-scm.com/docs/git-stash)Â to store your changes away temporarily, however, your working tree is in such a state of disarray (with new, moved, and removed files, and other bits and pieces strewn around) that you donât want to risk disturbing any of it. Instead, you create a temporary linked worktree to make the emergency fix, remove it when done, and then resume your earlier refactoring session.

```bash
git worktree add -b emergency-fix ../temp master
pushd ../temp
# ... hack hack hack ...
git commit -a -m 'emergency fix for boss'
popd
git worktree remove ../temp
```

***

## Appendix: Links and References

- [[2022-09-04]]
- [[03 - AREAS/Tools/Tools - Version Control/Git]]

*Backlinks:*

```dataview
list from [[Using Git Worktree]] AND -"Changelog"
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