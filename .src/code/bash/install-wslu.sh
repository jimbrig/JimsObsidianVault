#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# WSLU Installation Script
# See: https://wslutiliti.es/wslu/install.html

# Variants:
# - Ubuntu
# - Kali Linux

# Create Variant Variable
VARIANT=""

# Check if Ubuntu or Kali Linux
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$NAME" == "Ubuntu" ]; then
        echo "Ubuntu detected"
        VARIANT="ubuntu"
    elif [ "$NAME" == "Kali GNU/Linux" ]; then
        echo "Kali Linux detected"
        VARIANT="kali"
    else
        echo "Unsupported Linux distribution"
    fi
else
    echo "Unsupported Linux distribution"
fi

# Run Installation Script (based on Variant)

if [ "$VARIANT" == "ubuntu" ]; then
    echo "Installing WSLU for Ubuntu"
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install -y ubuntu-wsl
elif [ "$VARIANT" == "kali" ]; then
    echo "Installing WSLU for Kali Linux"
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install -y gnupg2 apt-transport-https
    echo "deb https://pkg.wslutiliti.es/kali kali-rolling main" | sudo tee -a /etc/apt/sources.list
    sudo apt-get -y update && sudo apt-get -y install wslu
else
    echo "Unsupported Linux distribution"
fi
