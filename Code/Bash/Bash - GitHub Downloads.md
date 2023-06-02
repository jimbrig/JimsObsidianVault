---
Date: 2023-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code/Bash", "#Topic/Dev/Bash", "#Topic/Dev/Linux" ]
Alias: [ "GitHub Downloads with Bash" ]
---

# GitHub Downloads

> [!SOURCE] Sources
> - *[[gh-dl-release] Download Assets from Private GitHub Releases #script #bash #powershell #github #utility](https://gist.github.com/jimbrig/03aa65c9b20dc3ad86bbb442f723672a)*

## Contents

- [Code](#code)
- [Details](#details)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Code

*Link: [jimbrig/gh-dl-release.sh](https://gist.githubusercontent.com/jimbrig/03aa65c9b20dc3ad86bbb442f723672a/raw/6c642349ac0c454cf386e94a38c08e465ddef2a8/gh-dl-release.sh)*

```bash
#!/usr/bin/env bash

# TITLE:
# gh-dl-release.sh
#
# DESCRIPTION:
# This script downloads an asset from latest or specific Github release of a
# private repo.
#
# USAGE:
# gh-dl-release.sh [<version>|latest] [<path/to/output/file>]
#
# PREREQUISITES:
# - curl
# - wget
# - jq
#
# NOTES: 
# - Set all the variables inside the script, make sure you chmod +x the script:
#   chmod +x ./gh-dl-release.sh
# - If your version/tag doesn't match, the script will exit with error.
# 
# EXAMPLES:
# - Download specific version to my_app.tar.gz
#   gh-dl-release 2.1.1 my_app.tar.gz
# - Download latest version:
#   gh-dl-release latest latest.tar.gz

TOKEN="<github_access_token>"
REPO="<user_or_org>/<repo_name>"
FILE="<name_of_asset_file>"      # the name of your release asset file, e.g. build.tar.gz
VERSION=$1                       # tag name or the word "latest"
GITHUB="https://api.github.com"

alias errcho='>&2 echo'

function gh_curl() {
  curl -H "Authorization: token $TOKEN" \
       -H "Accept: application/vnd.github.v3.raw" \
       $@
}

if [ "$VERSION" = "latest" ]; then
  # Github should return the latest release first.
  parser=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
  parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi;

asset_id=`gh_curl -s $GITHUB/repos/$REPO/releases | jq "$parser"`
if [ "$asset_id" = "null" ]; then
  errcho "ERROR: version not found $VERSION"
  exit 1
fi;

wget -q --auth-no-challenge --header='Accept:application/octet-stream' \
  https://$TOKEN:@api.github.com/repos/$REPO/releases/assets/$asset_id \
  -O $2
```

## Details

Usage: `gh-dl-release.sh [<version>|latest] [<path/to/output/file>]`

Notes:

- *[[Github]] Personal Access Token must be supplied*
- Must have [[curl]], [[wget]], and [[jq]] installed and on the system/user's `PATH` [[environment variable]].

***

## Appendix: Links and References

*Note created on [[2023-06-01]] and last modified on [[2023-06-01]].*

### Internal Linked Notes

> [!NOTE] See Also: 
> [[PowerShell]] Version of Same Functionality: [[PowerShell - GitHub Downloads]]

- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]
- [[Github]]
- [[Shell Scripting]]
- [[GitHub CLI]]
- [[Git]]
- [[Git Releases]]

### External References

- [Download assets from private Github releases](https://gist.github.com/maxim/6e15aa45ba010ab030c4)


#### Backlinks

```dataview
list from [[Bash - GitHub Downloads]] AND -"CHANGELOG" AND -"Code/Bash/Bash - GitHub Downloads"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

