---
Date: 2023-09-21
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Note"
  - "#Topic/Windows"
  - "#Status/WIP"
Aliases:
  - Windows Startup
---

# Windows Startup Process

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

On [[Microsoft Windows]], there are a variety of ways that programs and services can be initialized and launched on startup of the machine.

## User vs. Machine

First, the distinction between the *Local User* vs. the *Local Machine* is an important note:

- *Local User*: 
	- Refers to the currently logged on user's scope.
	- In the [[Registry]], the base path for relevant keys is `HKEY_CURRENT_USER`, or `HKCU:`
	- Program Data is typically stored under `~/AppData/Local` or `~/AppData/Roaming` (`%APPDATA%` and `%LOCALAPPDATA%`)
	- Non-Administrative privileges by default
- *Local Machine*:
	- 

## Common Locations

For the Current User:

- Registry:
	- `HKCU\Software\Microsoft\Windows\CurrentVersion\Run`
	- `HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce`
- 

***

## Appendix: Links and References

*Note created on [[2023-09-21]] and last modified on [[2023-09-21]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Windows Startup Process]] AND -"CHANGELOG" AND -"//Windows Startup Process"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

