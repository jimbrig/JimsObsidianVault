---
ID: "cf9eb49d-d64b-4e96-a0ca-b1979f4ff1b2"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "VBA Classes and Solid Programming Principles.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# VBA Classes and Solid Programming Principles
*Source: [VBA Class Modules: gateway to SOLID code â Rubberduck News (wordpress.com)](https://rubberduckvba.wordpress.com/2020/02/27/vba-classes-gateway-to-solid/)*

## Creating Custom Types

You may have already used a user-defined type (UDT), which is a convenient way to create a structure of closely related properties together. You may have used it before especially if youâve ever had to use certain API functions via the Declare statements. Letâs start with a Person UDT. We can create a new standard module and define a UDT within the module:

```VBA
Public Type Person
  FirstName As String
  LastName As String
  BirthDate As Date
End Type
```

The UDT provides us with 3 members that tells us something about a Person; namely the first & last name and the birth date. Obviously, we can have more but we want the example to stay simple. The calling code to use a Person UDT could look something like this:

```VBA
Public Sub Test()
  Dim p1 As Person
  Dim p2 As Person
   
  p1.FirstName = "John"
  p1.LastName = "Smith"
  p1.BirthDate = #1970-01-01#
   
  p2.FirstName = "Jane"
  p2.LastName = "Doe"
  p2.BirthDate = #1970-01-01#
 
  Debug.Print VarPtr(p1), VarPtr(p2)
End Sub
```

## Create First Class Module

[image-8.png (171Ã120) (wordpress.com)](https://rubberduckvba.files.wordpress.com/2020/02/image-8.png)

The very first thing we want to do with our first class is to define the private data it needs to have to work correctly. We could start with nothing butÂ _public fields_, like this:

```VBA
Public FirstName As String
Public LastName As String
Public BirthDate As Date
```

We could useÂ `Property`Â statements instead. If youâve never used one before, they are a way to provide a procedural access to a member of the data structure, which grants us additional control on how the property may be accessed. We could revise the code accordingly:

```VBA
Private mFirstName As String
Private mLastName As String
Private mBirthDate As Date
 
Public Property Get FirstName() As String
  FirstName = mFirstName
End Property
 
Public Property Let FirstName(NewValue As String)
  mFirstName = FirstName
End Property
 
Public Property Get LastName() As String
  LastName = mLastName
End Property
 
Public Property Let LastName(NewValue As String)
  mLastName = LastName
End Property
 
Public Property Get BirthDate() As String
  BirthDate = mBirthDate
End Property
 
Public Property Let BirthDate(NewValue As String)
  mBirthDate = BirthDate
End Property
```

*Backlinks:*

```dataview
list from [[VBA Classes and Solid Programming Principles]] AND -"Changelog"
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