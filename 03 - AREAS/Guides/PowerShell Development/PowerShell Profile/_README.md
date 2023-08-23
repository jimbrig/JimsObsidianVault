---
Date: 2023-06-14
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Readme", "#Topic/Meta"  ]
Alias: [ "PowerShell Profile" ]
---

# PowerShell Profile

> [!NOTE] About
> This folder houses notes related to setting up and configuring a customized [[03 - AREAS/Guides/PowerShell Development/PowerShell Profile/_README|PowerShell Profile]].

## Overview

The [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] startup `$PROFILE` is an integral piece of a [[Reference/Technology/Computer Science/Operating System/Windows]] Developer's Toolbox.

The various components of the `$PROFILE` are initialized at startup for every PowerShell session.

By default, on [[Reference/Technology/Computer Science/Operating System/Windows]] the profile(s) are located at:

- `~/Documents/PowerShell` for [[PowerShell Core]]
- `~/Documents/WindowsPowerShell` for [[Windows PowerShell]]

> [!warning] Warning:
> If you are using the *backup* feature with [[OneDrive]] on your Documents folder the paths with change to `~/OneDrive/Documents/*`, respectively.

## Backup and Version Control

As a developer, you should keep your [[Reference/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] profile(s) under [[Version Control]] along with your other System [[Dotfiles]].

A good standard is to create a root-home-level `~/.dotfiles` directory that is tracked by [[Tools/Tools - Version Control/Git]] and hosted on [[Tools/Tools - Version Control/Github]] which contains the various [[Dotfiles]] on the machine for that user.

For example, to add the [[PowerShell Core]] profile to your dotfiles you would run:

```powershell
# Move CurrentUserAllHosts Profile to dotfiles folder, keeping the home directory tree structure:
Move-Item "$HOME\Documents\PowerShell\profile.ps1" "$HOME\.dotfiles\PowerShell\Documents\PowerShell\profile.ps1"

# Add a symlink back to default location
New-Item -Path "$HOME\Documents\PowerShell\profile.ps1" `
	-ItemType SymbolicLink `
	-Value (Get-Item "$HOME\.dotfiles\PowerShell\Documents\PowerShell\profile.ps1").FullName
```

to reload your profile simply dot-source it:

```powershell
. $PROFILE
```

## Setup

```powershell
#Requires -RunAsAdministrator

# Execution Policy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Machine -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Trust PSGallery
Set-PSRepository -



## Contents

```dataview
LIST FROM "Guides/PowerShell Development/PowerShell Profile" AND -"CHANGELOG" AND -"Guides/PowerShell Development/PowerShell Profile/_README"
```

***

## Appendix: Links and References

*Note created on [[2023-06-14]] and last modified on [[2023-06-14]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[_README]] AND -"CHANGELOG" AND -"Guides/PowerShell Development/PowerShell Profile/_README"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

