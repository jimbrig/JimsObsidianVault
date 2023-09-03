---
ID: "84177364-b24f-402a-baad-cafa7de799bd"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "How To Create a Folder Tree in Windows.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Windows", "Development", "Windows/Setup"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-08-20 19:27
Last Modified Date: Friday 20th August 2021 19:27:00
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: How To Create a Folder Tree in Windows
Tags: [ "#Windows", "#Development", "#Windows/Setup" ]
---

# How To Create a Folder Tree in Windows

> Source: [How to create a Folder Tree in Windows 10? (thewindowsclub.com)](https://www.thewindowsclub.com/how-to-create-a-folder-tree-in-windows-10)

## Commands

- Command: `CMD /c "Tree /F /A > <output file>"` 

```powershell
# xls
CMD /c "Tree /F /A > tree.xls"

# excel xlsx
CMD /c "Tree /F /A > tree.xlsx"

# text
CMD /c "Tree /F /A > tree.txt"

# copy to clipboard
CMD /c "Tree /F /A | clip"
```


## Create a Folder Tree in Windows 10

File Explorer helps to view or open files quickly in Windows 10 system. Users can steer through the directories using back, forward, up menus, navigation menus, directly entering the location in the address bar and scrolling over left or right panes.

But there are no ways Windows Explorer, lets you understand the entire structure of a directory. If you have spent an absurd amount of time scrolling through hundreds of files trying to spot the one you want, then a Folder Tree could make a difference. We already mentioned, that there is no direct way of viewing the folders/ files in a Tree format in Windows Explorer. Here a âTree commandâ could work.

The `tree` command can make it very simple for you to trace files and folders using the command line. You can view how a directory on your system is structured and where every file is located. Letâs see how to do this.

1\] Press **Win + E**Â keys to open the **File Explorer**Â and navigate to the target file folder for which you want to create a Folder Tree.

**Please note** â In our case, we selected the **C:\\Drivers**Â folder.

2\] In the address bar, copy-paste the below command:

CMD /c "Tree /F /A > test.xls"

![Folder Tree](https://www.thewindowsclub.com/wp-content/uploads/2021/03/Creating-folder-tree-in-Windows-10_1.jpg)

Explaining the composition of Tree Command â _CMD /c âTree /F /A > test.xlsâ_

-   â**cmd /c**â â used to activate command prompt.
-   â**Tree**â â Command name that generates the structure.
-   **â/F**â â listâs down the list of all the files in every folder. In the absence of this parameter, only folders would be listed.
-   **â/A**â â used for exporting the result in a file.
-   **â> Test.xl**sâ â Sample name and file type. In this case, itâs in excel format, but the same can be altered to txt, doc, pdf, dat, etc. to create the folder tree in the desired format.

3\] Press â**Enterâ**.

![Folder Tree](https://www.thewindowsclub.com/wp-content/uploads/2021/03/Creating-folder-tree-in-Windows-10_2.jpg)

This will create a new folder tree file name â**Testâ** in the **C:\\Drivers** folder.

Double-click on the file and you will be able to see the structured tree format of all files.

![Create a Folder Tree in Windows 10](https://www.thewindowsclub.com/wp-content/uploads/2021/03/Creating-folder-tree-in-Windows-10_3.jpg "Create a Folder Tree in Windows 10")

A Folder tree can be created for any specific folder on Windows 10. So, if the folder is located in â**F:\\test**â then the command should be altered to the following command:

cmd /c "tree F:\\test /f /a > Test.xls"

This simple tree command gives us a complete view of the directory on Windows 10. In no time at all, you will be able to create a folder tree that will not only give your files excellent organization but also keep your Windows files within easy reach.

![Folder Tree](https://www.thewindowsclub.com/wp-content/uploads/2021/03/Creating-folder-tree-in-Windows-10_3.jpg)
***

Links: [[Windows]] | [[Tips and Tricks]]

Sources: [How to create a Folder Tree in Windows 10? (thewindowsclub.com)](https://www.thewindowsclub.com/how-to-create-a-folder-tree-in-windows-10)



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