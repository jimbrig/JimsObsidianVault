#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Git Sparse Checkout Script

LOCAL_DIR_NAME=$1 # LOCAL_DIR_NAME="git-completions"
REMOTE_REPO=$2 # REMOTE_REPO="https://github.com/git/git.git"
REMOTE_SUBDIR=$3 # REMOTE_SUBDIR="contrib/completion"

mkdir $LOCAL_DIR_NAME && cd $LOCAL_DIR_NAME
git init && git config core.sparsecheckout true
echo $REMOTE_SUBDIR >> .git/info/sparse-checkout
git remote add -f origin $REMOTE_REPO
git pull origin main
