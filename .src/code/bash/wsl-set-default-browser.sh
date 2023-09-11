#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Set Default Browser Script
# See: https://akimon658.github.io/en/p/2021/wsl-default-browser/

# NOTE: Automatically sets the priority to 1. If you want to change it, apply this script's logic manually.

# BROWSER_PATH Variable: Chrome, Firefox, Edge, etc.
#
# NOTES:
# - Should be WSL mounted path (i.e. /mnt/c/...)
# - Should be escaped paths (i.e. escape spaces via `\ `)
# - Check if browser exists before setting
# Example Paths by Browser:
# - Chrome: "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"
# - Firefox: "/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
# - Edge: "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"

$BROWSER_PATH=$1

# Set Default Browser for WSL
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser $BROWSER_PATH 1
