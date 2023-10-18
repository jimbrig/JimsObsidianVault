---
Date Created: 2023-10-18
Date Modified: 2023-10-18
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Aliases: [ "Mount Virtual Hard Disk (VHD)" ]
---

# Mount Virtual Hard Disk (VHD)

> [!SOURCE] Sources:
> - *[Mount or Unmount VHD or VHDX File in Windows 10 (winaero.com)](https://winaero.com/mount-or-unmount-vhd-or-vhdx-file-in-windows-10/)* 
> - *[Automatically Mount VHD or VHDX File on Startup in Windows 10 (winaero.com)](https://winaero.com/automatically-mount-vhd-or-vhdx-file-on-startup-in-windows-10/)*

## Contents

[TOC]

## Code

> [!WARNING] Warning:
> The [[PowerShell]] Commands must be run with Administrative Privileges and on a machine with the [[Hyper-V Optional Feature]] enabled. 

> [!TIP] See Also: 
> - [[03 - AREAS/Code/Cmd/Cmd - DISKPART|DiskPart]]
 
```powershell
#Requires -RunAsAdministrator
Mount-VHD -Path "<Absolute/Path/To/VHD(X)/File.vhdx>"
```

## Automatically Mount VHD on Startup

1. Create New Scheduled Task in [[Windows Task Scheduler Library]]
2. Provide Name, Configure for Windows 10/11, Run Only When User is Logged On, Run with Highest Privileges
3. Create new *Trigger* for *Begin the Task* option for *at Startup*
4. Add Script/Command to Actions
5. 

## Details

### What are VHD and VHDX Files?

The Virtual Hard Disk (VHD) file format allows encapsulation of the hard disk into an individual file for use by the operating system as a _virtual disk_ in all the same ways physical hard disks are used. These virtual disks are capable of hosting native file systems (NTFS, FAT, exFAT, and UDFS) while supporting standard disk and file operations. The maximum size of a VHD file is 2,040 GB.

VHDX is a new version of the VHD format which has a much larger storage capacity than the older VHD format. It also provides data corruption protection during power failures and optimizes structural alignments of dynamic and differencing disks to prevent performance degradation on new, large-sector physical disks. It supports for virtual hard disk storage capacity of up to 64 TB.

### Virtual Disk Types

- **Fixed**—The VHD image file is pre-allocated on the backing store for the maximum size requested.
- **Expandable**—Also known as "dynamic", "dynamically expandable", and "sparse", the VHD image file uses only as much space on the backing store as needed to store the actual data the virtual disk currently contains. When creating this type of virtual disk, the VHD API does not test for free space on the physical disk based on the maximum size requested, therefore it is possible to successfully create a dynamic virtual disk with a maximum size larger than the available physical disk free space.

***

## Appendix: Links and References

*Note created on [[2023-10-18]] and last modified on [[2023-10-18]].*

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
list from [[PowerShell - Mount Virtual Hard Disk (VHD)]] AND -"CHANGELOG" AND -"03 - AREAS/Code/PowerShell/PowerShell - Mount Virtual Hard Disk (VHD)"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

