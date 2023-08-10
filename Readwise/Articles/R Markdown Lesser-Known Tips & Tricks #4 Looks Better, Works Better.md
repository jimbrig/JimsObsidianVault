---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://r-craft.org/r-news/r-markdown-lesser-known-tips-tricks-4-looks-better-works-better/
Tags: ["#Type/Highlight/Article"]
Aliases: ["R Markdown Lesser-Known Tips & Tricks #4: Looks Better, Works Better", "R Markdown Lesser-Known Tips & Tricks #4: Looks Better, Works Better"]
---
# R Markdown Lesser-Known Tips & Tricks #4: Looks Better, Works Better

## Metadata
- Author: [[Reference/Technology/Programming/Tools/IDEs/RStudio| Open source & professional software for data science teams on RStudio]]
- Full Title: R Markdown Lesser-Known Tips & Tricks #4: Looks Better, Works Better
- Category: #Type/Highlight/Article
- URL: https://r-craft.org/r-news/r-markdown-lesser-known-tips-tricks-4-looks-better-works-better/

## Highlights
- It can be distracting to show code in an R Markdown document if that is not your primary focus. Add code_folding: hide to the YAML header to hide code chunks after rendering the document
- In addition to folding code chunks, you can embed a “code download” button in an R Markdown document. Readers can download the source code from the rendered HTML version.
  Add the following to your YAML:
  output:
  html_document:
  code_download: true
