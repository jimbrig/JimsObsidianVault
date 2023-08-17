---
Date: 2023-06-20
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ "How to use DISKPART", "Windows DISKPART Guide" ]
---

# How To use DISKPART on Windows

> [!SOURCE] Sources
> - *[Link to Source]()*

## Overview

[[Windows]] comes with a built-in tool— **Disk Management** —that offers a complete solution to manage hard disks on the computer. 

You can use it to shrink volumes, increase volume or portion size, create new ones, and so on. The user interface is built using a set of commands— **[[DISKPART]]** — that works on [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] or [[Command Prompt]]. It comes in handy when you need to run complex commands and work with the virtual hard disk. Diskpart utility has a list of commands that one can use that are shared below.

## List of DISKPART Commands

|    Command    |                         Description                          |
| :-----------: | :---------------------------------------------------------- |
|    active     |       Marks the disk's partition with focus as active.       |
|      add      | Mirrors the simple volume with focus to the specified disk.  |
|    assign     | Assigns a drive letter or mount point to the volume with focus. |
| attach vdisk  | Attaches (sometimes called mounts or surfaces) a virtual hard disk (VHD) so that it appears on the host computer as a local hard disk drive. |
|  attributes   | Displays or sets or clears the attributes of a disk or volume. |
|   automount   |          Enables or disables the automount feature.          |
|     break     | Breaks the mirrored volume with focus into two simple volumes. |
|     clean     | Removes any and all partition or volume formatting from the disk with focus. |
| compact vdisk | Reduces the physical size of a dynamically expanding virtual hard disk (VHD) file. |
|    convert    | Converts file allocation table (FAT) and FAT32 volumes to the NTFS file system, leaving existing files and directories intact. |
|    create     | Creates a partition on a disk, a volume on one or more disks, or a virtual hard disk (VHD). |
|    delete     |               Deletes a partition or a volume.               |
| detach vdisk  | Stops the selected virtual hard disk (VHD) from appearing as a local hard disk drive on the host computer. |
|    detail     | Displays information about the selected disk, partition, volume, or virtual hard disk (VHD). |
|     exit      |           Exits the diskpart command interpreter.            |
| expand vdisk  | Expands a virtual hard disk (VHD) to the size that you specify. |
|    extend     | Extends the volume or partition with focus, along with its file system, into free (unallocated) space on a disk. |
|  filesystems  | Displays information about the current file system of the volume with focus and lists the file systems that are supported for formatting the volume. |
|    format     |           Formats a disk to accept Windows files.            |
|      gpt      | Assigns the gpt attribute(s) to the partition with focus on basic GUID partition table (gpt) disks. |
|     help      | Displays a list of the available commands or detailed help information on a specified command. |
|    import     | Imports a foreign disk group into the disk group of the local computer. |
|   inactive    | Marks the system partition or boot partition with focus as inactive on basic master boot record (MBR) disks. |
|     list      | Displays a list of disks, of partitions in a disk, of volumes in a disk, or of virtual hard disks (VHDs). |
|  merge vdisk  | Merges a differencing virtual hard disk (VHD) with its corresponding parent VHD. |
|    offline    |     Takes an online disk or volume to the offline state.     |
|    online     |     Takes an offline disk or volume to the online state.     |
|    recover    | Refreshes the state of all disks in a disk group, attempts to recover disks in an invalid disk group, and resynchronizes mirrored volumes and RAID-5 volumes that have stale data. |
|      rem      |         Provides a way to add comments to a script.          |
|    remove     |     Removes a drive letter or mount point from a volume.     |
|    repair     | Repairs the RAID-5 volume with focus by replacing the failed disk region with the specified dynamic disk. |
|    rescan     | Locates new disks that may have been added to the computer.  |
|    retain     | Prepares an existing dynamic simple volume to be used as a boot or system volume. |
|      san      | Displays or sets the storage area network (san) policy for the operating system. |
|    select     | Shifts the focus to a disk, partition, volume, or virtual hard disk (VHD). |
|    set id     | Changes the partition type field for the partition with focus. |
|    shrink     | Reduces the size of the selected volume by the amount you specify. |
|   uniqueid    | Displays or sets the GUID partition table (GPT) identifier or master boot record (MBR) signature for the disk with focus. |

## How to use DISKPART

```powershell
DISKPART

# show disks
list disk

# select a disk
sel disk 1

# show volumes
list vol

# select volume
sel 1

# delete volume
del 1

# assign drive letter
sel disk 1
list vol
sel vol 1
assign letter=e

# reduce (shrink) size
sel disk 1
list vol
shrink desired=1

# erase (clean)
list disk
sel disk 2
clean
```

***

## Appendix: Links and References

*Note created on [[2023-06-20]] and last modified on [[2023-06-20]].*

### Internal Linked Notes

- [[DISKPART]]
- [[FSUTIL]]
- [[Code/CMD/_README|Command Line]]
- [[03 - AREAS/Guides/Windows/_README|Windows]]
- [[Microsoft]]
- [[MOC - Software]]
- [[MOC - Microsoft]]

### External References

#### Backlinks

```dataview
list from [[How To use DISKPART on Windows]] AND -"CHANGELOG" AND -"Guides/Windows/How To use DISKPART on Windows"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

