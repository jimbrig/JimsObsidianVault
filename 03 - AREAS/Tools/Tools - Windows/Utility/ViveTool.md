---
Date Created: 2023-08-29
Date Modified: 2023-08-29
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Tool", "#Type/Tool/App", "#Topic/Software" ]
Alias: [ "ViveTool", "ViveTool Application" ]
---

# ViveTool  

> [!SOURCE] Sources
> - *[thebookisclosed/ViVe: C# library and console app for using new feature control APIs available in Windows 10 version 2004 and newer (github.com)](https://github.com/thebookisclosed/ViVe)*
> - *[PeterStrick/ViVeTool-GUI: Windows Feature Control GUI based on ViVe / ViVeTool (github.com)](https://github.com/PeterStrick/ViVeTool-GUI)*
> - *[riverar/mach2: Windows Feature Control Multi-tool (github.com)](https://github.com/riverar/mach2)*
> - *[ViVe/Extra/FeatureDictionary.pfs at master · thebookisclosed/ViVe (github.com)](https://github.com/thebookisclosed/ViVe/blob/master/Extra/FeatureDictionary.pfs)*


## Overview

**ViveTool**, or **ViVe** is a [[C#]] library that allows [[Windows]] Power Users to make their own programs that interact with the [[A/B Feature]] Experiement Mechanism found in [[Windows]] operating systems (Versions 10+).

The _FeatureManager_ class should cover most feature management needs with the added benefit of some struct heavy lifting being done for you. Boot persistence and LKG management is offered exclusively by this class as it had to be reimplemented.

In case you'd like to talk to NTDLL exports directly, you can use _NativeMethods_.

ViVeTool is both an example of how to use ViVe, as well as a straightforward tool for power users which want to use the new APIs instantly.



## Usage

![](https://i.imgur.com/rI4IXKu.png)

- Enable and Disable Features:

```powershell
#Requires -RunAsAdministrator
ViVeTool /enable:<ID>
ViVeTool /disable:<ID>
```

- Update Feature List Dictionary:

```powershell
ViVeTool /dictupdate
```

outputs:

```powershell
➜ vivetool /dictupdate

ViVeTool v0.3.2 - Windows feature configuration tool

Checking for feature dictionary updates...
Newer dictionary found (revision 2f62daa1c04a80a7edd6e460293e81353362a3be)
Replace current version with new version? [Y/N] Y
Dictionary update finished
```



I currently have used ViveTool to enable the following experiemental features:

- **New Volume Mixer**:

## Feature Dictionary

[ViVe/Extra/FeatureDictionary.pfs at master · thebookisclosed/ViVe (github.com)](https://github.com/thebookisclosed/ViVe/blob/master/Extra/FeatureDictionary.pfs)

- **SettingsHomepage**: `42058345`
- 
***

## Appendix: Links and References

*Note created on [[2023-08-29]] and last modified on [[2023-08-29]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[ViveTool]] AND -"CHANGELOG" AND -"03 - AREAS/Tools/Tools - Windows/Utility/ViveTool"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023
