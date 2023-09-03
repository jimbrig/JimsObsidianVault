---
Date Created: 2023-06-21
Date Modified: 2023-06-21
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ ]
Alias: [ ]
---

# Vault Ideas


## YAML Metadata Properties

> [!ABOUT] About
> 
> While most of the content and text from a note in [[Obsidian]] is meant to be consumed by human readers, *properties* are text that is meant to be easily readable by a program, such as a [[plugin]] or [[Obsidian]] itself.
> 
> You can add properties to notes by adding a [[YAML]] Frontmatter block at the top of the note. The block must start and end with three hyphens (`---`)

Example Frontmatter:

```YAML
---
tags: daily
aliases: journal
publish: false
cssclass: mycustomclass
---
```

> [!TIP] Tip
> 
> By default, properties are only visible in the [editing view]() of [[Obsidian]]. 
> 
> To display properties in reading view:
> 
> 1. Open **Settings** (`Ctrl + ,`)
> 2. Under **Editor**, enable **Show Frontmatter**.


### Default Obsidian Frontmatter Keys

- `tags`: associated tags for the note.
- `aliases`
- `cssclass`
- `publish`: `true` or `false`

### Property Format

- [[YAML]] is used to configure the frontmatter properties.
- Each property consists of a *key-value pair*
- *Keys* are separated from their values by a colon followed by a space (`: `)

```yaml
---
key: value
---
```

While the order of each key-value pair doesn't matter, each key must be unique within a note. For example, you can't have more than one `tag` key.

Values can be text, numbers, true or false, or even collections of values (arrays).

```yaml
---
title: Note Title
year: 1977
favorite: true
cast:
  - John Doe
  - Jane Doe
---
```

> [!TIP] [[JSON]] Properties
> While [[YAML]] is the recommended way to configure and define properties, you can also define them using [[JSON]]:
>
> ```
> ---
> {
> 	"tag": "journal",
> 	"publish": false
> }
> ---
> ```

### Pre-Defined Properties

See the above section [Default Obsidian Frontmatter Keys](#default-obsidian-frontmatter-keys) for reference.

[[Obsidian]] comes with the following pre-defined properties:

- **tags**: See [Tags - Obsidian Help](https://help.obsidian.md/Editing+and+formatting/Tags) (replaced deprecated `tag` property)
- **aliases**: See [Aliases - Obsidian Help](https://help.obsidian.md/Linking+notes+and+files/Aliases) (replaced deprecated `alias` property)
- **cssclasses**: Allows you to style individual notes using [CSS snippets](https://help.obsidian.md/Extending+Obsidian/CSS+snippets) (replaced deprecated `cssclass` property)

Additionally, these properties can be used with [Obsidian Publish]():

- `publish`: See [Publish and unpublish notes - Obsidian Help](https://help.obsidian.md/Obsidian+Publish/Publish+and+unpublish+notes#Automatically+select+notes+to+publish)
- `permalink` See [Permalinks - Obsidian Help](https://help.obsidian.md/Obsidian+Publish/Publish+and+unpublish+notes#Permalinks)
- `description`: See [Social media link previews - Obsidian Help](https://help.obsidian.md/Obsidian+Publish/Social+media+link+previews#Description)
- `image`:  See [Social media link previews - Obsidian Help](https://help.obsidian.md/Obsidian+Publish/Social+media+link+previews#Image)
- `cover`: See [Social media link previews - Obsidian Help](https://help.obsidian.md/Obsidian+Publish/Social+media+link+previews#Image)

### Aliases

> [!INFO] 
> Sometimes, you might want to refer to the same file with multiple names in different contexts. These alternative names are what [[Obsidian]] calls "aliases".

To add aliases to a note:

```yaml
---
aliases: another name for the note
---
```

or to define multiple aliases:

```yaml
---
aliases: [another name for the note 1, another name for the note 2]

# vs

aliases: 
  - another name for the note 1
  - another name for the note 2
---
```

### Tags

To add tags to a note:

```yaml
---
tags: tag1
---
```

there are three possible methods to use tags in the frontmatter:

```yaml
---
tags: tag1, tag2
tags: [tag1, tag2]
tags:
  - tag1
  - tag2
---
```

#### Tag Autocompletion

To enable the auto-completion feature for tags, simply add `"` and insert a space before typing `#` followed by the tag name as below:

```yaml
---
tags: [" #tag1 #tag2"]
tags: " #tag1 tag2"
tags:
  - " #tag1"
  - " #tag2"
---
```

![](https://miro.medium.com/v2/resize:fit:700/1*IOHBcqzvODi9o4TKC839TQ.gif)

## Self-Defined Metadata



- Date Created
- Date Modified
- Author(s)
- Source(s)
- Tags
- Aliases
- CSS Classes
- Publish
- Title
- Subtitle
- Description
- ID




### Keep track of various "logs"

- [[Architecture Decision Records]]
	- [[Folder Structure and Design]]
	- [[Hosting Platform]]

