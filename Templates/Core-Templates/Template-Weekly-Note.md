---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Weekly", "#Topic/Journal" ]
Alias: [ "<% tp.date.now("[W]-YYYY-MM-ww") %>" ]
---

<< [[<% tp.date.yesterday() %>]] | [[<% tp.date.tomorrow() %>]] >>

# <% moment(tp.file.title,'[W]-YYYY-MM-ww').format("dddd, MMMM DD, YYYY") %>

## Goals

- [ ] 1
- [ ] 2
- [ ] 3

## Preparation

- [ ] Clear Workstation
- [ ] Inbox Zero
	- [ ] Email:
		- [ ] jimmy.briggs@jimbrig.com
		- [ ] jimmy.briggs@lakecountryhuntclub.com
	- [ ] Todoist
	- [ ] Phone:
		- [ ] Texts
		- [ ] Calls
		- [ ] App Notifications
	- [ ] Computer Files:
		- [ ] Personal OneDrive Inbox
		- [ ] Desktop Inbox
		- [ ] Downloads Folder
	- [ ] Obsidian Inbox
	- [ ] Raindrop.io Inbox

## Last Week

![[W-<% tp.date.now("YYYY-MM") %>-<% tp.date.now("ww"), -1 %>## Reflections]]

## Reflections

### What Went Well This Week?

### What Should I Stop Doing?

### What Can be Improved?

### What Inspired or Motivated me this Week?

### What Drained me this Week?

## Next Week Planning

### OKRs

```dataview
LIST
FROM ""
```

> Personalized daily activity logs

## Discoveries

> Anything relevant that I discovered on this day (i.e. tools, technology, articles, podcasts, videos, people, etc.)

## Notes

> Scratchpad for daily notes

## Tasks

```todoist
name: Highest Priority & Date
filter: "today | overdue"
sorting: 
   - date
   - priority
group: true
```


### Generated Notes Today:

```dataview
TABLE file.folder AS Folder 
WHERE file.cday = date(this.file.name) AND file.name !=(this.file.name) 
SORT file.folder ASC, file.name ASC
```

### Modified Notes Today:

```dataview
TABLE file.folder AS Folder
WHERE file.mday = date(this.file.name) 
	AND file.name !=(this.file.name)
SORT file.mtime asc
```

***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

- [[Daily Notes]]

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"Changelog" AND -"<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>