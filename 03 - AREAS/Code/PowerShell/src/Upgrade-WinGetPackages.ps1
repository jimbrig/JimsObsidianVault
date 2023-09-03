<#
    .SYNOPSIS
        Interactively upgrade software installations via the Windows Package Manager (`winget`).
    .DESCRIPTION
        This script utilizes `Get-WGUpgrade` from the `WinGetTools` module plus `Out-ConsoleGridView` from the new
        `Microsoft.PowerShell.ConsoleGuiTools` PowerShell v7 module to provide an interactive upgrade experience for
        selectively upgrading software installations via the Windows Package Manager (`winget`).

        Once invoked, the user will be presented with a list of all installed software that has an upgrade available
        within the terminal window itself (via `Out-ConsoleGridView`). The user can then select one or more software
        items to upgrade by pressing the spacebar to toggle the selection state of the item(s) and then pressing the
        and hitting enter to confirm the selection(s) and begin the upgrade process.
    .NOTES
        This script requires the `WinGetTools` module and the `Microsoft.PowerShell.ConsoleGuiTools` modules, and
        also in turn requires PowerShell Core v7 or later.

        The script simply wraps the following one-liner:

        ```powershell
        Get-WGUpgrade | Out-ConsoleGridView -OutputMode Multiple | Invoke-WGUpgrade`
        ```
    .PARAMETER Mode
        The mode to run the script in. Defaults to `Interactive`. If set to `All`, the script will upgrade all
        available software installations without prompting the user.
    .PARAMETER WhatIf
        If specified, the script will not actually perform any upgrades, but will instead simply output the list of
        software that would be upgraded if the script were run without this parameter.
    .PARAMETER AsAdmin
        If specified, the script will run as an administrator. This is required for upgrading software that was
        installed as an administrator.
    .PARAMETER InstallDependencies
        If specified, the script will install the module's it depends on to work properly, specifically,
        `WinGetTools` and `Microsoft.PowerShell.ConsoleGuiTools`. This allows the script to run on systems where
        those modules are not already installed.
    .EXAMPLE
        Upgrade-WinGetPackages

        # Launches an interactive upgrade experience for selectively upgrading software installations via `winget`.
    .EXAMPLE
        Upgrade-WinGetPackages -Mode All

        # Upgrades all available software installations without prompting the user.
    .EXAMPLE
        Upgrade-WinGetPackages -WhatIf

        # Outputs the list of software that would be upgraded if the script were run without this parameter.
    .EXAMPLE
        Upgrade-WinGetPackages -AsAdmin

        # Runs the script as an administrator. This is required for upgrading software that was installed as an
        administrator.
    .EXAMPLE
        Upgrade-WinGetPackages -InstallDependencies

        # Installs the module's it depends on to work properly, specifically, `WinGetTools` and
        `Microsoft.PowerShell.ConsoleGuiTools`. This allows the script to run on systems where those modules are not
        already installed.
#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $false)]
    [ValidateSet('All', 'Interactive')]
    [string]$Mode = 'Interactive',

    [Parameter(Mandatory = $false)]
    [switch]$WhatIf,

    [Parameter(Mandatory = $false)]
    [switch]$AsAdmin,

    [Parameter(Mandatory = $false)]
    [switch]$InstallDependencies
)

Begin {
    $ErrorActionPreference = 'Stop'

    # Install dependencies if requested.
    If (!(Get-Module -Name WinGetTools -ListAvailable) -or !(Get-Module -Name Microsoft.PowerShell.ConsoleGuiTools -ListAvailable)) {
        If ($InstallDependencies) {
            Write-Verbose 'Installing dependencies...'
            Install-Module -Name WinGetTools -Scope CurrentUser -Force
            Install-Module -Name Microsoft.PowerShell.ConsoleGuiTools -Scope CurrentUser -Force
        }
    }

    # Import dependencies.
    Write-Verbose 'Importing dependencies...'
    Import-Module -Name WinGetTools -Scope CurrentUser -Force
    Import-Module -Name Microsoft.PowerShell.ConsoleGuiTools -Scope CurrentUser -Force

    # If running as admin, elevate.
    If ($AsAdmin) {
        $Admin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent())
        If (-NOT $Admin.IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
            Write-Verbose 'Elevating...'
            Start-Process -FilePath PowerShell.exe -Verb RunAs -ArgumentList '-NoExit', '-Command', "`"$($MyInvocation.MyCommand.Path)`" -AsAdmin"
            Exit
        }
    }
}

Process {
    # Get the list of upgrades.
    $Upgrades = Get-WGUpgrade

    # If in interactive mode, prompt the user to select which upgrades to perform.
    If ($Mode -eq 'Interactive') {
        $Selection = $Upgrades | Out-ConsoleGridView -OutputMode Multiple
    }
    # Otherwise, select all upgrades.
    Else {
        $Selection = $Upgrades
    }

    # If the user selected any upgrades, perform them.
    If ($Selection) {
        $Selection | Invoke-WGUpgrade -WhatIf:$WhatIf
    }
}

End {
    Write-Verbose 'Done.'
}
