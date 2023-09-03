---
Date Created: 2023-06-21
Date Modified: 2023-06-21
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Meta", "#Topic/Obsidian" ]
Alias: [ "Dataview Examples" ]
---

# Dataview Examples

> [!SOURCE] Sources:
> [Dataview Examples - Fork My Brain (nicolevanderhoeven.com)](https://notes.nicolevanderhoeven.com/obsidian-playbook/Obsidian+Plugins/Community+Plugins/dataview/Dataview+Examples)

## Overview

Below are some examples of use cases with Dataview and the queries for them, so that you can reuse them.

## Contents

- [Return based on file path](#return-based-on-file-path)
- [Return files in a folder that aren't in a subfolder](#return-files-in-a-folder-that-arent-in-a-subfolder)
- [Return tasks with a tag](#return-tasks-with-a-tag)
- [Return tasks, grouped by link](#return-tasks-grouped-by-link)
- [Calculate dates](#calculate-dates)
- [Display a table with authors and titles, but grouped by author](#display-a-table-with-authors-and-titles-but-grouped-by-author)
- [Return files in the last month](#return-files-in-the-last-month)
- [Return unprocessed files from a folder in the last month](#return-unprocessed-files-from-a-folder-in-the-last-month)
- [Count number of results returned](#count-number-of-results-returned)


### Return based on file path

The query below returns the file link and created date for pages from the folder `Exandria` that also have `Port Damali` in the file path. This holds true for files in `Exandria/Port Damali` but also for those in `Exandria/Menagerie Coast/Port Damali`, for example.

````
```dataview
  table file.cday as "Date Created"
  from "Exandria" 
  where contains(file.path, "Port Damali")
  sort file.name asc
```
````

Here's the sample result returned:

![](https://i.imgur.com/lp9pxXG.png)

### Return files in a folder that aren't in a subfolder

Given a folder `ttrpgs` that has many folders in it, including `ttrpgs/Temporary White Circle`, return all files except those in `ttrpgs/Temporary White Circle`:

````
```dataview
TABLE file.folder as "Folder" from "ttrpgs"
where !contains(file.folder,"Temporary")
```
````

### Return tasks with a tag

````
```dataview
TASK from "foldername"
where contains(text,"mytag")
```
````

### Return tasks, grouped by link

Add `group by file.link` to show the file that each task came from.

````
```dataview
TASK from "Daily"
where contains(text,"2022-10-08")
group by file.link
```
````

This will display something like this:

![](https://i.imgur.com/ETLWrIc.png)

### Calculate dates

Use the metadata somewhere in your note:

> startDate:: 2022-07-10  
> endDate:: 2022-07-14

Then, use the Dataview query below:

````
```dataview
TABLE startDate, endDate, (endDate - startDate) AS Duration FROM "Daily"
WHERE endDate
SORT endDate desc
```
````

You'll get the following table:

![](https://i.imgur.com/c2m1p5R.png)

### Display a table with authors and titles, but grouped by author

For notes with the field `Author`, use this query:

````
```dataview
TABLE rows.title as "Title" from "Readwise/Books"
where Author
Group by Author
```
````

For example, if you had two books, _A Spell for Chameleon_ and _Source of Magic_, both of which had `Author: Piers Anthony` in the frontmatter, you'd get this result:

![](https://i.imgur.com/nIrQDRY.png)

### Return files in the last month

````
```dataview
TABLE file.mtime as "Last Modified", file.tags as Tags
WHERE file.mtime >= date(today) - dur(1 month)
```
````

This returns notes that were modified within the last month, as well as their tags, like this:

![](https://i.imgur.com/KSP0nbZ.png)

### Return unprocessed files from a folder in the last month

If you use the [Readwise Official](https://notes.nicolevanderhoeven.com/Readwise+Official) plugin, here's a query that returns all new Readwise-imported notes with the tag `#TVZ` (you can change this to whatever tag you use for your inbox) that were _modified_ within the last month.

````
```dataview
TABLE file.mday from "Readwise"
where file.mtime >= date(today) - dur(1 month)
and file.name != "Readwise Syncs"
and contains(file.tags,"TVZ")
sort file.mtime desc
```
````

The query returns something like this:

![](https://i.imgur.com/OAV9sIl.png)

### Count number of results returned

This returns notes of `type: session` whose filenames start with `2022`:

````
```dataview
table length(rows) as Number from "TTRPGs"
where contains(type,"session") and contains(file.name,"2022")
group by type
```
````

***

## Appendix: Links and References

*Note created on [[2023-06-21]] and last modified on [[2023-06-21]].*

### Internal Linked Notes

- [[03 - AREAS/Tools/Tools - PKM/Obsidian/Plugins/DataView/_README|DataView]]
- [[Built-In Plugins]]
- [[Community Plugins]]

### External References

#### Backlinks

```dataview
list from [[DataView Examples]] AND -"CHANGELOG" AND -"Meta/Plugins/DataView/DataView Examples"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023