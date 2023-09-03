---
ID: "f33fffd2-4b73-4baf-b5a4-4385528fdfa5"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Development Best Practices - Document and Keep Tools and Techniques Handy.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# Development Best Practices - Document and Keep Tools and Techniques Handy

## Overview

**Keep your Tools & Techniques Handy**

I remember an instance when I wanted to find outÂ **debug**Â keyword in all the C++ files available in various directories and sub-directories, it took me 30 minutes to find the command, but finally, I kept a note of the command, and whenever I'm in need, I use it without wasting a second.

```c++
$find . -name \*.cpp -exec grep -q "debug" '{}' \; -print
```

So, I made it one of the best practices to keep such commands and tools handy so that they can be used anytime without doing any R&D and to save valuable time. Better to maintain a text file having all such frequently used commands and create its link at desktop.

## Tools

![[Pasted image 20220729154802.png]]

It depends on what type of programming, coding you are doing but following are few of the essential tools, which should be readily available with a software developer:

-   A good text editor to write and edit the program.
    
-   A nice debugger to debug the program.
    
-   A memory detector in case you are using dynamic memory allocation.
    
-   Putty to connect to a remote machine.
    
-   WinSCP or FileZilla to ftp files on a remote machine.
    
-   IDE ( Integrated Development Environment) for rapid development.

### Maintain your Lists

**Always keep adding new tools & techniques in your box**

Make sure you keep applying latest patches of your tools and utilities and same time I will suggest to clean unwanted software from your computer as they unnecessarily make your computer slow and you never know if any one of them is having a security hole, which can expose your computer to the outside world.

*Backlinks:*

```dataview
list from [[Development Best Practices - Document and Keep Tools and Techniques Handy]] AND -"Changelog"
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