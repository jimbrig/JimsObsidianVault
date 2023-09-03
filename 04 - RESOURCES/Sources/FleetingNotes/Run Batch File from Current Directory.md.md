---
ID: "dffc7336-d32d-4ce1-9ac7-8c45c2c65bb5"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Run Batch File from Current Directory.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-08-22 16:33
Last Modified Date: Sunday 22nd August 2021 16:33:52
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: Run Batch File from Current Directory
Tags: []
---

# Run a Windows Batch File from the Current Directory

Hereâs a little bit of Windows batch file magic that I never remember off the top of my head so Iâll log it here.

When you want your batch file commands to be executed from the current directory, putting the following at the start of your batch file should do the trick:  
`cd /d %~dp0`

The âcdâ meaning âchange directoryâ is easy enough to understand. The â/dâ tells cd to change drive and directory at the same time.

Now, that cryptic â%~dp0â is where the real work is done. %0 refers to the zeroth parameter of the batch file: the batch file itself. Adding the â~dpâ modifier draws out the drive and path of the batch file sans its filename, hence the current directory.

To see more batch parameter modifiers, check out this [page](https://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/percent.mspx?mfr=true) from Microsoftâs documentation.

***

Links: 

Sources: [Run a Windows Batch File from the Current Directory â Skyboy Games](http://skyboygames.com/quick-tip-run-a-windows-batch-file-from-the-current-directory/#:~:text=The%20%E2%80%9Ccd%E2%80%9D%20meaning%20%E2%80%9Cchange%20directory%E2%80%9D%20is%20easy%20enough,of%20the%20batch%20file%3A%20the%20batch%20file%20itself.)



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