---
cssclass: homepage
banner_x: 0.65
banner_y: 0.35
target: 10000
banner: "04 - RESOURCES/Assets/Banners/programming.gif"
banner_icon: 💻
---

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

