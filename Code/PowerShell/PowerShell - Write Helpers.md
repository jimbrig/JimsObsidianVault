---
Date: 2023-06-14
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "Write Helpers" ]
---

# Write Helpers

> [!NOTE] About
> 

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

```powershell
Function Write-ErrorMsg {
	[CmdLetBinding()]
	Param(
		[string]$Msg
	)
	
	[Console]::ForegroundColor = 'red'
	[Console]::Error.WriteLine($Msg)
	[Console]::ResetColor()
	
}

Function Write-WarningMsg {
	[CmdLetBinding()]
	Param(
		[string]$Msg
	)
	
	[Console]::ForegroundColor = 'yellow'
	[Console]::Error.WriteLine($Msg)
	[Console]::ResetColor()
	
}


```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-06-14]] and last modified on [[2023-06-14]].*

### Internal Linked Notes

- [[PowerShell]]
- [[Code/_README|Code Snippets]]
- [[Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[PowerShell - Write Helpers]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - Write Helpers"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

