---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code/Bash", "#Topic/Dev/Bash", "#Topic/Dev/Linux" ]
Alias: [ "Git Auto Commit" ]
---

# Git Auto Commit

> [!NOTE] About
> Auto commit and push to remote repo tracking local changes to files.

## Contents

- [Code](#code)
- [Details](#details)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Code

*Link: [git-auto (github.com)](https://gist.github.com/jimbrig/439f74475d36449cc02a1fd1e878e22f#file-git-auto)*

```bash
#!/usr/bin/env bash

## Usage:
##  git-auto ;; use current script dir as git dir, and auto commit, not push.
##  git-auto -d /path/to/your/note's/dir   ;; set git dir
##  git-auto -p ;; auto commit and push
##  git-auto -s origin -p ;; set remote server
##  git-auto -b main -p ;; set git branch
##  git-auto -i 30 -p ;; set interval seconds
##  git-auto -o -p;; execute once


#set -e
#set -x

usage="usage: $0
    [-d <git directory>]
    [-i <interval seconds>]
    [-p <push to remote server>]
    [-s git remote server]
    [-b git branch]
    [-o <execute once]"

push_to_server=0
server=origin
interval=20
once=0

OPTIND=1
while getopts d:i:b:s:po flag; do
  case "${flag}" in
  d) directory=${OPTARG} ;;
  p) push_to_server=1 ;;
  o) once=1 ;;
  s) server=${OPTARG} ;;
  b) branch=${OPTARG} ;;
  i) interval=${OPTARG} ;;
  *)
    echo "ERROR: ${usage}" >&2
    exit 1
    ;;
  esac
done
shift $((OPTIND - 1))

if  [[ "${directory}" ]]; then
  cd "${directory}" || exit 1
fi

if [[ -z "${branch}" ]]; then
  branch=$(git rev-parse --abbrev-ref HEAD)
fi

auto-commit-and-push() {
  if ! [[ $(git status) =~ "working tree clean" ]]; then
    git add .
    git commit -m "auto commit"

    if [[ 1 == "${push_to_server}" ]]; then
      git push "${server}" "${branch}"
    fi
  fi
}

date

if [[ 1 == "${once}" ]]; then
  auto-commit-and-push
else
  while true; do
    auto-commit-and-push
    sleep "${interval}"
  done
fi
```

## Details


> [!NOTE]
> Details about what the code does.



***

## Appendix: Links and References

*Note created on [[2023-06-01]] and last modified on [[2023-06-01]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]

### External References



#### Backlinks

```dataview
list from [[Bash - Git Auto Commit]] AND -"CHANGELOG" AND -"Code/Bash/Bash - Git Auto Commit"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

