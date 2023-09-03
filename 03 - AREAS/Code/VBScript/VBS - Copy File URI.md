---
Date: 2023-08-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBS", "#Topic/Dev/VBScript"]
Alias: [ "Copy File URI" ]
---

# VBS - Copy File URI

> [!NOTE] About
> Visual Basic Script to copy a file's [[URI]] to the clipboard.

## Contents

- [Code](#code)
- [Details](#details)
- [Add Script to Send To Context Menu](#add-script-to-send-to-context-menu)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Code

> [!WARNING]
> This script only supports a single file / argument as the input, but it can be modified as necessary.

- Source Code File: [[copy-file-uri.vbs]]

```embed-vb
PATH: "vault://Code/VBS/src/Copy-File-URI.vbs"
TITLE: "Copy-File-URI.vbs"
```

## Details

> Details about what the code does.

The [[Code/VBS/_README|VBScript]] script performs the following:

1. Copies the file name to memory
2. Reverses slashes (i.e. from [[Windows]] path separator `\` to [[UNIX]] path separator `/`)
3. Replaces any spaces with [[URL]] encoded `%20`
4. Appends `file:///` to the beginning of the path

> [!TIP] TIP
> You can simply drag and drop any file directly onto the `.vbs` script to run the script on that file!  

## Add Script to Send To Context Menu

The script can be integrated into the [[Windows]] File Explorer [[Context Menu]]'s *Send To* [[Shell Folder]] as follows:

1. Run (`Win + R`) `shell:sendto` to open your user's `SendTo` folder (i.e. `%APPDATA%\Microsoft\Windows\SendTo`)
2. Create a new shortcut to the script and name it accordingly
3. Test by right clicking any file and selecting `Send To > Copy File URI` and testing if the converted path is copied to your clipboard


***

## Appendix: Links and References

*Note created on [[2023-08-26]] and last modified on [[2023-08-26]].*

> [!INFO] See Also:
> - [URI schemes - UWP applications | Microsoft Learn](https://learn.microsoft.com/en-us/windows/uwp/app-resources/uri-schemes)
> - 
> - [[PowerShell - ConvertTo-FilePathURI]]
> - [[DotNet - AbsoluteURIGenerator]]
> - [[Obsidian Advanced URI Plugin]]
> - [[Obsidian Actions URI Plugin]]
> - [[Obsidian File Path to URI Plugin]]
> - [[Obsidian Hotkey Helper Plugin]]
> - [[Obsidian Shell Commands Plugin]]
> - [[Obsidian Local REST API Plugin]]

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]
- [[Code/VBS/_README|VBS]]
- [[Windows]]
- [[Context Menu]]

### External References

- Original Source: 
	- [Generate "file://" URIs in Windows Explorer - Super User](https://superuser.com/questions/297060/generate-file-uris-in-windows-explorer)
- Related Obsidian Plugins on GitHub:
	- [Vinzent03/obsidian-advanced-uri: Advanced modes for Obsidian URI (github.com)](https://github.com/Vinzent03/obsidian-advanced-uri)
	- [czottmann/obsidian-actions-uri: A plugin for Obsidian (https://obsidian.md) that adds additional `x-callback-url` endpoints to the app for common actions — it's a clean, super-charged addition to Obsidian URI. (github.com)](https://github.com/czottmann/obsidian-actions-uri)
	- [MichalBures/obsidian-file-path-to-uri: Convert file path to uri for easier use of links to local files outside of Obsidian (github.com)](https://github.com/MichalBures/obsidian-file-path-to-uri)
	- [Taitava/obsidian-shellcommands: Execute system commands via hotkeys or command palette in Obsidian (https://obsidian.md). Some automated events are also supported, and execution via URI links. (github.com)](https://github.com/Taitava/obsidian-shellcommands)
	- [kzhovn/uri-commands-obsidian: Execute URIs from the command palette (github.com)](https://github.com/kzhovn/uri-commands-obsidian)
- Related Resources:
	- [UriExt.cs (microsoft.com)](https://referencesource.microsoft.com/#System/net/System/UriExt.cs,fb5ba9a46b2384ae)
	- [UrlCreateFromPathA function (shlwapi.h) - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/api/shlwapi/nf-shlwapi-urlcreatefrompatha)
	- [Shared with you - OneDrive (live.com)](https://onedrive.live.com/?authkey=%21AJofTHeUeIIQZTE&id=DED6DB63D5309C3D%21508031&cid=DED6DB63D5309C3D&parId=root&parQt=sharedby&parCid=C173AFA5FF2D3291&o=OneUp)

#### Backlinks

```dataview
list from [[VBS - Copy File URI]] AND -"CHANGELOG" AND -"Code/VBS/VBS - Copy File URI"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

