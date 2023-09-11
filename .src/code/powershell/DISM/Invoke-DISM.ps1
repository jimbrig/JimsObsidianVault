<#
    .SYNOPSIS
        Invoke-DISM is a wrapper for the DISM.exe command line tool.
    .DESCRIPTION
        Invoke-DISM is designed to be used in a PowerShell environment/script to automate the process of running
        DISM.exe to repair, restore, scan, or check a Windows image.

        Currently the following DISM operations are supported:
            - `/RestoreHealth`
            - `/ScanHealth`
            - `/CheckHealth`
    .NOTES
        This script uses the DISM PowerShell module included with Windows.
        This script requires PowerShell 3.0 or higher.
        This script requires Windows 8 or higher.
        This script requires elevated privileges.
        This script requires the DISM.exe command line tool to be available on the system PATH.
        This script requires the DISM PowerShell module to be installed and importable.
    .EXAMPLE
        Invoke-DISMRepair -Image "C:\Windows" -LogPath "C:\Windows\Logs\DISM.log" -Source "C:\Windows\WinSxS" -RestoreHealth

        # Repair the Windows image located at "C:\Windows" using the source located at "C:\Windows\WinSxS" and log the
        # output to "C:\Windows\Logs\DISM.log".
    .EXAMPLE
        Invoke-DISMRepair -Image "C:\Windows" -LogPath "C:\Windows\Logs\DISM.log" -Source "C:\Windows\WinSxS" -ScanHealth

        # Scan the Windows image located at "C:\Windows" using the source located at "C:\Windows\WinSxS" and log the
        # output to "C:\Windows\Logs\DISM.log".
    .EXAMPLE
        Invoke-DISMRepair -Image "C:\Windows" -LogPath "C:\Windows\Logs\DISM.log" -Source "C:\Windows\WinSxS" -CheckHealth

        # Check the Windows image located at "C:\Windows" using the source located at "C:\Windows\WinSxS" and log the
        # output to "C:\Windows\Logs\DISM.log".
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Image,
    [Parameter(Mandatory = $true)]
    [string]$LogPath,
    [Parameter(Mandatory = $true)]
    [string]$Source,
    [Parameter(Mandatory = $false)]
    [switch]$RestoreHealth,
    [Parameter(Mandatory = $false)]
    [switch]$ScanHealth,
    [Parameter(Mandatory = $false)]
    [switch]$CheckHealth
)
