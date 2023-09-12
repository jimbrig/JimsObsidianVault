---
Date: 2023-09-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Guide", "#Topic/Dev/Windows"]
Aliases: [ "Cleanup Windows" ]
---

# Guide - Cleanup Windows

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

## Cleanup Tasks

1. Clean [[Windows Event Logs]]
2. Clean [[Restore Points]] and [[Shadow Restore Points]]
3. Clean [[03 - AREAS/Technology/Computer Science/Operating System/Windows/_README|Windows]] Temporary Files:
	- System
	- User
	- Internet
4. Clean Internet WER Files
5. Clean Memory Dump and Mini Dump Files
6. Clean [[Windows Update]] Download Files
7. Clean left-over folders and files from updates and installs
8. Run Silent Administrative [[cleanmgr]] with all options selected
9. Empty Recycle Bin
10. 

## Scripts

- [[Invoke-WindowsCleanup.ps1]] Script
- [[WindowsCleanup.bat]] Script
- [[Invoke-EmptyRecycleBin.ps1]] Script
- 


## Paths

- `C:\Windows\Temp`
- `C:\Windows\Prefetch`
- `C:\Users\*\AppData\Local\Temp`


***

## Appendix: Links and References

*Note created on [[2023-09-12]] and last modified on [[2023-09-12]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Guide - Cleanup Windows]] AND -"CHANGELOG" AND -"//Guide - Cleanup Windows"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

