---
ID: "16542db7-dc41-4bac-bb51-893bb8c81526"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Plumber REST APIs in R.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---





# Building REST APIs with R and Plumber

REST stands for âRepresentational State Transferâ, meaning it represents a set of rules developers follow when creating APIs (i.e. you get a responding piece of data, the response, whenever you make a request to a particular URL).

Every request is composed of these four parts:

1. **Endpoint** - a part of the URL - The endpoint for `https://example.com/predict` is `/predict`.
2. **Method** - a type of request youâre sending; used to perform one of these actions: *Create, Read, Update, Delete (CRUD)*. Can be one of the following:
   - `GET`
   - `POST`
   - `PUT`
   - `PATCH`
   - `DELETE`
3. **Headers** â used for providing information (think authentication credentials, for example). They are provided as key-value pairs.
4. **Body** â information that is sent to the server. Used only when not making `GET` requests.

Most of the time, the response returned after making a request is in JSON format. The alternative format is XML, but JSON is more common. You can also return other objects, such as images instead. Youâll learn how to do that today.

R allows you to develop REST APIs with the plumber package. You can read the official documentation here.

Itâs easy to repurpose any R script file to an API with plumber, because you only have to decorate your functions with comments. Youâll see all about it in a bit.





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