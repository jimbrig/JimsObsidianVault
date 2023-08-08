---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://feedly.com/i/entry/qvGtkO5fnj6ZnEh/FwHw8GADYofdlRqvnAzOhhhBGz4=_1833e7fdb30:6d4f7eb:84ca694a
Tags: ["#Type/Highlight/Article"]
Aliases: ["API as a Package: Structure", "API as a Package: Structure"]
---
# API as a Package: Structure

## Metadata
- Author: [[Feedly]]
- Full Title: API as a Package: Structure
- Category: #Type/Highlight/Article
- URL: https://feedly.com/i/entry/qvGtkO5fnj6ZnEh/FwHw8GADYofdlRqvnAzOhhhBGz4=_1833e7fdb30:6d4f7eb:84ca694a

## Highlights
- When building applications in {shiny} we have for some time been using
  the âapp as a packageâ approach which has been popularised by tools like
  {golem} and {leprechaun}, in large part due to the convenience that
  comes with leveraging the testing and dependency structure that our R
  developers are comfortable with in authoring packages, and the ease with
  which one can install and run an application in a new environment as a
  result. For this project we looked to take some of these ideas to a
  {plumber} application. This blog post discusses some of the thoughts and
  resultant structure that came as a result of that process.
- There are a few things I really like about the {shiny} app as a package
  approach that I wanted to reflect in the design and build of a {plumber}
  application as package.
- When developing the solution for this particular project I did have in
  the back of my mind that I wanted to create as much reusable structure
  for any future projects of this sort as possible. I really wanted to
  have an easy way to, from a package structure, be able to build out an
  API with nested routes, using code that could easily transfer to another
  package.
- I opted for a structure that utilised the inst/extdata/api/routes
  directory of a package as a basis with the idea that the following file
  structure
  | inst/extdata/api/routes/
  |
  | - model.R
  | - reports/
  - |
  | - pdf.R
