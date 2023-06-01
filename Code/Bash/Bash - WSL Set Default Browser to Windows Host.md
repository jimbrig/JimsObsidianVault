---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code/Bash", "#Topic/Dev/Bash", "#Topic/Dev/Linux" ]
Alias: [ "WSL Set Default Browser to Windows Host" ]
---

# WSL Set Default Browser to Windows Host

> [!SOURCE] Sources
> - *[How to use the browser in Windows as WSL's default - Boring Time](https://akimon658.github.io/en/p/2021/wsl-default-browser/)*

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser path/to/browser priority
```

For example, to use `chrome.exe`:

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe
```

## Details


> [!NOTE]
> Details about what the code does.



***

## Appendix: Links and References

*Note created on [[2023-06-01]] and last modified on [[2023-06-01]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]

### External References



#### Backlinks

```dataview
list from [[Bash - WSL Set Default Browser to Windows Host]] AND -"CHANGELOG" AND -"Code/Bash/Bash - WSL Set Default Browser to Windows Host"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

