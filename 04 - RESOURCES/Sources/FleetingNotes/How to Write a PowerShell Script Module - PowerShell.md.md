---
ID: "31d3079d-fb8b-4d78-a409-4ae1e2c60772"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "How to Write a PowerShell Script Module - PowerShell.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---

*   Article
*   06/09/2022
*   7 minutes to read

A script module is any valid PowerShell script saved in a `.psm1` extension. This extension allows the PowerShell engine to use rules and module cmdlets on your file. Most of these capabilities are there to help you install your code on other systems, as well as manage scoping. You can also use a module manifest file, which describes more complex installations and solutions.

Writing a PowerShell script module
----------------------------------

To create a script module, save a valid PowerShell script to a `.psm1` file. The script and the directory where it's stored must use the same name. For example, a script named `MyPsScript.psm1` is stored in a directory named `MyPsScript`.

The module's directory needs to be in a path specified in `$env:PSModulePath`. The module's directory can contain any resources that are needed to run the script, and a module manifest file that describes to PowerShell how your module works.

Create a basic PowerShell module
--------------------------------

The following steps describe how to create a PowerShell module.

1.  Save a PowerShell script with a `.psm1` extension. Use the same name for the script and the directory where the script is saved.
    
    Saving a script with the `.psm1` extension means that you can use the module cmdlets, such as [Import-Module](/en-us/powershell/module/Microsoft.PowerShell.Core/Import-Module). The module cmdlets exist primarily so that you can import and export your code onto other user's systems. The alternate solution would be to load your code on other systems and then dot-source it into active memory, which isn't a scalable solution. For more information, see [Understanding a Windows PowerShell Module](understanding-a-windows-powershell-module?view

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