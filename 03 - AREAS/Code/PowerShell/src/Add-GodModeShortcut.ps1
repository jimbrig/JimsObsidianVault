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
