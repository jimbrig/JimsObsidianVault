---
Date: 2023-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "DotNet Assemblies" ]
---

# DotNet Assemblies

> [!NOTE] About
> Code example using [[PowerShell Core]] to download a [[DotNet]] *assembly*/*library* from the [[Nuget]] package provider and add the [[Dynamic Link Library]] to the current project's dependencies.

## Code

### Terminal.Gui Assembly

*Link: [PSConfEU2023/TUI-Tools/demos/Get-Requirements.ps1 at main · jdhitsolutions/PSConfEU2023 (github.com)](https://github.com/jdhitsolutions/PSConfEU2023/blob/main/TUI-Tools/demos/Get-Requirements.ps1)*

```powershell
# Ensure nuget.org is registered as a trusted package provider
Register-PackageSource -Name NuGet.org -Location "https://www.nuget.org/api/v2" -ProviderName NuGet

# Test by searching for the 'Terminal.Gui' Package:
Find-Package Terminal.Gui -ProviderName Nuget

# Install Terminal.Gui for all users, skipping dependencies
Install-Package -Name Terminal.Gui -Force -Source nuget.org -Scope AllUsers -SkipDependencies

# Set the "package" as a variable, $p
Get-Package Terminal.GUI -OutVariable p

# Expand zip archive and examine contents
$DestDir = "C:\temp\TerminalGUI"
Expand-Archive $p.source -DestinationPath $DestDir
Get-ChildItem $DestDir
Get-ChildItem "$DestDir\lib"
Get-ChildItem "$DestDir\lib\net7.0"

# Copy the assembly .dll library to current project's 'assemblies' directory
Copy-Item "$DestDir\lib\net7.0\terminal.gui.dll" -Destination "$PWD\assemblies\" -PassThru
```

#### Details

> Details about what the code does.

1. Registers the Nuget.org Package Provider
2. Installs `Terminal.Gui`
3. Unzip's the `Terminal.Gui` archive
4. Copies the `terminal.gui.dll` dotnet assembly to project's `./assemblies/` folder as a "dependency" 

### NStack Core Assembly

```powershell
# Grab latest version of NStack.core assembly
Find-Package NStack.Core -ProviderName Nuget
Install-Package -Name NStack.Core -Force -Source nuget.org -Scope AllUsers -SkipDependencies
$src = (Get-Package NStack.core).source

$DestDir = "C:\temp\NStack"
Expand-Archive -Path $src -DestinationPath $DestDir
Get-ChildItem $DestDir
Copy-Item "$DestDir\lib\netstandard2.0\NStack.dll" -Destination "$PWD\assemblies" -PassThru -Force

# Check NStack Version
Get-ChildItem "$PWD\assemblies\" | Select-Object Name,@{Name="Version";Expression={$_.VersionInfo.FileVersion}}
```



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
list from [[PowerShell - DotNet Assemblies]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - DotNet Assemblies"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

