---
Date Created: 2023-09-07
Date Modified: 2023-09-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code/CSS", "#Topic/Dev/CSS" ]
Aliases: [ "Obsidian Banner" ]
---

# Obsidian Banner

> [!SOURCE] Sources:
> - *[(CSS) How to Style the First Image in a Note? - Help - Obsidian Forum](https://forum.obsidian.md/t/css-how-to-style-the-first-image-in-a-note/52839/9)*

## Contents

[TOC]

## Code

- [[obsidian-banner.css]]:

```embed-css
PATH: "vault://03 - AREAS/Code/CSS/src/obsidian-banner.css"
TITLE: "obsidian-banner.css"
```

## Details

- This [[03 - AREAS/Code/CSS/_README|CSS Code Snippet]] will allow you to use banner images in your notes using [[CSS]] classes and image alts. 
- There are 3 banner styles:
	- **Fade**
	- **Fancy Title**
	- **Notion**
- The banner styles can be toggled with the [[Obsidian Style Settings Plugin]] ([Style Settings](https://github.com/mgmeyers/obsidian-style-settings/blob/main/obsidian-default-theme.css)). 
- You can also control the banner height, similar to the height options in the [[CSS - Obsidian Banner|Obsidian Banner Plugin]] ([Banners plug-in](https://github.com/noatpad/obsidian-banners)).
- If you uncomment the marked section in the code, you can also turn an image into an icon positioned near the title of your note (**Warning: experimental**).
- In addition, images can be floated to either side, and their shape can be changed with alts.

## How it Works

> [!NOTE] Note
> In order to use the icons feature, you must first uncomment the **Icons** section in the code by deleting the `/*` and `*/` that is wrapped around the section.

### CSS Classes

- `obsidian-banner`: type this in the frontmatter after `cssClasses` to enable the banner image.
- `obsidian-icon`: type this in the frontmatter after `cssClasses` to enable the icon image.

### Image Alts

> [!INFO] Example of an image alt (Banner): `![image-alt|banner](image.png)`.

- `banner` - makes the image the banner image.
- `higher` - positions the banner image higher.
- `lower` - positions the banner image lower.
- `circle`, `profile`, or `round` - typing any of these will make the image circular in shape, like a profile picture.
- `left` - floats the image left.
- `right` - floats the image right
- `icon` (**Uncomment the Icons part of the code to use**) - turns the image into a title icon.

> [!WARNING] Warning
> The icon feature did not turn out as good as I'd like. For the most part, it works fine. **BUT**, when viewing multiple panes at the same time, it drifts into a weird position, and a theme with a custom readable line length may disrupt its placement on the page. You _can_ still use the icons feature, but be warned: it can act a bit wonky.

### Usage

To use the snippet, type `obsidian-banner` in the frontmatter.




***

## Appendix: Links and References

*Note created on [[2023-09-07]] and last modified on [[2023-09-07]].*

### Internal Linked Notes

- [[CSS]]
- [[03 - AREAS/Code/CSS/_README|CSS Code Snippets]]
- [[03 - AREAS/Technology/Programming/Web Development/Frontend/HTML|HTML]]
- [[MOC - Web Development|Web Development]]
- [[03 - AREAS/Code/_README|Code Snippets]]
- [[MOC - Development|Development]]
- [[MOC - Technology|Technology]]

### External References

#### Backlinks

```dataview
list from [[CSS - Obsidian Banner]] AND -"CHANGELOG" AND -"03 - AREAS/Code/CSS/CSS - Obsidian Banner"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

