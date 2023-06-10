---
Date: 2023-06-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev/VBA", "#Topic/Dev/Windows"]
Alias: [ "Excel Global Functions" ]
---



# Excel Global Functions

<!-- TOC -->

## Code

```vba
' -----------------------------------------------------------------------------
' Name        : modGlobals
' File        : modGlobals.bas
' Description : Global Project-Wide Objects
' Author      : Jimmy Briggs <jimmy.briggs@jimbrig.com
' Date        : 2023-06-10
' -----------------------------------------------------------------------------
Option Explicit

Private Const MODULE_NAME As String = "modGlobals"

Const APP_NAME As String = "PersonalXL"
Const APP_VERSION As String = "1.0.0"


' -----------------------------------------------------------------------------'
' Name        : WBPath
' Description : Returns the path of the current workbook.
' Author      : Jimmy Briggs <jimmy.briggs@jimbrig.com>
' Date        : 2023-06-10
' -----------------------------------------------------------------------------'
Public Function WBPath() As String
  WBPath = ActiveWorkbook.Path
End Function

' -----------------------------------------------------------------------------'
' Name        : PathSep
' Description : Returns the path separator for the current OS.
' Author      : Jimmy Briggs <jimmy.briggs@jimbrig.com>
' Date        : 2023-06-10
' -----------------------------------------------------------------------------'
Public Function PathSep() As String
  PathSep = Application.PathSeparator
End Function

' -----------------------------------------------------------------------------'
' Name        : TimeStamp
' Description : Returns a timestamp string.
' Author      : Jimmy Briggs <jimmy.briggs@jimbrig.com>
' Date        : 2023-06-10
' -----------------------------------------------------------------------------'
Public Function TimeStamp() As String
  TimeStamp = Format$(Now(), "yyyy-MM-DD:HH-MM-SS")
End Function

' -----------------------------------------------------------------------------'
' Name        : WBAuthor
' Description : Returns the author of the current workbook.
' Author      : Jimmy Briggs <jimmy.briggs@jimbrig.com>
' Date        : 2023-06-10
' -----------------------------------------------------------------------------'
Public Function WBAuthor() As String
  WBAuthor = ActiveWorkbook.BuiltinDocumentProperties("Author")
End Function

' -----------------------------------------------------------------------------'
' Name        : WBName
' Description : Returns the name of the current workbook.
' Author      : Jimmy Briggs <jimmy.briggs@jimbrig.com>
' Date        : 2023-06-10
' -----------------------------------------------------------------------------'
Public Function WBName() As String
  WBName = ActiveWorkbook.Name
End Function

' -----------------------------------------------------------------------------'
' Name        : SheetName
' Description : Returns the name of the current sheet.
' Author      : Jimmy Briggs <jimmy.briggs@jimbrig.com>
' Date        : 2023-06-10
' -----------------------------------------------------------------------------'
Public Function SheetName() As String
  SheetName = ActiveSheet.Name
End Function
```

## Details

> Details about how the code works and what it accomplishes.

The `modGlobals` [[Code/VBA/_README|VBA]] module contains helper functions such as:

- `WBPath()`:
- `PathSep()`:
- `WBAuthor()`:
- `TimeStamp()`:
- `WBName()`:
- `SheetName()`:


***

## Appendix: Links and References

*Note created on [[2023-06-10]] and last modified on [[2023-06-10]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[Code/VBA/_README|VBA Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOC - Microsoft|Microsoft Windows]]
- [[MOC - Software|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[VBA - Excel Global Functions]] AND -"CHANGELOG" AND -"Code/VBA/VBA - Excel Global Functions"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

