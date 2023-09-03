---
Date: 2023-07-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Git", "#Topic/Dev/Git"]
Alias: [ "Change to SSH Protocol" ]
---

# Git - Change to SSH Protocol

> [!NOTE] About
> 

## Contents

[TOC]

## Code

### Global Confirguration

```bash
# GitHub
git config --global url.ssh://git@github.com/.insteadOf https://github.com/

# BitBucket
git config --global url.ssh://git@bitbucket.org/.insteadOf https://bitbucket.org/
```

That tells git to always use SSH instead of HTTPS when connecting to GitHub/BitBucket, so you'll authenticate by certificate by default, instead of being prompted for a password.

### Git Config

```text
# Enforce SSH
[url "ssh://git@github.com/"]
  insteadOf = https://github.com/
[url "ssh://git@gitlab.com/"]
  insteadOf = https://gitlab.com/
[url "ssh://git@bitbucket.org/"]
  insteadOf = https://bitbucket.org/
 ```

### Setup Repository Origin with SSH

The [[03 - AREAS/Tools/Tools - Version Control/Github]] repository setup page is just a suggested list of commands (and GitHub now suggests using the [[HTTPS]] protocol). Unless you have administrative access to GitHub's site, I don't know of any way to change their suggested commands.

If you'd rather use the [[SSH]] protocol, simply add a remote branch like so (i.e. use this command _in place_ of GitHub's suggested command). To modify an existing branch, see the next section.

```bash
GITHUB_USER=jimbrig
GITHUB_REPO=myrepo

git remote add origin git@github.com:$GITHUB_USER/$GITHUB_REPO.git
```

### Modify Existing Repository

As you already know, to switch a pre-existing repository to use SSH instead of HTTPS, you can change the remote url within your `.git/config` file:

```text
[remote "origin"]
    fetch = +refs/heads/*:refs/remotes/origin/*
    -url = https://github.com/nikhilbhardwaj/abc.git
    +url = git@github.com:nikhilbhardwaj/abc.git
```

To modify an existing repository using [[HTTPS]] to use [[SSH]] use `set-url`:

```bash
GITHUB_USER=jimbrig
GITHUB_REPO=myrepo

git remote set-url origin git@github.com:$GITHUB_USER/$GITHUB_REPO.git
```

## Details

- ["Why is Git always asking for my password?"](https://help.github.com/articles/why-is-git-always-asking-for-my-password) - GitHub help page.
- [GitHub's switch to Smart HTTP](https://stackoverflow.com/questions/11197576/github-uses-smart-http) - relevant StackOverflow question
- [Credential Caching for Wrist-Friendly Git Usage](https://github.com/blog/1104-credential-caching-for-wrist-friendly-git-usage) - GitHub blog post about HTTPS, and how to avoid re-entering your password


***

## Appendix: Links and References

*Note created on [[2023-07-28]] and last modified on [[2023-07-28]].*

### Internal Linked Notes

- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[Git - Change to SSH Protocol]] AND -"CHANGELOG" AND -"Code/Git/Git - Change to SSH Protocol"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

