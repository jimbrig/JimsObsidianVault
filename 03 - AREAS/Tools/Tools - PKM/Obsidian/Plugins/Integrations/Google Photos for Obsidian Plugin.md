---
Date Created: 2023-09-07
Date Modified: 2023-09-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Type: Tool/Obsidian
Topic: Dev/Obsidian
Status: WIP
Sources: [ "https://github.com/alangrainger/obsidian-google-photos" ]
Tags: [ "#Type/Tool/Obsidian", "#Topic/Dev", "#Status/WIP" ]
Aliases: [ "Google Photos for Obsidian Plugin", "Google Photos for Obsidian" ]
cssclasses: [ ]
Cover:
---

# Google Photos for Obsidian Plugin

> [!SOURCE] Sources
> - *[alangrainger/obsidian-google-photos: Connect to Google Photos from Obsidian (github.com)](https://github.com/alangrainger/obsidian-google-photos)*

## Contents

- [Overview](#overview)
- [Setting Up](#setting-up)
- [Advanced Features](#advanced-features)
	- [Add Today Photo Embedded into Daily Note](#add-today-photo-embedded-into-daily-note)
	- [Adjust Visual Style](#adjust-visual-style)
- [FAQs](#faqs)
	- [Do the images have to be saved locally? Can they be remote thumbnails?](#do-the-images-have-to-be-saved-locally-can-they-be-remote-thumbnails)
	- [Attribution](#attribution)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

> [!NOTE] About
> *Google Photos for [[03 - AREAS/Tools/Tools - PKM/Obsidian/Plugins/_README|Obsidian Plugin]] is a [[03 - AREAS/Tools/_README|tool]] that let's you embed [[03 - AREAS/Tools/Tools - Online/Google Photos|Google Photos]] images directly into [[Obsidian]]. When you select an image, it will save and embed a low-res thumbnail with a link back to the full-res image on [[03 - AREAS/Tools/Tools - Online/Google Photos|Google Photos]].*


![](https://i.imgur.com/aiqHHrw.png)

If your note title has a detectable date, you can have the plugin default to showing you only photos from that date. There is a toggle at the top to show all photos instead.

## Setting Up

To connect to [[03 - AREAS/Tools/Tools - Online/Google Photos|Google Photos]] from a third-party plugin, you will need to create an **API Key** for the plugin to use.

> [!INFO] **The plugin will only request read-only access. It is not able to modify your photos or albums.**

1. Visit [https://developers.google.com/photos/library/guides/get-started](https://developers.google.com/photos/library/guides/get-started)

2. Click the button that looks like this:

[![](https://github.com/alangrainger/obsidian-google-photos/raw/main/img/setup-enable.png)](https://github.com/alangrainger/obsidian-google-photos/blob/main/img/setup-enable.png)

3. Create a new project and give it any name you like. Use the same name on the next screen which asks for the *product name*:

[![](https://github.com/alangrainger/obsidian-google-photos/raw/main/img/setup-create-project.png)](https://github.com/alangrainger/obsidian-google-photos/blob/main/img/setup-create-project.png)

4. Fill in these settings for the [[OAuth]] configuration screen:

**Redirect URI**: `https://localhost/google-photos`

[![x200](https://github.com/alangrainger/obsidian-google-photos/raw/main/img/setup-oauth.png)](https://github.com/alangrainger/obsidian-google-photos/blob/main/img/setup-oauth.png)

5. Click **Create**.

6. Copy the `Client ID` and `Client Secret`. You will need to add these values into the Obsidian plugin settings:

[![](https://github.com/alangrainger/obsidian-google-photos/raw/main/img/setup-client-conf.png)](https://github.com/alangrainger/obsidian-google-photos/blob/main/img/setup-client-conf.png)

## Advanced Features

There is very basic codeblock support. You can run your own custom queries using the Photos API search format:

[https://developers.google.com/photos/library/reference/rest/v1/mediaItems/search](https://developers.google.com/photos/library/reference/rest/v1/mediaItems/search)

For example, if you wanted to show photos of food taken on every April 1st, you would use:

*Using the ` ```photos` code-block language syntax*:

```json
{
  "filters": {
    "dateFilter": {
      "dates": [{
        "year": 0,
        "month": 4,
        "day": 1
      }]
    },
    "contentFilter": {
      "includedContentCategories": [
        "FOOD"
      ]
    }
  }
}
```

### Add Today Photo Embedded into Daily Note

If you wanted to automatically add today's photos into your daily note, you could do that with [[Templater]] like this:

````
## Photos from today
```photos
{
  "filters": {
    "dateFilter": {
      "dates": [{
        "year": <% tp.date.now('YYYY') %>,
        "month": <% tp.date.now('M') %>,
        "day": <% tp.date.now('D') %>
      }]
    }
  }
}
```
````

### Adjust Visual Style

If you want to adjust the styles, these are the classes used:

`.google-photos-grid-thumbnail` - the thumbnail images
`.google-photos-codeblock` - the embedded codeblock container
`.google-photos-modal-grid` - the popup modal grid container

## FAQs

### Do the images have to be saved locally? Can they be remote thumbnails?

The way that Photos API generates the URLs, the direct image links are only available for a short time and then they expire. So while you could add them to your notes, they would stop working at some point.

I'm testing a few potential options at the moment, but it takes time to wait out the link expiry (or non-expiry, if it works).

---

### Attribution

Loading spinner from [loading.io](https://loading.io/).

***

## Appendix: Links and References

*Note created on [[2023-09-07]] and last modified on [[2023-09-07]].*

### Internal Linked Notes

- [[03 - AREAS/Tools/_README|Tools]]
- [[03 - AREAS/Tools/Tools - PKM/Obsidian/Plugins/_README|Obsidian Plugins]]

### External References

- **

#### Backlinks

```dataview
list from [[Google Photos for Obsidian Plugin]] AND -"CHANGELOG" AND -"//Google Photos for Obsidian Plugin"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

