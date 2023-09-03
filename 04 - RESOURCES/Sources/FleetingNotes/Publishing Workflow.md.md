---
ID: "738582cf-07b7-4f0f-b7d3-1d88988e3687"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Publishing Workflow.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Status/WIP", "adding"]
Aliases:
  - "<% tp.file.title %>"
---

---
creation date: 2021-05-02 15:42
modification date: Sunday 2nd May 2021 15:42:09
tags: [ "#Status/WIP" ]
author: Jimmy Briggs
---

# Publishing Workflow

Instead of paying for the built-in [Obsidian Publish Feature](https://obsidian.md/publish) this workflow utilizes the fast, simple, and nice looking [MkDocs](https://www.mkdocs.org/) static sit generator to publish an Obsidian Vault.

## Initial Setup

1. Fork the Obsidian-MkDocs Github repo template from [jobindj/obsidian-mkdocs](https://github.com/jobindj/obsidian-mkdocs)
	- Note: if your obsidian vault is already a git repository you may want to utilize `git submodules` instead of nesting git repo's.
2. Clone the newly forked repo into your local obsidian vault
3. Move any notes you want published into the `<repo-name>/docs` folder
4. Commit and push changes to trigger the [Github Action](https://github.com/jobindj/obsidian-mkdocs/blob/main/.github/workflows/ci.yml) to publish your notes

Example Code:

```powershell
# navigate to obsidian vault's directory
cd <path/to/obsidian/vault>

# add a git submodule for the mkdocs repo under a folder named '_published'
git submodule add git@github.com:jimbrig/obsidian_published.git _published

# move some notes into the _published/docs folder
```

## Configuration

Configure the published site's [mkdocs.yml]() configuration file located in the root level of the MkDocs folder.

*See [MkDocs Configuration Documentation]() for more details*

https://www.mkdocs.org/#adding-pages

***
Links:  [2-Slipbox/MkDocs](MkDocs.md)  [020 - Development](../1-Maps-of-Content/020%20-%20Development.md) [Markdown](Markdown.md)

Source:



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