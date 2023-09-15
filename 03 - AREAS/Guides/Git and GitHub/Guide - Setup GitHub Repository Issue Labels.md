---
Date: 2023-08-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# GitHub Repository Issue Labels

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

## Issue Labels

- Bug
- Feature
- Docs
- Config
- Infra
- Refactor
- Style
- Tests
- Chore
- WIP
- Question
- Help Wanted
- Good First Issue
- Duplicate
- Release

Optional, component related:

- API
- Database
- Dataprep

### Configuration

#### YAML

Place in `.github/labels.yml`:

```yaml
- name: Bug
  color: d73a4a
  description: Something isn't working

- name: Feature
  color: 1B6659
  description: New enhancements and features

- name: Docs
  color: 0075ca
  description: Improvements or additions to documentation

- name: Config
  color: 8ed92e
  description: Configuration and meta-infrastructural changes

- name: Infra
  color: D0EFCD
  description: Infrastructure changes

- name: Refactor
  color: 0e8a16
  description: Refactoring existing code

- name: Style
  color: 0e8a16
  description: Improvements or additions to styling and formatting

- name: Tests
  color: 0e8a16
  description: Improvements or additions to tests

- name: Chore
  color: 0e8a16
  description: Other changes that don't modify src or test files

- name: WIP
  color: 0e8a16
  description: Work in progress

- name: Question
  color: 8E4F70
  description: Further information is requested

- name: Help Wanted
  color: 008672
  description: Extra attention is needed

- name: Good First Issue
  color: 7057ff
  description: Good for newcomers

- name: Duplicate
  color: cfd3d7
  description: This issue or pull request already exists

- name: Invalid
  color: e4e669
  description: This doesn't seem right

- name: Release
  color: 108a51
  description: Indicates a new release

```

#### JSON

Place in `.github/labels.json`:

```json
[
  {
    "name": "Bug",
    "color": "d73a4a",
    "description": "Something isn't working"
  },
  {
    "name": "Feature",
    "color": "1B6659",
    "description": "New enhancements and features"
  },
  {
    "name": "Docs",
    "color": "0075ca",
    "description": "Improvements or additions to documentation"
  },
  {
    "name": "Config",
    "color": "8ed92e",
    "description": "Configuration and meta-infrastructural changes"
  },
  {
    "name": "Infra",
    "color": "D0EFCD",
    "description": "Infrastructure changes"
  },
  {
    "name": "Refactor",
    "color": "0e8a16",
    "description": "Refactoring existing code"
  },
  {
    "name": "Style",
    "color": "0e8a16",
    "description": "Improvements or additions to styling and formatting"
  },
  {
    "name": "Tests",
    "color": "0e8a16",
    "description": "Improvements or additions to tests"
  },
  {
    "name": "Chore",
    "color": "0e8a16",
    "description": "Other changes that don't modify src or test files"
  },
  {
    "name": "WIP",
    "color": "0e8a16",
    "description": "Work in progress"
  },
  {
    "name": "Question",
    "color": "8E4F70",
    "description": "Further information is requested"
  },
  {
    "name": "Help Wanted",
    "color": "008672",
    "description": "Extra attention is needed"
  },
  {
    "name": "Good First Issue",
    "color": "7057ff",
    "description": "Good for newcomers"
  },
  {
    "name": "Duplicate",
    "color": "cfd3d7",
    "description": "This issue or pull request already exists"
  },
  {
    "name": "Invalid",
    "color": "e4e669",
    "description": "This doesn't seem right"
  },
  {
    "name": "Release",
    "color": "108a51",
    "description": "Indicates a new release"
  }
]
```

***

## Appendix: Links and References

*Note created on [[2023-08-07]] and last modified on [[2023-08-07]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[GitHub Repository Issue Labels]] AND -"CHANGELOG" AND -"Guides/GitHub/GitHub Repository Issue Labels"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

