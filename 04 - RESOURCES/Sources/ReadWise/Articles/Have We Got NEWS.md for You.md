---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://www.jumpingrivers.com/blog/intro-to-r-news-format/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Have We Got NEWS.md for You
  - Have We Got NEWS.md for You
---
# Have We Got NEWS.md for You

## Metadata
- Author: [[tidyverse style guide]]
- Full Title: Have We Got NEWS.md for You
- Category: #Type/Highlight/Article
- URL: https://www.jumpingrivers.com/blog/intro-to-r-news-format/

## Highlights
- If the file gets very long, you can move some of the older changes to a separate ONEWS file.
- The NEWS should contain “user-visible” changes that are “worth mentioning”.
- Some R packages may also have a ChangeLog, the purpose of which is to list all changes (including to source code). This is more relevant to the package developers, and over time it’s purpose has become increasingly subsumed by version control softwares like GitHub.
- Access to a usethis::use_news_md() shortcut for incrementing the version and adding a new heading to your NEWS.md file (for more info on version bumping, see semver.org).
- Note that the heading for each release is made up of the package name followed by the version number, and the changes are listed using bullet points. This also follows the format given in the tidyverse style guide which recommends that “each user-facing change to a package should be accompanied by a bullet” and that “each release should have a level 1 (#) heading”
- For enhanced readability, a major release with a lot of changes may be divided into subsections, including:
  Breaking changes - any changes that may cause a user’s code to break or produce an unexpected output
  New features - could include new functions and options
  Bug fixes - self-explanatory
- Items are recorded following the Conventional Commits specification.
- The quickest way for a user to access package news is with the news() function (from the base-R utils package), which can handle the NEWS, NEWS.md and NEWS.Rd formats:
- news(package = "packageName")
- When writing a NEWS file for your package, it is always a good idea to check that the news() function can correctly display it:
- The news() documentation provides precise formatting guidelines for all three file types. For the .md format, the guidelines are consistent with our template provided earlier. However, if you also want to show the release date, this should be enclosed in parentheses. A good heading would then be:
- Accompanying a version release with a blog post which highlights major new features and bug fixes can be an effective way to inform your users. This is also recommended by the tidyverse style guide.
- Diffify is a tool that allows you to easily check what has changed between two versions of a package:
- It directly shows you any dependencies that have changed, as well as any functions that have been added, removed or changed.
- It also displays the NEWS file for each release between the two versions, so allows you to check the NEWS of any package in one place.
- The following links may be of interest for further reference on the structure and format of NEWS files:
  R package manual
  R Packages (second edition)
  The tidyverse style guide
  Bioconductor guidelines
  rOpenSci NEWS template
  utils::news() documentation
  Another great blog post: Why and how maintain a NEWS file for your R package?
  For more on the semantic versioning framework: semver.org
