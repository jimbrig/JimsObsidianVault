---
ID: "2036b2d6-1194-47fb-8aa4-b715bc213b2b"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Windows Dotfiles Musings.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev", "Topic/Windows"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2021-11-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev", "#Topic/Windows"]
Alias: "Windows Dotfiles Musings"
---

# Windows Dotfiles Musings

*Source: [CMCDragonkai/.dotfiles: Personal Configuration Management](https://github.com/CMCDragonkai/.dotfiles)*

Got the idea for utilizing the `%ALLUSERPROFILE%` from the source above:

From <https://github.com/CMCDragonkai/.dotfiles#interesting-paths>:

## Interesting Paths

`%ALLUSERSPROFILE%` - Points to a common user profile directory (that is viewable by all users on the OS). We should create a `%ALLUSERSPROFILE%/bin` directory to add PATH symlinks to all Windows executables that we install into here (this makes sense as installed Windows executables are usually installed on the entire system, not for a particular user). This refers to any natively installed Windows executable, or any extracted Windows executable.

`%APPDATA%\bin` - Should be used for User Profile installed Windows Apps bin. 

`%LOCALAPPDATA%\bin` - Should be used for User Profile locally installed Windows Apps bin.

Data files should generally be in `%LOCALAPPDATA%`, see [Manager.io](). But applications should be in Roaming Profile. At least there's no reason why not?

In linux, data is often considered shared, because they are architecture indepedent. So data should be on a roaming profile, but applications which is architecture specific should be on a local profile. Thus manager should be installing on a local profile. This means there should not be an `%APPDATA%\bin`. The Windows PATH includes `%LOCALAPPDATA%\bin`.

Path hierarchy on Windows:

-   Default Windows Paths (on Windows): `C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\`
-   Chocolatey path (on Windows): `%ALLUSERSPROFILE%\chocolatey\bin` (use `$env:ChocolateyPath\bin` instead)
-   Custom Windows Path (on Windows): `%ALLUSERSPROFILE%\bin`
-   Cygwin Paths (on Cygwin): `/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin`
-   Home paths (on Cygwin): `~/bin`

To take advantage of Home paths in CMD, make sure to set startup task to: `cmd /K %USERPROFILE%/.cmd_profile`

*Backlinks:*

```dataview
list from [[Windows Dotfiles Musings]] AND -"Changelog"
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