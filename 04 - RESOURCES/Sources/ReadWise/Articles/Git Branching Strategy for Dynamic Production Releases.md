---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/fab47e7da4ce
Tags: ["#Type/Highlight/Article"]
Aliases: ["Git Branching Strategy for Dynamic Production Releases", "Git Branching Strategy for Dynamic Production Releases"]
---
# Git Branching Strategy for Dynamic Production Releases

## Metadata
- Author: [[Sumit Samar Man]]
- Full Title: Git Branching Strategy for Dynamic Production Releases
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/fab47e7da4ce

## Highlights
- developers now need to remove unwanted code from the pre-production branch and push code of only selected tasks.
- Git cherry-picking
- This should be avoided as it creates duplicate commits, you lose the ability to track commit history and it might lead to undesirable results.
- Manually undoing the changes
- This is only a valid option if there were very less code changes, impossible if the tasks were complex and big. Also very prone to human error.
- Disable feature flag for unwanted features
- This is feature flag driven development and requires developers to have coded for all tasks in such a way that the entire task could be enabled/disabled by switching a feature flag. Feature flag driven development has its advantages and disadvantages and i believe it should only be used if the requirement demands it but not as a standard for all requirements.
- Replace the release branch with a new branch with only required code changes (not manually ofcourse)
