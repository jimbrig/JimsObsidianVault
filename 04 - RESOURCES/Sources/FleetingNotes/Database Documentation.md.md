---
ID: "7dcc93fa-818b-43da-97b8-a96f86549c14"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Database Documentation.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Development/R", "Development/Database", "Development/PostgreSQL"]
Aliases:
  - "<% tp.file.title %>"
---

---
creation date: 2021-04-20 10:59
modification date: Tuesday 20th April 2021 10:59:08
tags:
  [
    "#Development/R",
    "#Development/Database",
    "#Development/PostgreSQL"
  ]
author: Jimmy Briggs
---

# Database Documentation

## Schema

## Connecting

## Running Locally in Docker Container

- pgsync/pg_dump to retrieve SQL from remote hosted production database
- spin up docker container for postgres locally with correct credentials (password=p, port=5432, dbname = postgres, etc.)
- create copy of remote database's public schema in the newly created docker container
- connect to local container database instance from apps, API, etc.


## Resources:

### Tools

- Database Markup Language (DBML)
- dbdocs.io
- dbdiagram.io
- PostgreSQL
- psql
- pgcli

### GUI's

- pgAdmin4
- Valentina Studio
- DBeaver
- VSCode
- RStudio

### R Packages

- DBI
- RPostgres
- RPostgreSQL
- Pool
- dbplyr
- dbplyr
- dbx
- connections
- sqlpetr
- sqldf

and more...


***
Links: [MOC - PostgreSQL](../1-Maps-of-Content/MOC%20-%20PostgreSQL.md) | [PostgreSQL Tools](PostgreSQL%20Tools.md) | [MOC - System Design](../1-Maps-of-Content/MOC%20-%20System%20Design.md) | [MOC - Databases](../1-Maps-of-Content/MOC%20-%20Databases.md)
Source: <https://techdocs.powwater.org>





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