#!/usr/bin/env bash

## Usage:
##  git-auto ;; use current script dir as git dir, and auto commit, not push.
##  git-auto -d /path/to/your/note's/dir   ;; set git dir
##  git-auto -p ;; auto commit and push
##  git-auto -s origin -p ;; set remote server
##  git-auto -b main -p ;; set git branch
##  git-auto -i 30 -p ;; set interval seconds
##  git-auto -o -p;; execute once


#set -e
#set -x

usage="usage: $0
    [-d <git directory>]
    [-i <interval seconds>]
    [-p <push to remote server>]
    [-s git remote server]
    [-b git branch]
    [-o <execute once]"

push_to_server=0
server=origin
interval=20
once=0

OPTIND=1
while getopts d:i:b:s:po flag; do
  case "${flag}" in
  d) directory=${OPTARG} ;;
  p) push_to_server=1 ;;
  o) once=1 ;;
  s) server=${OPTARG} ;;
  b) branch=${OPTARG} ;;
  i) interval=${OPTARG} ;;
  *)
    echo "ERROR: ${usage}" >&2
    exit 1
    ;;
  esac
done
shift $((OPTIND - 1))

if  [[ "${directory}" ]]; then
  cd "${directory}" || exit 1
fi

if [[ -z "${branch}" ]]; then
  branch=$(git rev-parse --abbrev-ref HEAD)
fi

auto-commit-and-push() {
  if ! [[ $(git status) =~ "working tree clean" ]]; then
    git add .
    git commit -m "auto commit"

    if [[ 1 == "${push_to_server}" ]]; then
      git push "${server}" "${branch}"
    fi
  fi
}

date

if [[ 1 == "${once}" ]]; then
  auto-commit-and-push
else
  while true; do
    auto-commit-and-push
    sleep "${interval}"
  done
fi
