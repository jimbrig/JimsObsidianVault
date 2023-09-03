---
ID: "49cf2e87-4dcf-4bdd-83f3-12bc7a10a778"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "WSL Commands and Installs.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Development"]
Aliases:
  - "<% tp.file.title %>"
---

---
creation date: 2021-05-01 20:04
modification date: Saturday 1st May 2021 20:04:32
tags: [ "#Development" ]
author: Jimmy Briggs
---

# WSL Commands and Installs

## New WSLg GUI Applications

- Install Edge with new [WSLg](https://github.com/windows/wslg) version of WSL that supports GUI applications natively.

```bash
sudo apt update && sudo apt upgrade
sudo curl https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_91.0.852.0-1_amd64.deb -o /tmp/edge.deb
sudo apt install /tmp/edge.deb \-y
```

- Install RStudio:

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/"
sudo apt update
sudo apt install r-base
sudo apt-get install gdebi-core
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5042-amd64.deb
sudo gdebi rstudio-1.2.5042-amd64.deb
```

***
Links: 
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