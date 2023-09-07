---
Date: 2023-09-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code/Bash", "#Topic/Dev/Bash", "#Topic/Dev/Linux" ]
Alias: [ "Docker Cleanup Volumes", "Docker Cleanup Volumes Shell Script" ]
---

# Docker Cleanup Volumes

> [!WARNING] Warning
> *Use at your own risk, always test with the `--dry-run` parameter first. If it's not compatible with your system or Docker version it **will** delete all your volumes.*

## Contents

- [Code](#code)
	- [Script](#script)
	- [Dockerfile](#dockerfile)
- [Details](#details)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Overview

This code snippet is a [[03 - AREAS/Code/Bash/_README|Shell Script]] to delete *orphaned docker volumes in `/var/lib/docker/volumes` and `/var/lib/docker/vfs/dir`.

Requires [[Docker]] Version `1.4.1` up to `20.10.x+`.


## Code

Run via 

```bash
docker run \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /var/lib/docker:/var/lib/docker \
	--rm martin/docker-cleanup-volumes [--dry-run]
```

### Standalone Shell Script

> [!SOURCE] Source:
> *[docker-cleanup-volumes/docker-cleanup-volumes.sh at master · chadoe/docker-cleanup-volumes (github.com)](https://github.com/chadoe/docker-cleanup-volumes/blob/master/docker-cleanup-volumes.sh)*

To run the standalone shell script: 

```bash
sudo ./docker-cleanup-volumes.sh [--dry-run] [--verbose]
```

- **`--dry-run`**: Script prints the volumes that would have been deleted without actually deleting them.
- **`--verbose`**: Have the script output more information.

and the actual script, [[docker-cleanup-volumes.sh]]:

```embed-bash
TITLE: "docker-cleanup-volumes.sh"
PATH: "vault://03 - AREAS/Code/Bash/src/docker-cleanup-volumes.sh"
```

### Using Docker

> [!SOURCE] Source:
> *[docker-cleanup-volumes/Dockerfile at master · chadoe/docker-cleanup-volumes (github.com)](https://github.com/chadoe/docker-cleanup-volumes/blob/master/Dockerfile)*

- Run the *latest* forward compatible [[Docker]] client version (works with host Docker `1.4.x` up to `1.13.x`)

```bash
docker run \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /var/lib/docker:/var/lib/docker \
	--rm martin/docker-cleanup-volumes \
	--dry-run
```

- If you symlinked `/var/lib/docker` to somewhere else make sure you tell the [[Docker]] container where it is by providing the real path or by using readlink in volume parameter.

```bash
docker run \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(readlink -f /var/lib/docker):/var/lib/docker \
	--rm martin/docker-cleanup-volumes \
	--dry-run
```

and the actual [[Dockerfile]]:

```dockerfile
FROM alpine:latest
LABEL MAINTAINER="Jimmy Briggs <jimmy.briggs@jimbrig.com"
ENV DOCKER_VERSION="20.10.21"

# Install an up to date version of docker
RUN apk add --update-cache curl bash grep && \
	# the docker package in alpine disables aufs and devicemapper
    curl -sSL https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | 
	    tar -xz docker/docker --strip-components 1 && \
    mv ./docker /usr/bin && chmod +x /usr/bin/docker && \
    # cleanup
    apk del curl && rm -rf /var/cache/apk/*

# Add the cleanup script
COPY ./docker-cleanup-volumes.sh /usr/local/bin/

#Define entrypoint
ENTRYPOINT ["/usr/local/bin/docker-cleanup-volumes.sh"]
```


## Details


> [!NOTE]
> Details about what the code does.

- Cleans up *orphaned docker volumes*



***

## Appendix: Links and References

*Note created on [[2023-09-07]] and last modified on [[2023-09-07]].*

### Internal Linked Notes

- [[Code/_README|Code Snippets]]
- [[MOCs/MOC - Development|Development]]
- [[MOCs/MOC - Technology|Technology]]
- [[MOCs/MOC - Software|Software Engineering]]

### External References



#### Backlinks

```dataview
list from [[Bash - Docker Cleanup Volumes]] AND -"CHANGELOG" AND -"03 - AREAS/Code/Bash/Bash - Docker Cleanup Volumes"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023


> [!failure]- Failure 
>   Error: There is another generation process
>   
>   - plugin:obsidian-textgenerator-plugin:56986 TextGenerator.eval
>     plugin:obsidian-textgenerator-plugin:56986:31
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:56972 TextGenerator.generate
>     plugin:obsidian-textgenerator-plugin:56972:12
>   
>   - plugin:obsidian-textgenerator-plugin:58477 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58477:52
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58460 AutoSuggest.getGPTSuggestions
>     plugin:obsidian-textgenerator-plugin:58460:12
>   
>   - plugin:obsidian-textgenerator-plugin:58374 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58374:42
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58371 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58371:60
>   
>   - plugin:obsidian-textgenerator-plugin:58351 eval
>     plugin:obsidian-textgenerator-plugin:58351:14
>   
>  

> [!failure]- Failure 
>   Error: There is another generation process
>   
>   - plugin:obsidian-textgenerator-plugin:56986 TextGenerator.eval
>     plugin:obsidian-textgenerator-plugin:56986:31
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:56972 TextGenerator.generate
>     plugin:obsidian-textgenerator-plugin:56972:12
>   
>   - plugin:obsidian-textgenerator-plugin:58477 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58477:52
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58460 AutoSuggest.getGPTSuggestions
>     plugin:obsidian-textgenerator-plugin:58460:12
>   
>   - plugin:obsidian-textgenerator-plugin:58374 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58374:42
>   
>   - Generator.next
>   
>   - plugin:obsidian-textgenerator-plugin:78 eval
>     plugin:obsidian-textgenerator-plugin:78:61
>   
>   - new Promise
>   
>   - plugin:obsidian-textgenerator-plugin:62 __async
>     plugin:obsidian-textgenerator-plugin:62:10
>   
>   - plugin:obsidian-textgenerator-plugin:58371 AutoSuggest.eval
>     plugin:obsidian-textgenerator-plugin:58371:60
>   
>   - plugin:obsidian-textgenerator-plugin:58351 eval
>     plugin:obsidian-textgenerator-plugin:58351:14
>   
>  
