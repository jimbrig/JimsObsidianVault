---
Date: 2023-08-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Managing Modern AppX Packages

> [!SOURCE] Sources
> - *[Add-AppxPackage - PowerShell Command | PDQ](https://www.pdq.com/powershell/add-appxpackage/)*
> - *[Managing Modern Apps | Managing Appx Packages (daknetworks.com)](http://www.daknetworks.com/blog/615-managing-modern-apps-managing-appx-packages)*
> - *[How to remove Windows 10 apps and advertising | PDQ](https://www.pdq.com/blog/removing-windows-10-apps-and-advertising/)*
> - 

## Contents

- [Overview](#overview)
- [Location](#location)
- [How AppX Packages Work](#how-appx-packages-work)
- [Commands to Get Apps](#commands-to-get-apps)
- [Commands to Remove Apps](#commands-to-remove-apps)
	- [Removing Modern Apps from the Manifest (Provisioned) List](#removing-modern-apps-from-the-manifest-provisioned-list)
- [Adding Apps](#adding-apps)
- [Provision Apps](#provision-apps)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

> [!NOTE] About
> *Description of note contents.*

## Location

Modern AppX Applications are located at:

- `%WINDIR%\SystemApps\*`: For *System* Applications (i.e. [[Microsoft Edge]], Cortana, etc.)
- `%PROGRAMFILES%\WindowsApps\*`: For *Personal* Applications (i.e. installed from the [[Microsoft Store]])

## How AppX Packages Work

Let’s take a second to talk about how `AppX` packages work. The term *AppX Package* is a bit [[nebulous]]; all `AppX` packages are difference per-user and are installed in the User context.

Notes:
- Modern Apps are "provisioned" on the system. 
- This means they are **available** to every account on the system to be installed. 
- When this happens, the AppX is now on a "manifest-list" or provisioned-list. 
- When a new account signs in for the first time, all the provisioned-appx packages are installed for that account.

There are two *types* of `AppX` packages:

1. **AppX Packages**: These are what you see as a user, they are what are installed and available to you.
2. **Provisioned Appx Packages**: These (for lack of a better word) are the "package cache."
	- These are the manifest of what packages to install for each *NEW* user when they login.
	- This is why every time your operating system upgrades, you have to remove those apps again. 
	- This is part of what is going on behind the scenes of the fabulous message "hang tight, we're getting things ready for you" when you login to a new (or freshly upgraded) [[Windows]] machine.

Therefore, to remove apps permanently, one must remove them from the *manifest* as described below.

## Commands to Get Apps

To retrieve a list of all provisioned packages on a system run:

```powershell
Get-AppXProvisionedPackage -Online | Select PackageName
```

To get a list of all Modern Apps Installed for all accounts on the system:

```powershell
Get-AppXPackage -AllUsers | Select PackageFullName
```

or, for a specific account:

```powershell
Get-AppxPackage -User "<Domain>\<Account>"
```

## Commands to Remove Apps

To remove a single app:

```powershell
Remove-AppXProvisionedPackage -Online -PackageName <PackageName>
```

Since AppX packages use random names, it is probably easier to run the following:

```powershell
Get-AppxPackage | Where { $_.PackageFullName -like "*<pattern>*" } | Remove-AppXPackage
```

To remove all apps:

```powershell
Get-AppXProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online
```

To remove all apps, keeping a certain set, run the following:

> [!WARNING] Note
> This code will work, but the AppX Packages will come back during any Operating System Upgrades.

```powershell
# Specifiy Apps to Remove
$Apps = @(  
	"*BingWeather*"  
	"*ZuneMusic*"  
	"*ZuneVideo*"  
	"*King*"  
)

# Remove All AppX Packages:
ForEach ($App in $Apps){  
	Get-AppxPackage -AllUsers -Name $App | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue  
}
```

### Removing Modern Apps from the Manifest (Provisioned) List

To remove AppX packages from the provisioned list:

```powershell
$Apps = @(
	"*BingWeather*"
	"*ZuneMusic*"
	"*ZuneVideo*"
	"*King*" 
)

ForEach ($App in $Apps) {
	Get-AppxProvisionedPackage -Online | Where { $_.PackageName -like $App } | Remove-AppxProvisionedPackage -AllUsers -Online
}
```

## Adding Apps

Adding Modern AppX Apps is challenging because of the random characters in the `PackageNames`.

The steps to take are as follows:

1. Find the URL of the App:
	- Go to <https://www.microsoft.com> and find the URL of the app.
	- For example, the [[SpeedTest]] app's URL is: <https://www.microsoft.com/en-us/p/speedtest-by-ookla/9nblggh4z1jc>
2. Generate the [[Microsoft Store]] Link:
	- Go to <https://store.rg-adguard.net
	- Be sure to change the option to `RETAIL`
3. Download the `AppxBundle`
4. Install the `AppXBundle`:

For step (4):

```powershell
$BundlePath = "$HOME\Downloads\Ookla.SpeedtestbyOokla_1.13.154.0_neutral_~_43tc6nmvykmb6.appxbundle"
Add-AppXPackage -Path $BundlePath
Add-AppXProvisionedPackage -Online -SkipLicense -PackagePath $BundlePath
```

## Provision Apps

To Provision Modern Apps, they should be added to the `Manifest`:

```powershell
$AppXPath = Get-ChildItem -Path "$Env:ProgramFiles\WindowsApps" | 
	Where-Object { $_.BaseName -like "*<pattern>*"} | 
	Select FullName 
$RegisterPath = Join-Path $AppXPath.FullName "appxmanifest.xml"
Add-AppXPackage -DisableDevelopmentMode -Register $RegisterPath
```

or to add modern apps to the manifest:

```powershell
$ManifestPath = (Get-AppxPackage -Name "*WindowsCalculator*").InstallLocation + "\Appxmanifest.xml"
Add-AppxPackage -Path $ManifestPath -Register -DisableDevelopmentMode
```

***

## Appendix: Links and References

*Note created on [[2023-08-28]] and last modified on [[2023-08-28]].*

### Internal Linked Notes

- [[03 - AREAS/Code/PowerShell/_README|PowerShell]]
- [[About the AppxProvisioning.xml File]]
- [[MOC - Microsoft Windows|Microsoft Windows]]
- [[Cmd - DISM|DISM]]

### External References

- *[Add-AppxPackage - PowerShell Command | PDQ](https://www.pdq.com/powershell/add-appxpackage/)*
- *[Managing Modern Apps | Managing Appx Packages (daknetworks.com)](http://www.daknetworks.com/blog/615-managing-modern-apps-managing-appx-packages)*
- *[How to remove Windows 10 apps and advertising | PDQ](https://www.pdq.com/blog/removing-windows-10-apps-and-advertising/)*
- *[Fix problems with apps from Microsoft Store - Microsoft Support](https://support.microsoft.com/en-us/account-billing/fix-problems-with-apps-from-microsoft-store-93ed0bcf-9c12-3df6-6dda-92ec5d0415ac)*
- *[Re-register Microsoft Store app in Windows 10 | Tutorials (tenforums.com)](https://www.tenforums.com/tutorials/8239-re-register-microsoft-store-app-windows-10-a.html)*
- *[windows - How to get access to C:\Program Files\WindowsApps? - Super User](https://superuser.com/questions/498774/how-to-get-access-to-c-program-files-windowsapps)*
- *[reinstalling removed appx files (edugeek.net)](https://www.edugeek.net/forums/windows-10/174845-reinstalling-removed-appx-files.html#post1501010)*
- 

#### Backlinks

```dataview
list from [[Managing Modern AppX Packages]] AND -"CHANGELOG" AND -"01 - SLIPBOX/Managing Modern AppX Packages"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

