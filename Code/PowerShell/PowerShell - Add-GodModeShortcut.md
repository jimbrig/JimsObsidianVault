---
Date: 2023-05-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "Add-GodModeShortcut" ]
---

# Add-GodModeShortcut

> [!NOTE] About
> [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] [[Code Snippet]] for generating a Desktop Shortcut for the *Windows God Mode* shell shortcut.

## Contents

- [Code](#code)
- [Details](#details)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Code

> [!source] Links:
> - [PSScripts/Add-GodModeShortcut at main · jimbrig/PSScripts (github.com)](https://github.com/jimbrig/PSScripts/tree/main/Add-GodModeShortcut)*
> - [PowerShell Gallery | Add-GodModeShortcut 1.0.2](https://www.powershellgallery.com/packages/Add-GodModeShortcut/1.0.2)*

- [PSScripts/Add-GodModeShortcut.ps1 at main · jimbrig/PSScripts · GitHub](https://github.com/jimbrig/PSScripts/blob/main/Add-GodModeShortcut/Add-GodModeShortcut.ps1):

```embed-powershell
PATH: "vault://Code/PowerShell/src/Add-GodModeShortcut.ps1"
TITLE: "Add-GodModeShortcut.ps1"
```

## Details

The code performs the following:

1. Creates a desktop shortcut to access the GodMode menu from Explorer:

![](https://i.imgur.com/f6CRvtN.png)

2. Launches GodMode in File Explorer:

![](https://i.imgur.com/TKtC6XS.png)


***

## Appendix: Links and References

*Note created on [[2023-05-17]] and last modified on [[2023-05-17]].*

### Internal Linked Notes

- [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

*Note code snippets use the [Embed Code File]() [[Obsidian Plugin]] to directly embed code files from respective [src](./src/) directories.*

<details><summary>View Code Snippet</summary><p>

```powershell
<# 
    .SYNOPSIS
        Adds a desktop shortcut for the `GodMode` Windows Advanced Options.
    .DESCRIPTION
        Adds a desktop shortcut for the `GodMode` Windows Advanced Options.
    .EXAMPLE
        Add-GodModeShortcut
        
        # Now Desktop has a shortcut.
#>
[CmdletBinding()]
Param()

$ErrorActionPreference = 'Stop'

$Desktop = [Environment]::GetFolderPath("Desktop")

If (!(Test-Path "$Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}")) { 
    New-Item -Path "$Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" -ItemType Directory | Out-Null
}
```

</p></details>

#### Backlinks

- [[Code/PowerShell/_README|PowerShell Code Snippets]]

```dataview
list from [[PowerShell - Add-GodModeShortcut]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - Add-GodModeShortcut"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

