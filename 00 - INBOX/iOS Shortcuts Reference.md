---
Date: 2023-08-25
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# iOS Shortcuts Reference

> [!SOURCE] Sources
> - *[sebj/iOS-Shortcuts-Reference: Reference documentation for the iOS Shortcuts app file structure (github.com)](https://github.com/sebj/iOS-Shortcuts-Reference)*
> - *[zachary7829.github.io/blog/shortcuts/fileformat.html](https://zachary7829.github.io/blog/shortcuts/fileformat.html)*
> - 

## Overview

> [!NOTE] About
> *Description of note contents.*

## File Structure

On [[iOS]], [[Shortcuts]] are stored under the path `/var/mobile/Library/Shortcuts/` and depending on the operating system's version are stored in a database file:

- `Shortcuts.realm` for [[iOS]] 13
- `Shortcuts.sqlite` for [[iOS]] 14

## File Extension

- [[iOS]] [[Shortcuts]] use the `.shortcut` format. 
	- The `.shortcut` file format is a `blist` format, or **Binary Property List (`.blist`)**.
	- You can rename a `.shortcut` file to use the extension `.plist` to get a `plist` in [[XML]] format (`com.apple.plist`), and from this you can get a file of type `public.json`.
- On [[iOS]] 12/13/14 devices, a shortcut that's stored on a device can be exported as an unsigned `.shortcut` file by using the `Get My Shortcuts` action (You can use a Save File action to save the output). 
- iOS 15 is slightly different, however: you can't export shortcuts on device as unsigned shortcuts using Get My Shortcuts, only signed. 
	- Shortcuts in iOS 15 are signed with Apple Encrypted Archives - learn more about them [here](https://man.cameronkatri.com/macOS/aea). 
	- You can, however, get a unsigned `.shortcut` from the [[iCloud API]]. 
	- Let's upload a shortcut to [[iCloud]], and imagine our link is <https://www.icloud.com/shortcuts/77dfe31578ac4f6fb084ebb418b34a49>.
	- Change `/shortcuts/` to `/shortcuts/api/records/` ([Link](https://www.icloud.com/shortcuts/api/records/77dfe31578ac4f6fb084ebb418b34a49)). 
	- The value for `fields.shortcut.value.downloadURL` should be the URL for the unsigned `.shortcut` 
		- Note: If you opened in [[Safari]], change `\/` to `/` in the URL. 
		- After getting the unsigned `.shortcut`, rename this to a `plist` and you should be able to easily open this in `Xcode` (or, use set name to rename to `something.plist` with `Do Not Include File Extension` on, and Get Text from that).


***

## Appendix: Links and References

*Note created on [[2023-08-25]] and last modified on [[2023-08-25]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[iOS Shortcuts Reference]] AND -"CHANGELOG" AND -"//iOS Shortcuts Reference"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

