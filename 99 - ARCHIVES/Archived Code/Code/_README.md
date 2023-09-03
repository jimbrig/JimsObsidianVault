---
Date: 2023-05-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Readme", "#Topic/Meta"  ]
Alias: [ "Code", "Code Snippets", "Scripts", "Code Folder" ]
---

# Code

> [!NOTE] About
> This folder houses Code Snippets.

## Overview

## Contents

```dataview
LIST FROM "Code" AND -"CHANGELOG" AND -"Code/_README"
```

### Bash

```dataview
LIST FROM "Code/Bash" AND -"Code/Bash/_README" AND -"Code/_README"
```

```dataview
TABLE
join(file.tags, " ") as Tags
FROM "Code/Bash" AND -"Code/Bash/_README" AND -"Code/_README"
```

***

## Appendix: Links and References

*Note created on [[2023-05-17]] and last modified on [[2023-05-17]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[_README]] AND -"CHANGELOG" AND -"Code/_README"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

