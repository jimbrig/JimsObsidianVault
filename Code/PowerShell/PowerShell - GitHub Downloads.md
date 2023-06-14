---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "GitHub Downloads" ]
---

# GitHub Downloads

> [!SOURCE] Sources
> - *[[gh-dl-release] Download Assets from Private GitHub Releases #script #bash #powershell #github #utility](https://gist.github.com/jimbrig/03aa65c9b20dc3ad86bbb442f723672a#file-get-githubrelease-ps1)*
> - *[PSScripts/Get-GitHubRelease at main · jimbrig/PSScripts](https://github.com/jimbrig/PSScripts/tree/main/Get-GitHubRelease)*
> - *[PowerShell Gallery | Get-GitHubRelease 1.0.1](https://www.powershellgallery.com/packages/Get-GitHubRelease/1.0.1)*

## Contents

- [Code](#code)
	- [Original Version](#original-version)
- [Details](#details)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)



## Code

*Link: [PSScripts/Get-GitHubRelease.ps1 at main · jimbrig/PSScripts · GitHub](https://github.com/jimbrig/PSScripts/blob/main/Get-GitHubRelease/Get-GitHubRelease.ps1)*

```powershell
<# 
    .SYNOPSIS
        Retrieve the latest release from a GitHub repository.
    .DESCRIPTION
        Uses the GitHub API to pull the latest release of any app, tool or utility hosted on GitHub.
    .PARAMETER Repo
        GitHub Repository Reference in the format: <user/org>/<repo>.
    .PARAMETER Extensions
        Target glob patterns of desired extension to search for.
    .PARAMETER DownloadPath
        Path to download to, defaults to ~/Downloads.
    .EXAMPLE
        Get-LatestGitHubRelease -Repo 'r-darwish/topgrade' -Extensions @('.zip') -DownloadPath "$HOME\Downloads"
        # Downloads the latest release of topgrade from GitHub.
#> 
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True, Position = 0, HelpMessage = 'Enter the GitHub Repo Name (e.g. microsoft/winget-cli)')]
    [string]$Repo,
    [Parameter(Mandatory = $False, Position = 1, HelpMessage = 'Enter the file extensions to search for (e.g. .zip)')]
    [string[]]$Extensions = @('.zip', '.msi', '.exe', '.deb', '.rpm', '.pkg', '.dmg', '.tar.gz', '.tar.xz', '.tar.bz2', '.msi', 'appxbundle', 'appx', 'msixbundle', 'msix'),
    [Parameter(Mandatory = $False, Position = 2, HelpMessage = 'Path to download to, defaults to ~/Downloads')]
    [string]$DownloadPath = "$HOME\Downloads"
)

# Define Environment Variables
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'SilentlyContinue'
If (!($Extensions)) {
    $Extensions = @(".zip", ".msixbundle", ".msix", ".msi", ".exe", ".appxbundle", ".appx")
}

$ScriptRoot = Split-Path $MyInvocation.MyCommand.Path
$targetExtensions = $Extensions
$transcriptLogPath = $env:APPDATA + "\PSUtils\Logs\Get-LatestGitHubRelease.txt"
If (!(Test-Path $transcriptLogPath)) {
    New-Item -ItemType File -Path $transcriptLogPath -Force
}
# Initialize the script
Start-Transcript -Path $transcriptLogPath -Append -Force
Write-Host "[ Get-LatestGitHubRelease.ps1 ]"

# Step 1: Ask for user input
If (!$Repo) {
    $Repo = Read-Host -Prompt "Please Enter the GitHub Repo Name (e.g. microsoft/winget-cli)"
}
$repo = $Repo
# The URL to the GitHub API for Releases
$GitHubReleasesURL = "https://api.github.com/repos/$repo/releases"
Write-Host "Targeted Repo: " -NoNewline
Write-Host "$GitHubReleasesURL" -ForegroundColor Green

# Step 2: Get the latest release from GitHub
Write-Host "Getting the latest release from GitHub, please wait..."
Write-Host

try {

    # Send a 'GET' request to the GitHub REST API (returns JSON)
    $json = Invoke-WebRequest $GitHubReleasesURL -Method Get -ContentType "application/json" -Headers @{Accept = "application/vnd.github.v3+json" }

    # Convert the JSON to a PowerShell object
    $releaseObj = ($json | ConvertFrom-Json)[0]

    # Get the ID of the latest release
    $releaseId = $releaseObj.id

    # Get the name of the latest release
    $releaseName = $releaseObj.tag_name

    Write-Host "Latest Release: $releaseName"

    Write-Host "Retrieving list of assets from this release... "

    # The URL to the GitHub API for the latest release
    $apiUrlForRelease = "https://api.github.com/repos/$repo/releases/$releaseId/assets"
    $releaseAssetList = Invoke-RestMethod -Method Get -Uri $apiUrlForRelease -ContentType "application/json" -Headers @{Accept = "application/vnd.github.v3+json" }

    Write-Host "Finding download links for your Operating System, please wait... "
    foreach ($myAsset in $releaseAssetList) {
        # $assetId = $myAsset.id
        $assetName = $myAsset.name # Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
        # $assetAPIUrl = "https://api.github.com/repos/$repo/releases/assets/$assetId"
        $assetSizeMB = [math]::round($myAsset.size / 1MB, 2)
        $assetDownloadUrl = $myAsset.browser_download_url

        if (($targetExtensions | ForEach-Object { $assetName.contains($_) }) -contains $true) {
            Write-Host "Targeted Asset: " -NoNewline
            Write-Host "$assetName ($assetSizeMB MB)" -ForegroundColor Green
            $assetFileOutput = $DownloadPath + "\$assetName"
            Write-Host "[Asset Download URL] $assetDownloadUrl"
            Write-Host "[Asset Local File Name] $assetFileOutput"
            Write-Host "Downloading, please wait... " -NoNewline
            Invoke-WebRequest -Uri $assetDownloadUrl -OutFile $assetFileOutput
            Write-Host "Done!" -ForegroundColor Green
            break
        }
    }

    Write-Host
    Write-Host "Installing the package, please wait... "

    If ('.zip' -in $targetExtensions) {
        Write-Host "Unzipping downloaded zip: $assetName" -ForegroundColor Green
        Expand-Archive -Path $assetFileOutput -DestinationPath $DownloadPath -Force
    }

    Write-Host "Done!" -ForegroundColor Green
    explorer.exe $DownloadPath

} catch {
    Write-Host "An error occurred while trying to get the latest release from GitHub." -ForegroundColor Red
    $issueStr = "$($PSItem.ToString())"
    Write-Warning -Message $issueStr
    Write-Host
}

# End of Script
Stop-Transcript
```

### Original Version

```powershell
#!/usr/bin/env pwsh

Function Get-GitHubRelease {
    <#
        .SYNOPSIS
            Get the latest release of a GitHub repository
        .DESCRIPTION
            Get the latest release of a GitHub repository
        .PARAMETER User
            The GitHub user or organization
        .PARAMETER Repository
            The GitHub repository (can be private)
        .PARAMETER Token
            The GitHub API token (PAT)
            If not supplied will look for an Environment Variable `$env:GITHUB_API_TOKEN`.
        .PARAMETER Tag
            The tag to get the release for (i.e. `v1.0.0`)
        .PARAMETER File
            The asset to get the download URL for
        .PARAMETER OutputPath
            The path to save the asset to
            [NOTE]: Use the directory output, not the path + file + extension.
        .EXAMPLE
            Get-GitHubRelease -User 'jimbrig' -Repository 'app' -Tag 'v1.0.0' -Asset 'app.zip' -OutputPath "$HOME\Downloads"
			
			# Downloads the latest release of `app` repo from GitHub.
    #>    
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [string]$User,
        [Parameter(Mandatory=$true)]
        [string]$Repository,
        [Parameter(Mandatory=$false)]
        [string]$Token = $env:GITHUB_API_TOKEN,
        [Parameter(Mandatory=$true)]
        [string]$Tag,
        [Parameter(Mandatory=$true)]
        [string]$File,
        [Parameter(Mandatory=$true)]
        [string]$OutputPath
    )

    $url = "https://api.github.com/repos/$User/$Repository/releases/tags/$Tag"

    $headers = @{
        'Authorization' = "token $Token"
        'Accept' = 'application/vnd.github.v3+json'
    }

    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get

    $asset = $response.assets | Where-Object { $_.name -eq $File }

    $asset_url = $asset.browser_download_url

    $asset_path = Join-Path $OutputPath $File

    # Private
    $private_headers = @{
        'Authorization' = "token $Token"
        'Accept' = 'application/octet-stream'
    } 

    $private_uri = "https://$($Token):@api.github.com/repos/$User/$Repository/releases/assets/$($asset.id)"

    Invoke-WebRequest -SkipCertificateCheck -Uri $private_uri -Headers $private_headers -OutFile $asset_path -Resume -PassThru

}
```

## Details

> [!NOTE] About
> Uses the [[GitHub API]] to pull the latest release of any app, tool or utility hosted on [[Github]].


***

## Appendix: Links and References

*Note created on [[2023-06-01 1]] and last modified on [[2023-06-01 1]].*

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
list from [[PowerShell - GitHub Downloads]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - GitHub Downloads"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

