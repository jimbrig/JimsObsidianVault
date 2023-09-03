---
ID: "9366654e-d5c2-4ba3-b275-ca3be0128210"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Views vs. Materialized Views.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# Views vs. Materialized Views

What are the major differences between a view and materialized view, and why should you use one over the other?

## Views

Normal views have their own advantages and disadvantages in comparison to *materialized views*.

A view is created with the `Create View` `SQL` command and contains all data obtained from the supplied view query expression. 

A primary advantage of views is that you can query them in the same manner as you would any normal database schema's table and retrieve the latest updated calculated results. 

The key here is that views **always compute** every time they are queried or accessed in any way; which may be seen as both a pro and con.

Another side-note is that in the circumstance you make any type of update to the content in a View, it will always be *âpushed backâ* and updated in the original table.

Likewise, the reverse is also true: any changes that are made to the original base table are instantly reflected in the View.

What this means, however, is that the performance of a View will **always be slower** than that of a materialized view. The major advantage is that a View doesnât actually require storage space. You can also have total control over which users can or cannot view sensitive information within the database itself.

A materialized view, on the other hand, is a **physical copy** of those original base tables. Think of it more like a photograph of the original base table. The key difference is that a materialized view **will not be updated** every time it is interacted with.


***

Links: [[Databases]] | [[PostgreSQL]] | [[System Design]] | [[Web Development]]

Source: [What are Materialized Views? A 5 Minute Introduction (educative.io)](https://www.educative.io/blog/materialized-view-introduction)



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