---
ID: "39deb3ad-873d-4e92-900f-ded7e0d02c55"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Edge Search Engines.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev", "Topic/Windows"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2021-11-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev", "#Topic/Windows"]
Alias: "Edge Search Engines"
---

# Edge Search Engines

## Search Engines and Address Bar

Use <edge://version> to retrieve `PATH` where profile specific settings are stored in `%localappdata%` for [[Microsoft Edge]]:

- Edge (stable): `%LOCALAPPDATA%\Microsoft\Edge\User Data\Default`
- Edge Dev: `%LOCALAPPDATA%\Microsoft\Edge Dev\User Data\Default`
- Edge Beta: `%LOCALAPPDATA%\Microsoft\Edge Beta\User Data\Default`
- Edge Canary: `%LOCALAPPDATA%\Microsoft\Edge SxS\User Data\Default`

The *searchEngines* and their keywords are stored in the file: Web Data within the aforementioned folder(s); however, this file 
is not a text file, rather a version of a `.sqlite` database.

Therefore, to extract and view this data, utilize the [DB Browser for SQLite Utility](https://sqlitebrowser.org/) to extract the tables from the database.

- Can be installed with chocolatey via: `cinst sqlitebrowser.install`. 

I exported `keywords.csv` from that, which houses information on my custom *searchEngines* <edge://settings/searchEngines>.

---

Useful Post (although about Chrome): https://superuser.com/questions/272511/where-do-chrome-chromium-store-search-keywords



*Backlinks:*

```dataview
list from [[Edge Search Engines]] AND -"Changelog"
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