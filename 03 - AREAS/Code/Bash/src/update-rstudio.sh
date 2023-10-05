#!/usr/bin/env bash
# -*- coding: utf-8 -*-

distro=$(lsb_release -cs)

rstudio_url=https://www.rstudio.com/products/rstudio/download/#download
tmp_file=$(mktemp)

echo Grabbing Download HTML

curl --silent $rstudio_url -o $tmp_file

rstudio_ide_url=$(grep -Po "https://download1.rstudio.org/desktop/$distro/[^\"]+\.deb" $tmp_file)

echo Found $distro url: $rstudio_ide_url

hash_code=$(grep -A 7 -P "https://download1.rstudio.org/desktop/$distro/[^\"]+\.deb" $tmp_file | grep -Po '(?<=data-content=")[0-9a-z]+')

echo Found SHA-256: $hash_code

echo Downloading RStudio

curl $rstudio_ide_url -o ~/Downloads/new-rstudio.deb

sha256sum ~/Downloads/new-rstudio.deb

echo "Do you want to install RStudio? [N/y]"

read INSTALL

if [[ $INSTALL == 'y' ]]; then
	sudo dpkg -i ~/Downloads/new-rstudio.deb
fi
