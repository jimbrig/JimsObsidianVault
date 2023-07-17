---
Date: 2023-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "Register-PackageSource" ]
---

# Register-PackageSource

> [!NOTE] About
> 

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

### Register Nuget.org Package Source Repository

```powershell
Register-PackageSource -Trusted -Name Nuget.org -Location 'https://www.nuget.org/api/v2/' -ProviderName NuGet
```

then run `Get-PackageSource`:

```text
Name                             ProviderName     IsTrusted  Location
----                             ------------     ---------  --------
DevExpress                       NuGet            False      https://nuget.devexpress.com/QYYRcCJXvsjMb1GXadVbC8HBpLPA…
DevExpress 22.2 Local            NuGet            False      C:\Program Files\DevExpress 22.2\Components\System\Compon…
Microsoft Visual Studio Offline… NuGet            False      C:\Program Files (x86)\Microsoft SDKs\NuGetPackages\
Nuget.org                        NuGet            True       https://www.nuget.org/api/v2/
PSGallery                        PowerShellGet    True       https://www.powershellgallery.com/api/v2
```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-07-17]] and last modified on [[2023-07-17]].*

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
list from [[PowerShell - Register-PackageSource]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - Register-PackageSource"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

