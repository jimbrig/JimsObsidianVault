Function Update-Nvidia {
    <#
    .SYNOPSIS
        Updates NVIDIA drivers.
    .DESCRIPTION
        Checks for a new version of the NVIDIA drivers and downloads/installs them if a new version is available.
    .PARAMETER Silent
        (Optional) If specified, the script will not prompt the user to install the drivers. Defaults to $false.
    .PARAMETER LogFilePath
        (Optional) The path to the log file to write to. Defaults to $env:TEMP\NVIDIA-Update.log.
    .PARAMETER Force
        (Optional) If specified, the script will download and install the drivers even if the version is the same as
        the currently installed version. Defaults to $false.
    .PARAMETER Clean
        (Optional) If specified, the script will remove any existing drivers and their configuration data before
        installing the new drivers. Defaults to $false.
    .PARAMETER Msi
        (Optional) Enable Message-Signaled Interrupts (MSI) after driver installation completes. Defaults to $false and
        requires elevation.
    .PARAMETER Schedule
        (Optional) Register a scheduled task to run the script weekly; arguments passed alongside this will be appended
        to the scheduled task's actions. Defaults to $false.
    .PARAMETER GpuId
        (Optional) The ID of the GPU to update (the Product family for the GPU). Defaults to $null which allows the
        function to automatically detect the GPU ID.
    .PARAMETER OsId
        (Optional) The ID of the operating system to update. Defaults to $null which allows the function to
        automatically detect the OS ID.
    .PARAMETER Desktop
        (Optional) If specified, the script will download the desktop drivers instead of the notebook drivers. Defaults
        to $false. Override the desktop/notebook check and download the desktop driver; useful when using an external
        GPU or unable to find a driver.
    .PARAMETER Notebook
        (Optional) If specified, the script will download the notebook drivers instead of the desktop drivers. Defaults
        to $false. Override the desktop/notebook check and download the notebook driver; useful when using an internal
        GPU or unable to find a driver.
    .PARAMETER DownloadDirectory
        (Optional) The directory to download the drivers to. Defaults to $env:TEMP\NVIDIA.
    .PARAMETER KeepDownload
        (Optional) If specified, the script will not delete the downloaded drivers after installation.
        Defaults to $false.
    .PARAMETER GpuDataFile
        (Optional) The URL or File Path to the JSON GPU data file.
        Defaults to my GitHub Gist hosted JSON config file:
        <https://gist.githubusercontent.com/jimbrig/5d86dd63df299bd1059fc9c633fb71c9/raw/373281e0818301a78e6a56b5978b1b922283236c/nvidia-gpu-data.json>.
    .PARAMETER OsDataFile
        (Optional) The URL or File Path to the JSON OS data file.
        Defaults to my GitHub Gist hosted JSON config file:
        <https://gist.githubusercontent.com/jimbrig/5d86dd63df299bd1059fc9c633fb71c9/raw/373281e0818301a78e6a56b5978b1b922283236c/nvidia-os-data.json>.
    .PARAMETER AjaxDriverServiceURL
        (Optional) The URL to the Ajax Drive Service.
        Defaults to <https://gfwsl.geforce.com/services_toolkit/services/com/nvidia/services/AjaxDriverService.php>.
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$Silent,
        [Parameter(Mandatory = $false)]
        [string]$LogFilePath = "$env:TEMP\NVIDIA-Update.log",
        [Parameter(Mandatory = $false)]
        [switch]$Force,
        [Parameter(Mandatory = $false)]
        [switch]$Clean,
        [Parameter(Mandatory = $false)]
        [switch]$Msi,
        [Parameter(Mandatory = $false)]
        [switch]$Schedule,
        [Parameter(Mandatory = $false)]
        [string]$GpuId = $null,
        [Parameter(Mandatory = $false)]
        [string]$OsId = $null,
        [Parameter(Mandatory = $false)]
        [switch]$Desktop,
        [Parameter(Mandatory = $false)]
        [switch]$Notebook,
        [Parameter(Mandatory = $false)]
        [string]$DownloadDirectory = "$env:TEMP\NVIDIA",
        [Parameter(Mandatory = $false)]
        [switch]$KeepDownload,
        [Parameter(Mandatory = $false)]
        [string]$GpuDataFile = 'https://gist.githubusercontent.com/jimbrig/5d86dd63df299bd1059fc9c633fb71c9/raw/373281e0818301a78e6a56b5978b1b922283236c/nvidia-gpu-data.json',
        [Parameter(Mandatory = $false)]
        [string]$OsDataFile = 'https://gist.githubusercontent.com/jimbrig/5d86dd63df299bd1059fc9c633fb71c9/raw/373281e0818301a78e6a56b5978b1b922283236c/nvidia-os-data.json',
        [Parameter(Mandatory = $false)]
        [string]$AjaxDriverServiceURL = 'https://gfwsl.geforce.com/services_toolkit/services/com/nvidia/services/AjaxDriverService.php'
    )

    Begin {
        New-Variable -Name 'CfgFilePath' -Value "$env:TEMP\NVIDIA-Optional-Components.cfg" -Option Constant
        New-Variable -Name 'DriverLookupUri' -Value "$AjaxDriverServiceUrl?func=DriverManualLookup&pfid={0}&osID={1}&dch={2}" -Option Constant
        New-Variable -Name 'osBits' -Value "$(if ([Environment]::Is64BitOperatingSystem) { 64 } else { 32 })" -Option Constant
        New-Variable -Name 'CleanGpuNameRegex' -Value '(?<=NVIDIA )(.*(?= \([A-Z]+\))|.*(?= [0-9]+GB)|.*(?= COLLECTORS EDITION)|.*(?= with Max-Q Design)|.*)' -Option Constant
        New-Variable -Name 'NotebookChassisTypes' -Value @(8, 9, 10, 11, 12, 14, 18, 21, 31, 32) -Option Constant
        New-Variable -Name 'DataDividends' -Value @(1, 1024, 1048576) -Option Constant
        New-Variable -Name 'DataUnits' -Value @('B', 'KiB', 'MiB') -Option Constant
    }


}

Function Write-Feedback {
    <#
    .SYNOPSIS
        Write a message to the console and optionally to a log file.
    .DESCRIPTION
        Write a message to the console and optionally to a log file.
        If the log file path is not specified, the message will be written to the console only.
    .PARAMETER Message
        The message to write.
    .PARAMETER NoNewline

    #>
    param (
        [string]$Message,
        [switch]$NoNewline,
        [string]$Separator = ' ',
        [ConsoleColor]$BackgroundColor = [ConsoleColor]::Black,
        [ConsoleColor]$ForegroundColor = [ConsoleColor]::Gray
    )

    Write-Host $Message -NoNewline:$NoNewline -Separator $Separator -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor

    if ($LogFilePath) {
        Add-Content -Path $LogFilePath -Value $Message
    }
}
