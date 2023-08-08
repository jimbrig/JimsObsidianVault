---
Date: 2023-05-20
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Guide", "#Topic/Dev/R", "#Topic/Dev/Linux" ]
Alias: [ "R Packages Ubuntu" ]
---

# Setting up R and RStudio on Ubuntu

> [!SOURCE] Source:
> *[pachadotdev/r-packages-ubuntu](https://github.com/pachadotdev/r-packages-ubuntu)*

## Contents

- [Overview](#overview)
- [Motivation](#motivation)
- [Instructions](#instructions)
- [Testing](#testing)
- [Automation](#automation)
- [Notes](#notes)
- [Code](#code)
	- [`configure.sh`](#configuresh)
	- [`sync-server.sh`](#sync-serversh)
	- [`generate-release.sh`](#generate-releasesh)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Overview

- Install [[R Packages]] as you would do on [[Windows]] (i.e., no long [[compilation]] time). 
- In addition, this script asks to install [[R Development Tools]], [[Tools/Tools - Version Control/Git]], [[RStudio]], and [[Quarto]].

## Motivation

Save time and automate the setup.

## Instructions

Simply run:

```bash
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/pachadotdev/r-packages-ubuntu/main/configure.sh)"
```

The command will ask you to install:

1. [[R]]
2. [[R Development Tools]] (i.e, r-base-dev)
3. [[Tools/Tools - Version Control/Git]]
4. [[RStudio Desktop]] (stable or daily build)
5. [[Quarto]]
6. The [[R Bridge to System Package Manager]], or `BSPM` ([Enchufa2/bspm](https://github.com/Enchufa2/bspm))

You can use it on a fresh or existing setup.

## Testing

When you re-open [[RStudio]] after running the script, you'll see an output like this:

```R
install.packages("devtools")
Available system packages...


  There are binary versions available but the source versions are later:
            binary source
fs           1.6.1  1.6.2
...
devtools     2.4.3  2.4.5

Do you prefer later versions from sources? (Yes/no/cancel) n
```

After selecting "n", to install from binaries, R internally communicates with Ubuntu package manager, and installing 'devtools' takes around 10 seconds versus around 5 minutes when building from sources (10 minutes if you need to reinstall because a system dependency was missing).

One advantage of this approach is that it shall satisfy all dependencies (i.e., it will install `libpq-dev` when installing `RPostgres`).

## Automation

The script above configures an APT repository to the server `pacha.dev`, which offers the same stable RStudio version as rstudio.com. The advantage is that when the server is updated and you run `apt update` it will offer a newer version that you can install with `apt upgrade`.

In other words, the script enables `apt install rstudio`.

## Notes

- You can re-trace all the steps I followed here: [https://github.com/pachadotdev/r-packages-ubuntu](https://github.com/pachadotdev/r-packages-ubuntu).

***

## Code

### `configure.sh`

```bash
#!/bin/bash

echo "This script will install R (if needed) and configure bspm on your system."

# ask to continue or exit
read -p "Do you want to continue? (y/n) " -n 1 -r

# stop if not running as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as sudo"
  exit
fi

# add an updated R source to the system manager
echo "Do you want to add the official CRAN R repository?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) add-apt-repository ppa:marutter/rrutter4.0 && apt update; break;;
        No ) break;;
    esac
done

# add a binary R packages source to the system manager
echo "Do you want to add the official CRAN R packages repository?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) add-apt-repository ppa:c2d4u.team/c2d4u4.0+ && apt update; break;;
        No ) break;;
    esac
done

echo "Is it ok to upgrade system packages now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt upgrade; break;;
        No ) break;;
    esac
done

# install R
echo "Do you want to install R?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install r-base; break;;
        No ) break;;
    esac
done

# ask if the user to install development tools

echo "Do you want to install development tools (i.e, to build R packages)?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install r-base-dev; break;;
        No ) break;;
    esac
done

echo "Do you want to install Git?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install git; break;;
        No ) break;;
    esac
done

echo "Is it ok to add apt.pacha.dev as a source for RStudio and/or Quarto?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) curl -sS https://apt.pacha.dev/pacha.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/pacha.gpg >/dev/null && echo "deb https://apt.pacha.dev ./" | tee /etc/apt/sources.list.d/pacha.list > /dev/null && apt update; break;;
        No ) break;;
    esac
done

echo "Do you want to install RStudio Desktop Stable Edition?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install rstudio; break;;
        No ) break;;
    esac
done

echo "Do you want to install RStudio Desktop Daily Build?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) curl -sS https://apt-daily.pacha.dev/pacha.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/pacha.gpg >/dev/null && echo "deb https://apt-daily.pacha.dev ./" | tee /etc/apt/sources.list.d/pacha-daily.list > /dev/null && apt update && apt install rstudio; break;;
        No ) break;;
    esac
done

echo "Do you want to install Quarto?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install quarto; break;;
        No ) break;;
    esac
done

# install bspm as a system package from CRAN

echo "Do you want to install bspm to install binary R packages?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install python3-{dbus,gi,apt} r-cran-bspm; break;;
        No ) break;;
    esac
done

# enable it system-wide
# echo "bspm::enable()" | tee -a /etc/R/Rprofile.site

# enable it for the user
# echo "bspm::enable()" | tee -a ~/Rprofile.site

# ask the user to chose between a system-wide or user-wide activation
echo "Do you want to enable bspm system-wide (all users) or user-wide (only you)?"
select yn in "System-wide" "User-wide" "Skip"; do
    case $yn in
        "System-wide" ) echo "bspm::enable()" | tee -a /etc/R/Rprofile.site; break;;
        "User-wide" ) echo "bspm::enable()" | tee -a ~/Rprofile.site; break;;
        "Skip" ) break;;
    esac
done

# send msg to ask to test it
echo "Please close and reopen RStudio and test the setup by running 'install.packages("ggplot2")' in R (or any other package)"
```


### `sync-server.sh`

```bash
#!/bin/bash

# reference
# https://earthly.dev/blog/creating-and-hosting-your-own-deb-packages-and-apt-repo/
# https://www.percona.com/blog/how-to-create-your-own-repositories-for-packages/

# if jq is missing, install it
if ! command -v jq &> /dev/null
then
    sudo apt install jq
fi

# RSTUDIO ----

# daily

# read https://dailies.rstudio.com/rstudio/latest/index.json and get the url of the latest rstudio-desktop deb file
url="https://dailies.rstudio.com/rstudio/latest/index.json"
js=$(curl -s $url)
fileurl=$(echo $js | jq -r '.products.electron.platforms."jammy-amd64".link')

# prune the url to get the file name
file=$(basename $fileurl)

# paste apt-repo/pool/main/ to the file name
file="apt-repo-daily/$file"

mkdir -p apt-repo-daily/

# if the file is not already downloaded, download it
if [ ! -f $file ]; then
    curl -s -o $file $fileurl
fi

# stable

fileurl="https://download1.rstudio.org/electron/jammy/amd64/rstudio-2023.03.0-386-amd64.deb"

# file="rstudio-desktop.deb"
# prune the url to get the file name
file=$(basename $fileurl)

# paste apt-repo/pool/main/ to the file name
file="apt-repo/$file"

mkdir -p apt-repo/

# if the file is not already downloaded, download it
if [ ! -f $file ]; then
    curl -s -o $file $fileurl
fi

# QUARTO ----

fileurl="https://objects.githubusercontent.com/github-production-release-asset-2e65be/298579934/3d552f6f-32fb-4d17-91ca-a5436254b886?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230510%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230510T190926Z&X-Amz-Expires=300&X-Amz-Signature=b7ab8e2886eaf5fd41cad9bbdceb799c624d06b7a9e000abd94cac10fe2b4717&X-Amz-SignedHeaders=host&actor_id=10091065&key_id=0&repo_id=298579934&response-content-disposition=attachment%3B%20filename%3Dquarto-1.3.340-linux-amd64.deb&response-content-type=application%2Foctet-stream"
file="apt-repo/quarto-1.3.340-linux-amd64.deb"
if [ ! -f $file ]; then
    curl -s -o $file $fileurl
fi

# # Create a list of packages ----

cd apt-repo && bash ../02-generate-release.sh > Release && dpkg-scanpackages . /dev/null > Packages && cd ..
cd apt-repo-daily && bash ../02-generate-release.sh > Release && dpkg-scanpackages . /dev/null > Packages && cd ..

# # SIGN ----

# create GPG key
echo "%echo Generating a PGP key
Key-Type: RSA
Key-Length: 4096
Name-Real: Pacha
Name-Email: m.sepulveda@mail.utoronto.ca
Expire-Date: 0
%no-ask-passphrase
%no-protection
%commit" > /tmp/rstudio-pgp-key.batch

export GNUPGHOME="$(mktemp -d pgpkeys-XXXXXX)"

gpg --no-tty --batch --gen-key /tmp/rstudio-pgp-key.batch
# ls "$GNUPGHOME/private-keys-v1.d"
# gpg --list-keys

# don't run this twice!
# gpg --armor --export Pacha > pgp-key.public
# cat pgp-key.public | gpg --list-packets

# gpg --armor --export-secret-keys Pacha > pgp-key.private
# add this to the .gitignore file
# echo "pgp-key.private" >> .gitignore
# git add .gitignore

# upload the public key to http://keyserver.ubuntu.com/#submitKey

export GNUPGHOME="$(mktemp -d pgpkeys-XXXXXX)"
# gpg --list-keys

cat pgp-key.private | gpg --import
cat apt-repo/Release | gpg --default-key Pacha -abs > apt-repo/Release.gpg
cat apt-repo/Release | gpg --default-key Pacha -abs --clearsign > apt-repo/InRelease

cat pgp-key.private | gpg --import
cat apt-repo-daily/Release | gpg --default-key Pacha -abs > apt-repo-daily/Release.gpg
cat apt-repo-daily/Release | gpg --default-key Pacha -abs --clearsign > apt-repo-daily/InRelease

# copy the public key to apt-repo
cp pgp-key.public apt-repo/pacha.gpg
cp pgp-key.public apt-repo-daily/pacha.gpg

# copy the dirs to the server

rsync -av --update --exclude='.git' apt-repo/ pacha@tradestatistics.io:~/apt-repo/
rsync -av --update --exclude='.git' apt-repo-daily/ pacha@tradestatistics.io:~/apt-repo-daily/

```

### `generate-release.sh`

```bash
#!/bin/bash
set -e

do_hash() {
    HASH_NAME=$1
    HASH_CMD=$2
    echo "${HASH_NAME}:"
    for f in $(find -type f); do
        f=$(echo $f | cut -c3-) # remove ./ prefix
        if [ "$f" = "Release" ]; then
            continue
        fi
        echo " $(${HASH_CMD} ${f}  | cut -d" " -f1) $(wc -c $f)"
    done
}

cat << EOF
Origin: Tradestatistics.io
Label: Just to install RStudio Desktop with APT
Suite: stable
Codename: stable
Version: 0.1
Architectures: amd64 arm64 arm7
Components: main
Description: An example software repository
Date: $(date -Ru)
EOF
do_hash "MD5Sum" "md5sum"
do_hash "SHA1" "sha1sum"
do_hash "SHA256" "sha256sum"
```

## Appendix: Links and References

*Note created on [[2023-05-20]] and last modified on [[2023-05-20]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Setting up R and RStudio on Ubuntu]] AND -"CHANGELOG" AND -"//Setting up R and RStudio on Ubuntu"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

