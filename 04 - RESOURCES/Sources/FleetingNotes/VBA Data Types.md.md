---
ID: "57e992b5-9dc6-4869-a1ee-1764a9fb350e"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "VBA Data Types.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# VBA Data Types

| Type                    | Memory                     | Type-Declaration Character | Description                                                                                                                                                     |
| ----------------------- | -------------------------- | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|  |
| Byte                    | 1 byte                     | none                       | Positive whole number ranging from 0 through 255 that can be represented as a binary value.                                                                     |
| Boolean                 | 2 bytes                    | none                       | True or False                                                                                                                                                   |
| Integer                 | 2 bytes                    | %                          | Whole numbers ranging from -32,768 through 32,767.                                                                                                              |
| Long (_long integer_    | 4 bytes                    | &                          | Whole numbers ranging from -2,147,483,648 through 2,147,483,647.                                                                                                |
| Single                  | 4 bytes                    | !                          | Single-precision floating-point number (with decimal points) ranging from -3.402823E38 to 3.402823E38.                                                          |
| Double                  | 8 bytes                    | #                          | Double-precision floating-point number (which is more precise for very large or very small numbers) ranging from -1.79769313486232E308 to 1.79769313486232E308. |
| Currency                | 8 bytes                    | @                          | Large numbers between -922,337,203,685,477.5808 and 922,337,203,685,477.5807 (15 digits to left of decimal and 4 digits to the right of the decimal).           |
| Date                    | 8 bytes                    | none                       | Represents dates from January 1, 100 through December 31, 9999.                                                                                                 |
| Object                  | 4 bytes                    | none                       | An instance of a class or object reference.                                                                                                                     |
| String                  | 10 bytes + 1 byte per char | $                          | Series of any ASCII characters.                                                                                                                                 |
| String (_fixed-length_) | length of string           | none                       | Series of any ASCII characters, of a pre-defined length.                                                                                                        |
| Variant                 | min 16 bytes               | none                       | Any kind of data except fixed-length String data and user-defined types.                                                                                        |

***

## Appendix: Links

- [[Excel - VBA]]
- [[Excel - VBA|Visual Basic]]
- [[2-Areas/Code/Windows/_README|Windows]]
- [[Microsoft]]
- [[Excel]]
- [[Microsoft Office]]
- [[2-Areas/Code/Windows/Visual Basic/Excel VBA/_README|VBA]]

*Backlinks:*

```dataview
list from [[VBA Data Types]] AND -"Changelog"
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