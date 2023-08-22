---
Date: 2023-08-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Windows Components

> [!SOURCE] Sources
> - *[Overview of Windows Components - Windows drivers | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/overview-of-windows-components)*

## Contents

[TOC]

## Overview

The following figure shows the major internal components of the Windows operating system.

<center>

![diagram illustrating an overview of windows components.](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/images/ntarch.png)

</center>

As the figure shows, the Windows operating system includes both user-mode and kernel-mode components. For more information about Windows user and kernel modes, see [User Mode and Kernel Mode](https://learn.microsoft.com/en-us/windows-hardware/drivers/gettingstarted/user-mode-and-kernel-mode).

Drivers call routines that are exported by various kernel components. For example, to create a device object, you would call the [**IoCreateDevice**](https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-iocreatedevice) routine which is exported by the I/O manager. For a list of kernel-mode routines that drivers can call, see driver support routines.

In addition, drivers must respond to specific calls from the operating system and can respond to other system calls. For a list of kernel mode routines that drivers may need to support, see [Standard Driver Routines](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-standard-driver-routines).

Not all kernel-mode components are pictured in the figure above. For a list of kernel mode components, see [Kernel-Mode Managers and Libraries](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/windows-kernel-mode-object-manager).

> [!NOTE] About
> *Description of note contents.*


***

## Appendix: Links and References

*Note created on [[2023-08-22]] and last modified on [[2023-08-22]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Windows Components]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Windows/Drivers/Windows Components"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

