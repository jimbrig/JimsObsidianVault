---
Date Created: 2023-09-09
Date Modified: 2023-09-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Type: Tool/Obsidian
Topic: Dev/Obsidian
Status: WIP
Sources: [ "https://github.com/arpitbbhayani/obsidian-hackernews" ]
Tags: [ "#Type/Tool/Obsidian", "#Topic/Dev", "#Status/WIP" ]
Aliases: [ "Obsidian Hackernews Plugin" ]
cssclasses: [ ]
---

# Obsidian Hackernews Plugin

> [!SOURCE] Sources
> - *[arpitbbhayani/obsidian-hackernews: Periodically fetches and displays top stories from HackerNews. (github.com)](https://github.com/arpitbbhayani/obsidian-hackernews)*

![](https://i.imgur.com/NhyCyaK.png)


## Contents

- [Overview](#overview)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Overview

> [!NOTE] About
> *The plugin periodically fetches and displays top stories from [HackerNews](https://news.ycombinator.com/) in an [Obsidian](https://obsidian.md/) pane. Some of the best stories, blogs, news, and resources are shared on [HackerNews](https://news.ycombinator.com/), and this plugin helps stay updated while using Obsidian.*

This plugin is for you if you use [Obsidian](https://obsidian.md/) and

- are a passionate engineer
- want to discover amazing articles, resources, and projects
- want to stay updated with the happenings in the tech world

## Features

- Periodically fetches a random top story from HackerNews.
- You can save the story as a note allowing you to revisit it again.

## Installation

### Through Community Plugin

- Open _Settings_ (default: `ctrl` + `,`),
- Open _Community Plugins_ from the left sidebar,
- On the right pane, click _Browse_, this will open up all the Community Plugins
- Search for _HackerNews_
- Install the Plugin by clicking _Install_
- Enable to Plugin by clicking _Enable_

### Enabling Plugin

- Open the _Command Palette_ (default: `ctrl` + `p`),
- Search for _Open HackerNews_ and run the command.
- You will see that a new View appears in the right Sidebar of Obsidian.
- Drag and drop like any other pane and power-up your Obsidian.

### Why this Plugin?

I love reading technical articles and stay updated with the latest happenings in the tech world, and I find [HackerNews](https://news.ycombinator.com/) ideal for this. I have read some of the best articles and found amazing open source libraries through it, and hence I always like to keep a clock eye on HackerNews.

On Mac, I used [YCombinator Plugin](https://github.com/martinsirbe/ycombinator-bitbar) on [BitBar](https://xbarapp.com/), which is very similar and shows one top story from [HackerNews](https://news.ycombinator.com/) in the top menu bar. If the title is enticing enough, I can always learn more about it by clicking the item. This is a great way for me to discover the best resources out there.

Recently, I switched to a Windows machine and found it not having a similar utility; plus, writing a widget for Windows is a mess. When I discovered Obsidian, I found myself using it quite frequently. So I thought of creating a plugin similar to the [YCombinator Plugin](https://github.com/martinsirbe/ycombinator-bitbar) to fetch random top story from HackerNews and show it to me in the side pane.

## Privacy

This plugin makes calls to the following APIs to fetch the top stories from HackerNews

- [https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty](https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty)
- [https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty](https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty)

The API calls are mere GET calls that do not pass any client-side information through the API to `hacker-news.firebaseio.com`.

## About the Creator

[Arpit Bhayani](https://arpitbhayani.me/) - a CS Engineer, Educator, and a Polymath. I love everything around Computer Science, Programming, Mathematics, and Art. You can find me on [Twitter](https://twitter.com/arpit_bhayani), tweeting mostly about nerdy stuff.

In January 2020, I started my [newsletter](https://arpitbhayani.me/newsletter), where I write and share an essay about Distributed Systems, System Design, Programming languages internals, and deep dives on some super-clever algorithms. The newsletter currently has close to **2000+** subscribers.

I have been running a niche [Cohort-based Course](https://arpitbhayani.me/masterclass) on System Design to help engineering become better at designing _scalable_, _fault-tolerant_, and _highly available_ systems.

You can choose to support me in everything I do by sponsoring this plugin.


***

## Appendix: Links and References

*Note created on [[2023-09-09]] and last modified on [[2023-09-09]].*

### Internal Linked Notes

- [[03 - AREAS/Tools/_README|Tools]]
- [[03 - AREAS/Tools/Tools - PKM/Obsidian/Plugins/_README|Obsidian Plugins]]

### External References

- **

#### Backlinks

```dataview
list from [[Obsidian Hackernews Plugin]] AND -"CHANGELOG" AND -"03 - AREAS/Tools/Tools - PKM/Obsidian/Plugins/Integrations/Obsidian Hackernews Plugin"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

