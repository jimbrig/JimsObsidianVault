---
Date: 2023-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "Install 1Password CLI" ]
---

# Install 1Password CLI

> [!NOTE] About
> 

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

```powershell
$arch = (Get-CimInstance Win32_OperatingSystem).OSArchitecture
switch ($arch) {
    '64-bit' { $opArch = 'amd64'; break }
    '32-bit' { $opArch = '386'; break }
    Default { Write-Error "Sorry, your operating system architecture '$arch' is unsupported" -ErrorAction Stop }
}
$installDir = Join-Path -Path $env:ProgramFiles -ChildPath '1Password CLI'
Invoke-WebRequest -Uri "https://cache.agilebits.com/dist/1P/op2/pkg/v2.17.0/op_windows_$($opArch)_v2.17.0.zip" -OutFile op.zip
Expand-Archive -Path op.zip -DestinationPath $installDir -Force
$envMachinePath = [System.Environment]::GetEnvironmentVariable('PATH','machine')
if ($envMachinePath -split ';' -notcontains $installDir){
    [Environment]::SetEnvironmentVariable('PATH', "$envMachinePath;$installDir", 'Machine')
}
Remove-Item -Path op.zip
```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-07-17]] and last modified on [[2023-07-17]].*

### Internal Linked Notes

- [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[PowerShell - Install 1Password CLI]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - Install 1Password CLI"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

