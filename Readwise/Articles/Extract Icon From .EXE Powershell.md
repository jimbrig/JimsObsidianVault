---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: raindrop
Link: https://community.spiceworks.com/topic/592770-extract-icon-from-exe-powershell
Tags: ["#Type/Highlight/Article"]
Aliases: ["Extract Icon From .EXE Powershell", "Extract Icon From .EXE Powershell"]
---
# Extract Icon From .EXE Powershell

## Metadata
- Author: [[community.spiceworks.com]]
- Full Title: Extract Icon From .EXE Powershell
- Category: #Type/Highlight/Article
- Document Tags: [[code]] [[favs]] [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] [[snippet]] [[tricks]] 
- URL: https://community.spiceworks.com/topic/592770-extract-icon-from-exe-powershell

## Highlights
- Function ExtractIcon {
  Param ( 
  [Parameter(Mandatory=$true)]
  [string]$folder
  )
  [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing') | Out-Null
  md $folder -ea 0 | Out-Null
  dir $folder *.exe -ea 0 -rec |
  ForEach-Object { 
  $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.FullName)
  Write-Progress "Extracting Icon" $baseName
  [System.Drawing.Icon]::ExtractAssociatedIcon($_.FullName).ToBitmap().Save("$folder\$BaseName.ico")
  }
  }
  ExtractIcon -folder "C:\Path"
