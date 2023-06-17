---
Date: 2023-06-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "PSStyle" ]
---

# PSStyle

> [!NOTE] About
> [[Guides/PowerShell Development/_README|PowerShell]] Version 7.2 introduced a new *automatic variable* called `$PSStyle` for `PSAnsiRednering` which can be used to render `ANSI` control text decortions with color and font styling in the console.

## Overview

In [[PowerShell]], you can use [[ANSI Escape Sequences]] in the shell to display colors defined via [[PSReadLine]] options:

```powershell
Get-PSReadLineOption
```

![](https://i.imgur.com/OA2IqJK.png)

***

The ANSI sequences begin with an escape, which is `[Char]0x1b` or `[Char]27`. You can use **\`e**. 

![](https://i.imgur.com/5TRVuJ7.png)

## `$PSStyle`

![](https://i.imgur.com/Y4RKYdR.png)

> [!important] Important
> If you are running PowerShell in Windows Terminal, you will get different interpretations based on your color scheme.

`$PSStyle` allows us to use `$PSStyle.Background.Blue`, etc. instead of remembering the confusing syntax used above.

## Show-ANSISequence from PSScriptTools Module

> [!sources] Sources
> - *[PSScriptTools/docs/Show-ANSISequence.md at master · jdhitsolutions/PSScriptTools · GitHub](https://github.com/jdhitsolutions/PSScriptTools/blob/master/docs/Show-ANSISequence.md)*
> - *[jdhitsolutions/PSScriptTools](https://github.com/jdhitsolutions/PSScriptTools)*

## Import Export Functions

> [!sources] Sources
> - *[A set of functions for exporting and importing FileInfo settings from $PSStyle in PowerShell 7.2. (github.com)](https://gist.github.com/jimbrig/3d21a430064cf3654f68925ee339a2b2)*


```powershell
#requires -version 7.2

<#
These commands can be used to export FileInfo settings from $PSStyle and
then import them in another session. You might use the import command in
your PowerShell profile script. The file must be a json file.
#>
Function Export-PSStyleFileInfo {
    [cmdletbinding(SupportsShouldProcess)]
    Param(
        [Parameter(
            Position = 0,
            Mandatory,
            HelpMessage = "Specify the path to a json file."
        )]
        [ValidatePattern("\.json$")]
        [ValidateScript({
                if ( Split-Path $_ | Test-Path) {
                    $true
                }
                else {
                    Throw "Can't validate part of the specified path: $_"
                    $false
                }
            })]
        [string]$FilePath,
        [switch]$NoClobber,
        [switch]$Force
    )
    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
        #initialize a list for extension data
        $ext = [System.Collections.Generic.list[object]]::new()
    } #begin

    Process {
        Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Exporting PSStyle FileInfo settings to $FilePath "

        $h = @{
            Directory    = $psstyle.FileInfo.Directory
            SymbolicLInk = $psstyle.FileInfo.SymbolicLink
            Executable   = $psstyle.FileInfo.Executable
        }

        Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Exporting File Extensions"
        foreach ($key in $PSStyle.FileInfo.Extension.keys) {
            Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] --> $key"
            $e = @{Name = $key ; Setting = $psstyle.FileInfo.Extension[$key] }
            $ext.Add($e)
        }
        #add  the extension list to the hashtable
        $h.Add("Extension", $ext)

        $h | ConvertTo-Json | Out-File @PSBoundParameters

    } #process

    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"
    } #end

} #close Export-PSStyleFileInfo


Function Import-PSStyleFileInfo {
    [cmdletbinding(SupportsShouldProcess)]
    Param(
        [Parameter(
            Position = 0,
            Mandatory,
            HelpMessage = "Specify the path to a json file."
        )]
        [ValidatePattern("\.json$")]
        [ValidateScript({
                if ( Split-Path $_ | Test-Path) {
                    $true
                }
                else {
                    Throw "Can't validate part of the specified path: $_"
                    $false
                }
            })]
        [string]$FilePath
    )
    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
    } #begin

    Process {
        Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Importing settings from $FilePath"
        Try {
            $in = Get-Content -Path $FilePath | ConvertFrom-Json -ErrorAction stop
        }
        Catch {
            Throw $_
        }

        $props = "SymbolicLink", "Executable", "Directory"
        foreach ($prop in $props) {
            if ($in.$prop) {
                if ($PSCmdlet.ShouldProcess($prop)) {
                    $psstyle.FileInfo.$prop = $in.$prop
                }
            }
        }

        foreach ($item in $in.extension) {
            if ($pscmdlet.ShouldProcess($item.name)) {
                $psstyle.FileInfo.Extension[$item.name] = $item.setting
            }
        }

    } #process

    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"
    } #end

} #close Import-PSStyleFileInfo
```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-06-17]] and last modified on [[2023-06-17]].*

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
list from [[PowerShell - PSStyle]] AND -"CHANGELOG" AND -"//PowerShell - PSStyle"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

