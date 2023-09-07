---
Date Created: 2023-09-07
Date Modified: 2023-09-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code/CSS", "#Topic/Dev/CSS" ]
Aliases: [ "Obsidian Banner" ]
---

# Obsidian Banner

> [!SOURCE] Sources:
> - *[(CSS) How to Style the First Image in a Note? - Help - Obsidian Forum](https://forum.obsidian.md/t/css-how-to-style-the-first-image-in-a-note/52839/9)*

## Contents

[TOC]

## Code

```embed-css
PATH: "vault://03 - AREAS/Code/CSS/src/obsidian-banner.css"
TITLE: "obsidian-banner.css"
```



```
.obsidian-banner img {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 300px;
  width: 100%;
  margin-right: auto;
  margin-left: auto;
  object-fit: cover;
  object-position: center;
  overflow: hidden;
  user-select: none;
 }
 .obsidian-banner .inline-title {
  margin-top: 300px;
 }

 .obsidian-banner.is-readable-line-width img {
  width: var(--file-line-width);
}
```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-09-07]] and last modified on [[2023-09-07]].*

### Internal Linked Notes

- [[CSS]]
- [[03 - AREAS/Code/CSS/_README|CSS Code Snippets]]
- [[03 - AREAS/Technology/Programming/Web Development/Frontend/HTML|HTML]]
- [[MOC - Web Development|Web Development]]
- [[03 - AREAS/Code/_README|Code Snippets]]
- [[MOC - Development|Development]]
- [[MOC - Technology|Technology]]

### External References

#### Backlinks

```dataview
list from [[CSS - Obsidian Banner]] AND -"CHANGELOG" AND -"03 - AREAS/Code/CSS/CSS - Obsidian Banner"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

