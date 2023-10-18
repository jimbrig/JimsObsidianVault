---
Date Created: 2023-06-20
Date Modified: 2023-10-18
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Cmd", "#Topic/Dev/Cmd"]
Aliases: [ "DiskPart" ]
---

# DiskPart

> [!SOURCE] Sources:
> - *[Mount or Unmount VHD or VHDX File in Windows 10 (winaero.com)](https://winaero.com/mount-or-unmount-vhd-or-vhdx-file-in-windows-10/)*

> [!INFO]
> See Also: [[Guide - How To use DISKPART on Windows|How to use DISKPART]]

## Contents

[TOC]

## Code

*Link: *

```powershell
# Launch diskpart shell
& DISKPART

# Within DISKPART (i.e. "DISKPART>"):
SELECT VDISK FILE="Path/to/vhdx"
ATTACH VDISK
Exit
```

Similarly, to detach:

```powershell
SELECT VDISK FILE="Path/to/vhdx"
DETACH VDISK
Exit
```

## Details


> [!NOTE]
> Details about what the code does.



***

## Appendix: Links and References

*Note created on [[2023-06-01]] and last modified on [[2023-06-20]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]
- [[MOC - Microsoft|Microsoft Windows]]
- [[Windows Command Line]]
- [[03 - AREAS/Code/Cmd/_README|Command Line]]

### External References



#### Backlinks

```dataview
list from [[Cmd - DISKPART]] AND -"CHANGELOG" AND -"Code/CMD/Disk Management/Cmd - DISKPART"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

