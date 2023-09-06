---
Date: 2023-09-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [
  "#Type/Code/GitHub",
  "#Type/Code/PowerShell",
  "#Type/Code/YAML",
  "#Topic/Dev/DevOps",
  "#Topic/Dev/GitHub",
  "#Status/Permanent"
]
Alias: [ "Sign PowerShell Scripts GitHub Action" ]
Source: "[[pwsh-sign-scripts.yml]]"
---

# Sign PowerShell Scripts GitHub Action

> [!SOURCE] Sources:
> - *[GitHub actions pipeline to sign PowerShell scripts](https://gist.github.com/nicolonsky/51338d0a62c88bfd1aba88b9a23eb335#file-signpowershell-yaml)*, but altered and enhanced.

## Code

- [[GitHub Actions|GitHub Action]] ([[YAML]]):

```embed-yaml
PATH: "vault://03 - AREAS/Code/GitHub Actions/src/pwsh-sign-scripts.yml"
TITLE: "SignPowerShellScripts.yml"
```

## Details

> Details about what the code does.

1. Imports a `.pfx` [[Code Signing Certificate]] into the [[PowerShell]] session.
2. Converts the certificate's signature through byte-encoding and decrypts the byte-encoded signature
3. Saves the certificate in the [[Windows Certificate Manager]] (`(certmgr.msc)`) under the path: `Cert:\CurrentUser\My`
4. Imports the saved certificate
5. Checks out the repository
6. For Each `.ps1` file or script in the repository, it tries to sign the script(s) via the `Set-AuthenticodeSignature` Command
7. Finally, the last step is to *publish/upload the signed artifacts* via the `actions/upload-artifact@v3` [[GitHub Actions|GitHub Action]], resulting in an artifact like so:

![](https://i.imgur.com/Dhg7xX7.png)



> [!TIP] Tip
> To enhance the signatures authenticity you can also supply the `-TimestampServer` parameter to `Set-AuthenticodeSignature` and providing a timestamp server URL (i.e. <http://timestamp.verisign.com/scripts/timstamp.dll> or <http://timestamp.comodoca.com/authenticode>).



***

## Appendix: Links and References

*Note created on [[2023-09-05]] and last modified on [[2023-09-05]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[03 - AREAS/Code/GitHub Actions/_README|GitHub Actions]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOC - Software|Software Engineering]]
- [[PowerShell - Create a Self-Signed Code Signing Certificate]]
- [[PowerShell - Automate Code Signing Certificate Signatures]]
- [[GHA - Build PowerShell Module]]
- [[GHA - Run Pester Tests]]
- [[GHA - Run PowerShell Script]]
- [[GHA - Publish PowerShell Module]]
- [[GHA - Build PowerShell Module Documentation]]
- [[Code Signing Certificate]]
- [[Authenticode]]
- [[Self Signed Cevelopment Certificates]]
- [[Windows Certificate Manager]]

### External References

- [Set-AuthenticodeSignature (Microsoft.PowerShell.Security) - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-authenticodesignature?view=powershell-7.3&WT.mc_id=ps-gethelp)
- [Time Stamping Authenticode Signatures - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/seccrypto/time-stamping-authenticode-signatures)

#### Backlinks

```dataview
list from [[GHA - Sign PowerShell Scripts]] AND -"CHANGELOG" AND -"03 - AREAS/Code/GitHub Actions/GHA - Sign PowerShell Scripts"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

