# PowerShell Functions Master List

- Functions:
	- *Windows Drivers:*
		- `Export-Drivers`
		- `Remove-OldDrivers`
	- *PowerShell Modules:*
		- `Update-PSModules`
		- `Remove-PSModules`
		- `Update-PowerShell`
		- `Update-PowerShellHelp`
		- `New-PSModule`
		- `New-PSModuleFunction`
		- `New-PSModuleManifest`
		- `New-PSModuleTest`
	- *System Administrator:*
		- `Export-ISO`
		- `Test-ProgramInstalled`
		- `Test-IsAdmin`
		- `Install-WindowsFeature` | `Remove-WindowsFeature`
		- `Set-RegistryValue` | `Set-RegistryBoolean` | `Remove-RegistryKey`
		- `Set-WindowsDeveloperMode`
		- `Enable-WindowsLongPaths`
		- `Edit-PSProfileDirectory`
		- `Edit-PSProfile`
		- `Edit-PSProfileFunctions`
	- *Installations:*
		- `Get-GithubDownloadURL` | `Download-FromGithub` | `Install-FromGithub`
		- `Install-FromURL`
		- `Install-FromZIP`
		- `Install-FromMSI`
	- *Obsidian:*
		- `Get-ObsidianVault`
		- `Select-ObsidianVault`
		- `Backup-ObsidianVault`
	- *Utility:*
		- `Extract-IconFromExe`
	- *Logging:*
		- `Write-Begin`
		- `Write-End`
		- `Write-Success`
		- `Write-Failure`
	- *Azure KeyVault:*
		- `Get-AzVault`
		- `Get-AzVaultSecret`
		- `New-AzVaultSecret`
	- *TroubleShooters:*
		- `Invoke-HardwareDiagnostic`
		- `Invoke-NetworkDiagnostic`
		- `Invoke-SearchDiagnostic`
		- `Invoke-WindowsUpdateDiagnostic`
		- `Invoke-MaintenanceDiagnostic`
		- `Invoke-CleanMgr`
		- `Invoke-DiskCheck`
		- `Invoke-MemoryCheck`
		- `Invoke-SFCScan`
		- `Invoke-DISMRepair`
		- `Invoke-EmptyRecycleBin`
		- `Invoke-CleanTempFiles`
		- `Invoke-SysCleanup`
		- `Invoke-TakeOwnership`
		- `Invoke-ForceDelete`
	- *Network:*
		- `Reset-Network`
		- `Get-PublicIP`
	
Edit-ProfileAliases
Edit-ProfileOptions
Edit-ProfileSettings
Edit-ProfileCompletions
Get-PSHistoryFilePath

Start-DockerDesktop
Stop-Docker

Open-RStudio
Open-GitKraken
Open-VSCode
Open-VSCodeInsiders
Open-RTerminal
Open-RTerminalVanilla
Open-RadianTerminal
Open-WindowsTerminal
Open-RProject
Install-RPackage


Get-ChocoPackages
Get-WinGetPackages
Get-ScoopPackages
Get-NPMPackages
Get-NPMVersions
Get-PIPPackages
Get-RPackages
Get-RVersions
Get-WSLDistros
Get-ODBCDrivers
Get-OLEDBDrivers
Get-OLEDBProviders
Get-ODBCDSNs

Search-GitHub
Search-GitHub -Language R,Powershell,Python,SQL,Terraform,etc.
Search-GitHubR
Search-GitHubMyRepos
Search-GitHubGists

Get-GCalAgenda
Get-GCalMonth
Get-GCalWeek
Get-GCalDay
Get-GCalEvent
Remove-GCalEvent

Backup-GitHubRepos
Backup-WSLDistros
Backup-UserProfile
Backup-AppData

Fido

Write-Log

Get-PSGalleryReport