---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code/Bash", "#Topic/Dev/Bash", "#Topic/Dev/Linux" ]
Alias: [ "Install WSLU" ]
---

# Install WSLU

> [!SOURCE] Sources
> - *[wslu Wiki (wslutiliti.es)](https://wslutiliti.es/wslu/install.html)*

## Contents

- [Code](#code)
- [Details](#details)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Code

*Link: [wslu Wiki (wslutiliti.es)](https://wslutiliti.es/wslu/install.html)*

### Ubuntu

```bash
sudo apt update
sudo apt install ubuntu-wsl
```

### Kali Linux

```bash
sudo apt install gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc
echo "deb https://pkg.wslutiliti.es/kali kali-rolling main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install wslu
```

### Debian

```bash
sudo apt install gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc

# Debian 10
echo "deb https://pkg.wslutiliti.es/debian buster main" | sudo tee -a /etc/apt/sources.list
# Debian 11
echo "deb https://pkg.wslutiliti.es/debian bullseye main" | sudo tee -a /etc/apt/sources.list

sudo apt update
sudo apt install wslu
```

## Details

See [[wslu]].

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
list from [[Bash - Install WSLU]] AND -"CHANGELOG" AND -"Code/Bash/Install Scripts/Bash - Install WSLU"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

