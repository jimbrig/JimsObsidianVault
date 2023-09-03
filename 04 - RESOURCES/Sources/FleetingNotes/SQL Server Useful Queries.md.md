---
ID: "e10b7764-c6ec-47f4-91bd-582061118b24"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "SQL Server Useful Queries.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Create", "Create", "Utilize"]
Aliases:
  - "<% tp.file.title %>"
---


# SQL Server Useful Queries

## Contents

- [[#Create a Database Conditionally|Create a Database Conditionally]]
- [[#Create Schema Conditionally|Create Schema Conditionally]]
- [[#Utilize `sp_sql` to Run Dynamic SQL|Utilize `sp_sql` to Run Dynamic SQL]]



## Create a Database Conditionally

Use this query to generate a database using the `CREATE DATABASE` command, dropping any pre-existing databases with the same name.

```SQL
-- Check if Datatbase exists and DROP if it does:
IF DATABASEPROPERTYEX ('<dbname>', 'Version') IS NOT NULL
BEGIN
    ALTER DATABASE [<dbname>] SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [<dbname>];
END
GO
```

*REPLACE `<dbname>` with the name of the database.*

**Notes**:
- Notice the use of the `DATABASEPROPERTYEX ('<dbname>', 'Version')` (See [[SQL Server System Functions#DATABASEPROPERTYEX]])^[1]
- Notice you must `ALTER` the database using `SET SINGLE_USER` first in order to make this work properly
- Create a database, removing any previous database with an identical name

## Create Schema Conditionally


## Utilize `sp_sql` to Run Dynamic SQL



***

## Appendix: Links

- [[SQL Server - DBA MultiTool]]




*Backlinks:*

```dataview
list from [[SQL Server Useful Queries]] AND -"Changelog"
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