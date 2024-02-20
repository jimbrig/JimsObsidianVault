---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://www.r-bloggers.com/2022/07/r-quarto-tutorial-how-to-create-interactive-markdown-documents/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - R Quarto Tutorial – How to Create Interactive Markdown Documents
  - R Quarto Tutorial – How to Create Interactive Markdown Documents
---
# R Quarto Tutorial – How to Create Interactive Markdown Documents

## Metadata
- Author: [[Dario Radečić]]
- Full Title: R Quarto Tutorial – How to Create Interactive Markdown Documents
- Category: #Type/Highlight/Article
- URL: https://www.r-bloggers.com/2022/07/r-quarto-tutorial-how-to-create-interactive-markdown-documents/

## Highlights
- R Quarto is a next-gen version of R Markdown. The best thing is – it’s not limited to R programming language. It’s also available in Python, Julia, and Observable. In this R Quarto tutorial, we’ll stick with the most popular statistical language and create Markdown documents directly in RStudio.
- With Quarto, you can easily create high-quality articles, reports, presentations, PDFs, books, Word documents, ePubs, and even entire websites. For example, the entire Hands-On Programming with R book by Garrett Grolemund is written in Quarto. Talk about scalability!
- How to Get Started with R Quarto
- Important note: Make sure to give the .qmd extension to the Quarto file. We’ve named ours quarto.qmd, for reference.
- install.packages("quarto")
  quarto::quarto_render("notebook.Rmd")
- There are numerous ways of exporting Quarto documents. Some options include HTML, ePub, Open Office, Web, Word, and PDF. We’ll show you have to work with the last two options, as these are the most common.
- quarto tools install tinytex
- Once installed, modify the YAML header accordingly. Here’s an entire formatting reference.
  ---
  title: "Quarto Demo"
  author: "Appsilon"
  date: "2022-5-24"
  format:
  pdf:
  toc: true
  toc-depth: 2
  toc-title: Table of contents
  number-sections: true
  highlight-style: github
  ---
