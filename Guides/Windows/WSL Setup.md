---
Date: 2023-08-08
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# WSL Setup

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

*You must be running Windows 10 or 11 to perform this procedure.* 

If you are using a different operating system, check [When should I set up a local environment](https://help.learn.co/en/articles/1394611-when-should-i-set-up-a-local-environment) to find out what setup instructions you should follow.

*Note: It is no longer necessary to enable developer mode for Windows Subsystem Linux to work.*  

## Getting Windows Ready

> See also [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

**UPDATE**

## Enable Necessary Optional Features

For WSL you will need to enable these features:

- Windows SubSystem for Linux
- Virtual Machine
- Hyper-V (optional)
- OpenSSH (optional)

```powershell
wsl --install
```

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### Enable WSL 

- Windows Subsystem Linux (WSL) is **not** automatically enabled on windows. So, to start off, we need to enable it!
	- Go to your Windows Search bar and type in `turn windows features on or off`
	- Click on the result that matches your query. It will be in your Control Panel.  You should see something like this:

<center>

![](https://i.imgur.com/GIELqvu.png)

</center>

   - Scroll down until you see "Windows Subsystem for Linux" - ensure its box is checked!

<center>

![](https://i.imgur.com/AD9dxn1.png)

</center>

  - Scroll up a bit until you see "Virtual Machine Platform." Turn this feature on as well.

<center>

![](https://i.imgur.com/PNul507.png)

</center>

> **Note:** The "Virtual Machine Platform" was added in a February 2020 update to Windows. If your computer has not received this update, this feature may not be available. In this case, just make sure "Windows Subsystem for Linux" is enabled and continue on. Keep in mind that if you update, you may need to go back and enable this feature.

Finally,  **Restart your computer**.

### Install Linux Distribution

- Open up Microsoft Store. 
- Search for "Ubuntu"
- Choose "Ubuntu" (not 16.04 LTS or 18.04 LTS)
- Open up the Ubuntu app. Follow the prompts, which will include making a username and password. Don't forget your password!

### Setup and Configure Development Environment

- Start Outfitting your new Linux Subsystem: RVM / Ruby, learn-co, git, NodeJS, and Rails

- Once everything is set up, we can start setting up our system! Start off by running the following to download our dependencies:

```bash
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y autoremove
```

- Install Default `apt` Packages:

```bash
sudo apt-get -y install \
	git-core \
	curl \
	zlib1g-dev \
	build-essential \
	libssl-dev \
	libreadline-dev \
	libyaml-dev \
	libsqlite3-dev \
	sqlite3 \
	libxml2-dev \
	libxslt1-dev \
	libcurl4-openssl-dev \
	software-properties-common \
	libffi-dev \
	libpq-dev \
	libgdbm-dev \
	libncurses5-dev \
	automake \
	libtool \
	bison \
	gnupg \
	postgresql \
	postgresql-contrib
```

## Resources

[Microsoft Documentation: Windows Subsystem for Linux]( https://docs.microsoft.com/en-us/windows/wsl/install-win10)  
[Setting up a SSH Key with GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)  
[Basic Linux Commands](https://maker.pro/linux/tutorial/basic-linux-commands-for-beginners)

***

## Appendix: Links and References

*Note created on [[2023-08-08]] and last modified on [[2023-08-08]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[WSL Setup]] AND -"CHANGELOG" AND -"Guides/Windows/WSL Setup"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

