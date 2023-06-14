---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Cmd", "#Topic/Dev/Cmd"]
Alias: [ "DISM" ]
---

# Deployment Image Servicing and Management (DISM)

See Also: [[Cmd - SFC]] (i.e. *system file checker*; `sfc /scannow`)

> [!SOURCE] Sources
> - *[DISM - Deployment Image Servicing and Management | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/dism---deployment-image-servicing-and-management-technical-reference-for-windows?view=windows-11)*
> - *[Fix Windows Update errors via DISM or System Update Readiness tool - Windows Server | Microsoft Learn](https://learn.microsoft.com/en-us/troubleshoot/windows-server/deployment/fix-windows-update-errors)*

## Contents

- [Overview](#overview)
- [Using DISM to Repair Windows Update](#using-dism-to-repair-windows-update)
	- [Logs](#logs)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

## Using DISM to Repair Windows Update 

^3aa52d

```cmd
DISM.exe /Online /Cleanup-image /Restorehealth
```

> [!IMPORTANT] Important
> When you run this command, `DISM` uses Windows Update to provide the files that are required to fix corruptions. However, if your Windows Update client is already broken, use a running Windows installation as the repair source, or use a Windows side-by-side folder from a network share or from a removable media, such as the Windows DVD, as the source of the files. To do this, run the following command instead:

```cmd
DISM.exe /Online /Cleanup-Image /RestoreHealth /Source:C:\RepairSource\Windows /LimitAccess
```

> [!NOTE] Note
> Replace the _C:\RepairSource\Windows_ placeholder with the location of your repair source. For more information about using the DISM tool to repair Windows, reference [Repair a Windows Image](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-8.1-and-8/hh824869(v=win.10)).

Next, run the [[Cmd - SFC|System File Checker]]:

```cmd
sfc /scannow
```

Finally, close the command prompt, and run **Windows Update** again.

### Logs

`DISM` creates a log file (`%WINDIR%/Logs/CBS/CBS.log`) that captures any issues that the tool found or fixed.  `%WINDIR%` is the folder in which Windows is installed. 

For example, the `%WINDIR%` folder is `C:\Windows`.

***

## Appendix: Links and References

*Note created on [[2023-06-01 1]] and last modified on [[2023-06-01 1]].*

### Internal Linked Notes

- [[Code/CMD/_README|Command Line]]
- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]
- [[MOC - Microsoft|Microsoft Windows]]


### External References



#### Backlinks

```dataview
list from [[Cmd - DISM]] AND -"CHANGELOG" AND -"Code/CMD/Cmd - DISM"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

