---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Cmd", "#Topic/Dev/Cmd"]
Alias: [ "Create Network Performance Report" ]
---

# Create Network Performance Report

> [!SOURCE] Sources
> - *[Netsh Commands for Wireless Local Area Network (WLAN) | Microsoft Learn](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/dd744889(v=ws.10))*
> - *[Netsh Technical Reference | Microsoft Learn](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/cc725935(v=ws.10))*
> - *[Netsh Command Reference | Microsoft Learn](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc754516(v=ws.10))*
> - *[netsh | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/netsh)*
> - *[Network Shell (Netsh) | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh)*
> - *[Netsh Command Syntax, Contexts, and Formatting | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-contexts)*
> - *[Network Shell (Netsh) Example Batch File | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-wins)*

## Contents

- [Code](#code)
- [Output](#output)
	- [Full Report](#full-report)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Code

*Link: <<% tp.file.cursor(2) %>>*

```cmd
netsh wlan show wlanreport
```

## Output

![](https://i.imgur.com/y5rjT7P.png)

Resulting file should be created under `C:/ProgramData/Microsoft/Windows/WlanReport/`:

- [[wlan-report.html]]:

### Full Report

![](https://i.imgur.com/K8OAF3c.jpg)

***

## Appendix: Links and References

*Note created on [[2023-06-01 1]] and last modified on [[2023-06-01 1]].*

### Internal Linked Notes

- [[03 - AREAS/Code/Cmd/_README|Command Line]]
- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]
- [[MOC - Microsoft|Microsoft Windows]]
- [[Windows Command Line]]

### External References



#### Backlinks

```dataview
list from [[Cmd - Create Network Performance Report]] AND -"CHANGELOG" AND -"Code/CMD/Cmd - Create Network Performance Report"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

