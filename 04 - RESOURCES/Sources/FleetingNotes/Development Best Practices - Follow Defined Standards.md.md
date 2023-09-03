---
ID: "f93fa2ce-ef32-42f2-a73f-6670fa0f26e1"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Development Best Practices - Follow Defined Standards.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Source", "Write", "Accept"]
Aliases:
  - "<% tp.file.title %>"
---


# Development Best Practices - Follow Defined Standards

## Contents

- [[#Source Code|Source Code]]
- [[#Write Code for Review|Write Code for Review]]
- [[#Accept Criticism but don't Criticize|Accept Criticism but don't Criticize]]


## Overview

Most of the standard software organizations maintain their coding standards. These standards would have been set up by well-experienced software developers after spending years with software development. This is equivalent to following footsteps of great people left behind them.

If your organization does not have any standard, then I would suggest to search on internet for coding standards off different programming languages and you will find many. A coding standard would fix the rules about various important attributes of the code, few are listed below:

-   File Naming convention
-   Function & Module Naming convention
-   Variable Naming convention
-   History, Indentation, Comments
-   Readability guidelines
-   List of do's and don'ts

But once defined, start following the defined standard instead of creating or changing them every day.

## Source Code

Keep it clean, consistent and beautiful. When I say beautiful, it really means beautiful. If your code looks beautiful, then it would be easy for others to read and understand it. If you will keep changing coding rules everyday, then after few days you, yourself would not be able to read and understand the code written by you.


## Write Code for Review

While writing your software code, keep in mind that someone is going to review your code and you will have to face criticism about one or more of the following points but not limited to:

-   Bad coding
-   Not following standard
-   Not keeping performance in mind
-   History, Indentation, Comments are not appropriate.
-   Readability is poor
-   Open files are not closed
-   Allocated memory has not been released
-   Too many global variables.
-   Too much hard coding.
-   Poor error handling.
-   No modularity.
-   Repeated code.

Keep all the above-mentioned points in your mind while coding and stop them before they jump in your source code. Once you are done with your coding, go for a self-review atleast once. I'm sure, a self-review would help you in removing 90% problems yourself.

Once you are completely done with your coding and self review, request your peer for a code review. I would strongly recommend to accept review comments happily and should be thankful to your code reviewers about the comments. Same time, it is never good to criticize any source code written by someone else. If you never did it, try it once and check the coder's expression.

## Accept Criticism but don't Criticize

Poorly written source code teaches you to write good source code provided you take it positively and learn a lesson from it.

![[Pasted image 20220729154248.png]]

Your target should be to stop the bugs at first place and create a BUG-FREE code. Think like a tester, so that you should have a challenge for the testers.

## Appendix: Links

- [[Development]]

*Backlinks:*

```dataview
list from [[Development Best Practices - Follow Defined Standards]] AND -"Changelog"
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