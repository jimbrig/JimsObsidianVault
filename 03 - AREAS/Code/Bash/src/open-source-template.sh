#!/usr/bin/env bash
# -*- coding: utf-8 -*-

url="https://raw.githubusercontent.com/jimbrig/open-source-project-template/main"

root_files=(
  ".gitattributes"
  ".gitignore"
  ".editorconfig
  "CHANGELOG.md"
  "LICENSE.md"
  "INSTALL.md"
  "README.md"
)

gh_files=(
  "CODE_OF_CONDUCT.md"
  "SECURITY.md"
  "SUPPORT.md"
  "TERMS.md"
  "CONTRIBUTING.md"
  "dependabot.yml"
  "FUNDING.yml"
  "stale.yml"
  "labels.yml"
  "PULL_REQUEST_TEMPLATE.yml"
  "ISSUE_TEMPLATE/bug.yml"
  "ISSUE_TEMPLATE/feature.yml"
  "ISSUE_TEMPLATE/question.yml"
  "ISSUE_TEMPLATE/support.yml"
  "ISSUE_TEMPLATE/custom.yml"
  "ISSUE_TEMPLATE/config.yml"
  "workflows/changelog.yml"
  "workflows/test.yml"
  "workflows/release.yml"
  "workflows/build.yml"
  "actions/.gitkeep"
  "config/"cliff.toml"
  "scripts/.gitkeep"
)

echo 'Creating .github directory...'

mkdir -p .github
mkdir -p .github/ISSUE_TEMPLATE
mkdir -p .github/workflows
mkdir -p .github/actions
mkdir -p .github/config
mkdir -p .github/scripts

echo 'Downloading files...'

for file in "${root_files[@]}"; do
  if [ ! -f "./${file}" ]; then
    curl -so "./${file}" "${url}/${file}"
  else
    echo "${file} already exists, skipping"
  fi
done

for file in "${gh_files[@]}"; do
  if [ ! -f "./${file}" ]; then
    curl -so ".github/${file}" "${url}/.github/${file}"
  else
    echo ".github/${file} already exists, skipping"
  fi
done

echo "download complete"
