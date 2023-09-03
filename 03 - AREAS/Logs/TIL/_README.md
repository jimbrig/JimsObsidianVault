---
Date: 2023-07-03
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Readme", "#Topic/Meta", "#Topic/Learning", "#Type/Log" ]
Alias: [ "TIL", "TILs", "Today I Learned" ]
---

# Today I Learned (TIL)

> [!NOTE] About
> This folder houses short descriptions of things I learn each day.

## Overview

Today I Learned notes are divided by **Topics**:

```dataview
TABLE started AS Date, file.folder AS Topic, file.etags AS Tags 
FROM "Logs/TIL"
AND -"Logs/TIL/_README"
```



| Topic Name | Number of Notes |
| :----------: | :---------------: |
|            |                 |

## Guidelines

- Each note, or page, should be an *atomic factoid* that I **expect to refer to again in the future**.
	- Hence, anything along the lines of "This is interesting, but probably not useful..." (i.e. probably won't be referenced again in the future), is "trivia" and should not belong here.
	- Therefore, the contents are mostly technical findings, however, there are two primary exceptions:
		- [concepts] and [reading notes]

- Folder Structure represents categorization by a SINGLE main topic, not tagged with endless topics/sub-topics.

## Contents

```dataview
LIST FROM "Logs/TIL" AND -"CHANGELOG" AND -"Logs/TIL/_README"
```

***

## Appendix: Links and References

*Note created on [[2023-07-03]] and last modified on [[2023-07-03]].*

### Inspired By

- [secretGeek/today-i-learned-staging: the markdown source of today-i-learned (github.com)](https://github.com/secretGeek/today-i-learned-staging)
- - [Josh Branchaud's til](https://github.com/jbranchaud/til) — and [this Hacker news thread](https://news.ycombinator.com/item?id=11068902)
- [thoughtbot inc.'s til](https://github.com/thoughtbot/til)
- [Jake Worth's til](https://github.com/jwworth/til)

### See Also

- [wiki.secretGeek.net](https://wiki.secretgeek.net/) — Wiki of things I find fascinating, [fractals](https://wiki.secretgeek.net/Category/Fractal), [recursion](https://wiki.secretgeek.net/unbounded-recursion) etc.
- [secretGeek.net](https://secretgeek.net/) — my blog
- [List of Second Brains](https://github.com/KasperZutterman/Second-Brain#second-brain) — Kasper Zutterman's curated list of somewhat similar sites.
- [Digital Garden Directory](https://github.com/MaggieAppleton/digital-gardeners/#digital-garden-directory) — via Maggie Appleton

### Backlinks

```dataview
list from [[_README]] AND -"CHANGELOG" AND -"Logs/TIL/_README"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

