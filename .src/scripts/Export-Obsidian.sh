#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Export Obsidian Vault

# Rename _README.md's:
find . -name "*_README.md" -execdir mv -i {} README.md ";"

# First, Check if obsidian-export is installed:
if ! command -v obsidian-export &> /dev/null
then
    echo "obsidian-export could not be found"
    echo "Please install obsidian-export from https://github.com/obsidianmd/obsidian-export or using rustup/cargo:"
    echo "cargo install obsidian-export"
    echo "checking if rustup/cargo is installed..."
    if ! command -v cargo &> /dev/null
    then
        echo "rustup/cargo could not be found"
        echo "Please install rustup/cargo from https://rustup.rs/"
        exit 1
    else
        echo "rustup/cargo is installed"
        echo "installing obsidian-export..."
        cargo install --locked obsidian-export || true
    fi
fi

# Create temporary location for Obsidian Export, export/convert, copy back, and cleanup:
mkdir tmp && obsidian-export . tmp --frontmatter never && cp tmp/* . -f -r && rm -r tmp

# Git
git add . && git commit -m "chore: convert mdlinks via obsidian-export and renamed READMEs" && git push > /dev/null 2>&1

# Export Obsidian Vault
obsidian-export --vault . --output .obsidian-export --format markdown --recursive --overwrite
