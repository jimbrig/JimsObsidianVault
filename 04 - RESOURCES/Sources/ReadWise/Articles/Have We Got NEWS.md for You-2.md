---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://www.jumpingrivers.com/blog/intro-to-r-news-format/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Have We Got NEWS.md for You
  - Have We Got NEWS.md for You
---
# Have We Got NEWS.md for You

## Metadata
- Author: [[Author: Myles Mitchell & Parisa Gregg]]
- Full Title: Have We Got NEWS.md for You
- Category: #Type/Highlight/Article
- URL: https://www.jumpingrivers.com/blog/intro-to-r-news-format/

## Highlights
- When developing a package it is essential to track the changes you make to your code. This is especially vital if they are breaking changes which have implications for any code written that depends on your package, i.e. a major version bump. Although you can always look back at your version control history in git, it is also convenient to have documentation which summarises the changes. ([View Highlight](https://read.readwise.io/read/01grjj1hxbjz2h2sx2j9zjy62k))
- This is where the NEWS file comes in. Usually a `.md` file, the NEWS contains a description of the changes made between each version of a package up until the latest version. It is used to log things such as new features that have been added or bugs that have been fixed. ([View Highlight](https://read.readwise.io/read/01grjj288rzct02gnzkdj0tjw1))
- The NEWS file is usually found at the top level of the package folder, and can take one of the following formats: ([View Highlight](https://read.readwise.io/read/01grjj37qf4qapdtp9n03famv5))
- Plain text (`NEWS`) ([View Highlight](https://read.readwise.io/read/01grjj3ahmx3sfm48meh4c29ph))
- **Markdown (`NEWS.md`)** - this is the most common format ([View Highlight](https://read.readwise.io/read/01grjj3bfdedkve6p0wsc69x6v))
- **R document (`inst/NEWS.Rd`)** - note that this sits in the `inst` subdirectory of your package, so gets copied into the top level when the package is installed ([View Highlight](https://read.readwise.io/read/01grjj3cn52g082wvnp75rs4e5))
- The NEWS should contain “user-visible” changes that are “worth mentioning”. ([View Highlight](https://read.readwise.io/read/01grjj3x54tzk93efy7b7ymmhb))
- Changes for the latest release should be displayed at the top of the file, alongside a heading which indicates the version number. ([View Highlight](https://read.readwise.io/read/01grjj4020wyhvdgdxg7w68c33))
- Older items should be displayed further down the file and should never be discarded, since they will be of interest to a user upgrading from a previous version. ([View Highlight](https://read.readwise.io/read/01grjj413a2tysx434e66n44a0))
- If the file gets very long, you can move some of the older changes to a separate `ONEWS` file. ([View Highlight](https://read.readwise.io/read/01grjj42tjhsnfkawp6gdjs15a))
- Some R packages may also have a `ChangeLog`, the purpose of which is to list **all** changes (including to source code). This is more relevant to the package developers, and over time it’s purpose has become increasingly subsumed by version control softwares like GitHub. ([View Highlight](https://read.readwise.io/read/01grjj4jxdz83kpppxmatz7psb))
- Note that the heading for each release is made up of the package name followed by the version number, and the changes are listed using bullet points. This also follows the format given in the [tidyverse style guide](https://style.tidyverse.org/news.html) which recommends that “each user-facing change to a package should be accompanied by a bullet” and that “each release should have a level 1 (#) heading”. ([View Highlight](https://read.readwise.io/read/01grjj723eqsm9xajpyy205fa2))
