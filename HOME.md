---
Date Created: 2023-06-21
Date Modified: 2023-09-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Home", "#Topic/Obsidian", "#Status/Ongoing" ]
Aliases: [ "HOME", "Home", "Dashboard", "Start", "Homepage" ]
Type: Home
Topic: Obsidian
Status: Ongoing 
Sources: "N/A"
banne
cssclasses: [ "homepage" ]
banner_x: 0.65
banner_y: 0.35
target: 10000
banner_icon: 💻
---

# Jim's Obsidian Vault - HOME

> [!TIP] This is my [[Obsidian]] Vault's Homepage Dashboard Note.

## PARA

- [[02 - PROJECTS/_README|Projects]]
- [[03 - AREAS/_README|Areas]]
- [[04 - RESOURCES/_README|Resources]]
- [[99 - ARCHIVES/_README|Archives]]




> [!multi-column]
>
>> ## 📆 Agenda
>> `$= '[['+moment().format("YYYY-MM-DD")+'|Today]]'`
>> `$= '[['+moment().format("YYYY-[W]ww")+'|Week]]'`  
>> `$= '[['+moment().format("YYYY - MM-MMM")+'|Month]]'`  
>  
>> ## 💼 Work
>> [[Life/Projects/_README|Projects]]
>> [[Life/Daily/_README|Daily Notes]]
>  
>> ## 🧠 Knowledge  
>> [[00 - INBOX/_README|Inbox]]
>> [[MOCs/_README|MOCs]]
> 
>> ## 📃 Reference  
>> [[Obsidian Hotkeys]]  
>> [[Obsidian Callouts]]  
>> [[Windows Terminal Shortcuts]]  
>> [[Vim mode shortcuts]]  
>

## 🗺️ Maps of Content

```dataview
LIST FROM "03 - AREAS/MOCs" AND -"CHANGELOG" AND -"03 - AREAS/MOCs/_README"
```

## Latest Modified Files

> [!NOTE] Latest 10 Modified Files in the Vault (excluding [[CHANGELOG]]):

```dataview  
table file.ctime as Created, file.mtime as "Last modified"  
where file.name != this.file.name and file.name !="CHANGELOG"
sort file.mtime DESC  
limit 10  
```

