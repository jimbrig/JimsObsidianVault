---
Date: 2023-06-20
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GitHub", "#Topic/Dev/DevOps"]
Alias: [ "Publish Blog Posts", "blogpub" ]
---

# Publish Blog Posts

> [!NOTE] Note:
> The following secrets must be defined to cross post the content:
> - `DEVTO_API_KEY` (see )
> - `MEDIUM_TOKEN` and `MEDIUM_USER_ID` (see )

## Code

> [!SOURCE] Sources:
> - [blog/.github/workflows/publish.yml at main · protiumx/blog · GitHub](https://github.com/protiumx/blog/blob/main/.github/workflows/publish.yml)

```yaml
name: 'Publish'

on:
  push:
    branches:
      - 'main'
    paths:
      - 'content/posts/**'

concurrency:
  cancel-in-progress: true
  group: publish-${{ github.head_ref || github.ref }}

jobs:
  publish:
    name: Publish Blog Posts
    runs-on: ubuntu-latest    
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: blogpub
        uses: protiumx/blogpub@main
        with:
          articles_folder: content/posts
          devto_api_key: ${{ secrets.DEVTO_API_KEY }}
          gh_token: ${{ secrets.GH_TOKEN }}
          medium_token: ${{ secrets.MEDIUM_TOKEN }}
          medium_user_id: ${{ secrets.MEDIUM_USER_ID }}
```



## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-06-20]] and last modified on [[2023-06-20]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[Code/GitHub Actions/_README|GitHub Action Code Snippets]]
- [[MOC - Development|Development]]
- [[MOC - Technology|Technology]]
- [[MOC - Software|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[GHA - Publish Blog Posts]] AND -"CHANGELOG" AND -"Code/GitHub Actions/GHA - Publish Blog Posts"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

