---
ID: "67820415-d221-439d-9faf-e731c0abaed9"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Windows Registry Paths and Keys.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Windows/Tips", "Windows/Registry", "Development/Configuration", "Windows/Computer", "Type/List"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-07-22 16:04
Last Modified Date: Thursday 22nd July 2021 16:04:24
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: Windows Registry Locations
Tags:
  [
    "#Windows/Tips",
		"#Windows/Registry",
    "#Development/Configuration",
    "#Windows/Computer",
    "#Type/List"
  ]
---

# Windows Registry Locations `fas:Windows`

## Long Path Support

- Key Path: `Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem`
- Key Value Name: `LongPathsEnabled`
- Key Value Type: `REG_DWORD`
- Key Value Data: `1`

![](assets/WinReg-LongPathSupport-Screenshot.png)

## Explorer Drive Icons

*I use this to tweak any icons associated with a mapped or mounted drive (i.e. G: Google Drive, etc.)*

- Key Path: `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DriveIcons\<Drive Letter>\DefaultIcon`
- Key Value Name: `(Default)`
- Key Value Type: `REG_SZ`
- Key Value Data: *Quoted Absolute Path to an Icon (`.ico`) file*.

***

Links: [Windows Registry](2-Slipbox/Windows%20Registry.md) | [How To Change Explorer Drive Icons via Registry](How%20To%20Change%20Explorer%20Drive%20Icons%20via%20Registry.md)

Sources: See [[2-Slipbox/Windows Registry#Resources]]




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