---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/8c191a4808f5
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Choose the Right Git Branching Strategy
  - Choose the Right Git Branching Strategy
---
# Choose the Right Git Branching Strategy

## Metadata
- Author: [[Hongbo Liu]]
- Full Title: Choose the Right Git Branching Strategy
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/8c191a4808f5

## Highlights
- Git Flow is a popular branching strategy that uses two main branches: develop and master. The develop branch is used for ongoing development and testing, while the master branch is used for production releases. Feature branches are created off of develop and are merged back into it when they are ready. Release branches are created off of develop and are merged into master when they are ready for release.
- GitHub Flow is similar to Git Flow, but it has a simpler branching structure. It only uses a master branch, and all development is done directly on it. Feature branches are created off of master and are merged back into it when they are ready. This strategy is best suited for projects that have a high degree of collaboration and a low risk of bugs.
- Trunk-Based Development is a more recent branching strategy that is becoming increasingly popular. It does not use any long-lived branches; instead, all development is done directly on the master branch. Feature branches are created only when necessary and are merged back into master as soon as they are ready. This strategy is best suited for projects that have a high degree of collaboration and a low risk of bugs.
