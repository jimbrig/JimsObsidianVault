---
Date: 2023-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "PSResourceGet" ]
---

# PSResourceGet

To install from PowerShellGet 3.0 previews

`Install-PSResource Microsoft.PowerShell.PSResourceGet -Prerelease`

To install from PowerShellGet 2.2.5

`Install-Module -Name Microsoft.PowerShell.PSResourceGet -AllowPrerelease`

Note that once you install this module you will need to re-register your repositories as the repository registration file has moved.

## Contents

[TOC]

## NuGet Gallery

*Link: <<% tp.file.cursor(2) %>>*

```powershell
Register-PSResourceRepository -Name "NuGetGallery" -Uri "https://api.nuget.org/v3/index.json"
```

## Azure DevOps Feed

To get the uri for your feed go to dev.azure.com > Artifacts > select desired feed > click “Connect to Feed” > choose “NuGet.exe”. then run `Register-PSResourceRepository -Name "AdoFeedName" -Uri <My_ADO_Feed_Uri>` If it is a public feed creds arent needed. If it is a private feed go to dev.azure.com > User Settings in top right corner > Personal Access Tokens > Create PAT token. In your PowerShell terminal, create credential with your username as your email account used for ADO, password will be PAT token from prior step. To use the credential persistence feature of PSResourceGet reference [the docs](https://learn.microsoft.com/en-us/powershell/gallery/powershellget/how-to/credential-persistence?view=powershellget-3.x). You can also use with the `-CredentialInfo` parameter.

```powershell
Register-PSResourceRepository -Name "AdoFeedName" -Uri <My_ADO_Feed_Uri>
```

## GitHub Packages

To register your feed run `Register-PSResourceRepository -Name "GithubPackagesFeed" -Uri "https://nuget.pkg.github.com/<NAMESPACE>/index.json"` Where is either the name of your account or your organization. For instructions on how to authenticate to your GitHub packages feed reference the documentation [here](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-nuget-registry#authenticating-to-github-packages). To use the credential persistence feature of PSResourceGet reference [the docs](https://learn.microsoft.com/en-us/powershell/gallery/powershellget/how-to/credential-persistence?view=powershellget-3.x). You can also use with the `-CredentialInfo` parameter.

```powershell
Register-PSResourceRepository -Name "GithubPackagesFeed" -Uri "https://nuget.pkg.github.com/<NAMESPACE>/index.json"
```

## Setup SecretManagement Vault

```powershell
Get-SecretInfo

$registerPSResourceRepositorySplat = @{ Name = 'artifactory' Uri = 'https://myaccount.jfrog.io/artifactory/api/nuget/v3/myrepository' Trusted = $true CredentialInfo = [Microsoft.PowerShell.PowerShellGet.UtilClasses.PSCredentialInfo]::new( 'SecretStore', 'JFrogCred') } Register-PSResourceRepository @registerPSResourceRepositorySplat
```

***

## Appendix: Links and References

*Note created on [[2023-07-17]] and last modified on [[2023-07-17]].*

### Internal Linked Notes

- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[PowerShell - PSResourceGet]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - PSResourceGet"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

