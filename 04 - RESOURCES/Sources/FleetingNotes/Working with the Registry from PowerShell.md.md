---
ID: "282d0a47-75fc-4b08-8e19-dc6479a9d609"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Working with the Registry from PowerShell.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Creating", "Renaming", "Deleting", "Related"]
Aliases:
  - "<% tp.file.title %>"
---


# Working with the Registry from PowerShell

Sources:
- https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-registry-entries?view=powershell-7.2
- https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-registry-keys?view=powershell-7.2
- https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-files-folders-and-registry-keys?view=powershell-7.2

## Contents

- [[#Creating New Registry Entries|Creating New Registry Entries]]
- [[#Renaming Registry Entries|Renaming Registry Entries]]
- [[#Deleting Registry Entries|Deleting Registry Entries]]
		- [[#Related|Related]]


## Creating New Registry Entries

To add a new entry to the [[Registry]], use `New-ItemProperty` with the path to the key, the entry name, and the value of the entry. 

For this example, to add a new entry for `$PSHOME` (The [[Windows PowerShell]] variable `$PSHome` stores the path to the installation directory for [[Windows PowerShell]]), use the following command. Not that the command also returns information about the new entry:

```powershell
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath -PropertyType String -Value $PSHome
```

Returns:

```powershell
PSPath         : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion
PSParentPath   : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
PSChildName    : CurrentVersion
PSDrive        : HKLM
PSProvider     : Microsoft.PowerShell.Core\Registry
PowerShellPath : C:\Program Files\Windows PowerShell\v1.0
```

TheÂ **PropertyType**Â must be the name of aÂ **Microsoft.Win32.RegistryValueKind**Â enumeration member from the following table:

| PropertyType Value | Meaning                                                                       |
| ------------------ | ----------------------------------------------------------------------------- |
| Binary             | Binary data                                                                   |
| DWord              | A number that is a valid UInt32                                               |
| ExpandString       | A string that can contain environment variables that are dynamically expanded |
| MultiString        | A multiline string                                                            |
| String             | Any string value                                                              |
| QWord              | 8 bytes of binary data                                                        |

```ad-note

You can add a registry entry to multiple locations by specifying an array of values for theÂ **Path**Â parameter.

```

```powershell
New-ItemProperty -Name PowerShellPath -PropertyType String -Value $PSHome `
  -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion, HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion
```

You can also overwrite a pre-existing registry entry value by adding the Force parameter to any `New-ItemProperty` command.


## Renaming Registry Entries

To rename a specific [[Registry]] entry use the `Rename-ItemProperty` cmdlet:

```powershell
# rename theÂ **PowerShellPath**Â entry to "PSHome"
Rename-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath -NewName PSHome

# To display the renamed value, add theÂ **PassThru**Â parameter to the command
Rename-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath -NewName PSHome -passthru
```

## Deleting Registry Entries

To delete a key/entry from a specific path in the [[2-Areas/Code/Windows Registry/_README|Registry]] use theÂ `Remove-ItemProperty` cmdlet:

```powershell
Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PSHome
Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath
```



***

##  Appendix: Links

- [[Development]]
- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[2-Areas/Code/Windows PowerShell/_README|Windows PowerShell]]
- [[2-Areas/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[2-Areas/Code/Windows/_README|Windows]]
- [[2-Areas/Code/Windows Registry/_README|Registry]]

*Backlinks:*

```dataview
list from [[Working with the Registry from PowerShell]] AND -"Changelog"
```

***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>