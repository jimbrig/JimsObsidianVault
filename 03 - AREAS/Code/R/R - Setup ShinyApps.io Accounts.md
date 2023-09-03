---
Date: 2023-08-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/R", "#Topic/Dev/R"]
Aliases: [ "Setup ShinyApps.io Accounts" ]
---

# Setup ShinyApps.io Accounts

> [!SOURCE] Sources
> - *[shinyapps.io user guide (posit.co)](https://docs.posit.co/shinyapps.io/)*
> - *[rstudio/rsconnect (github.com)](https://github.com/rstudio/rsconnect/tree/main)*
> - *[jimbrig/XDG_CONFIG_HOME_R/scripts/dev/shinyappsio_setup.R (github.com)](https://github.com/jimbrig/XDG_CONFIG_HOME_R/blob/main/scripts/dev/shinyappsio_setup.R)*

## Contents

[TOC]

## Overview

In order to properly setup and configure [[ShinyApps.io]] accounts to integrate with [[R]] and [[RStudio]], you need the following:

1. File to store your account(s) credentials and metadata
2. Script to create the `*.dcf` account files

### Configuration

For step (1) above:
- The file should be treated as sensitive and not pushed to any version control repositories
- The file can be one of the following:
	- `config.yml` file to load via the [[config]] package
	- `*.Renviron` file to assign environment variables for an R session
	- any other loadable data file

- Example `shinyappsio.config.yml`:

```yaml
default:
  shinyappsio:
    accounts:
      - jimbrig
      - jimbrig2011
      - jimmy-briggs
      - jimsdeployments
      - jimsshinyapps
    token: <REDACTED>
    secret: <REDACTED>
```

Load the config via `config::get("shinyappsio")`.

## Code

For step (2) above,

- Script to create the `*.dcf` account files
	- These `.dcf` files are stored under `%APPDATA%\Roaming\R\config\rsconnect\accounts\shinyapps.io\*` on [[Windows]]
	- There are separate `.dcf` files for each account.

```R
#  ------------------------------------------------------------------------
#
# Title : ShinyApps.io Accounts Setup Script
#    By : Jimmy Briggs
#  Date : 2023-01-28
#
#  ------------------------------------------------------------------------

require(rsconnect)
require(config)
require(purrr)

conf <- config::get("shinyappsio", file = r_config_dir("config/rsconnect/shinyappsio.config.yml"))

params <- list(
  account = conf$accounts,
  token = conf$token,
  secret = conf$secret
)

purrr::pwalk(
  params,
  function(account, token, secret) {
    rsconnect::setAccountInfo(
      name = account,
      token = token,
      secret = secret
    )
  }
)
```

## Details

The code performs the following:

1. Ensures required packages are installed: 
	- `rsconnect`
	- `config`
	- `purrr`
2. Loads the `shinyappsio.config.yml` configuration file into variable `conf`
3. Creates a parameter list, `params`, to be passed to `purrr::pwalk()`
4. Runs `purrr::pwalk()` against the params, looping through each account and registering them using the provided token and secret.

## Results

Once complete, you can verify successful implementation by:

1. Opening [[03 - AREAS/Technology/Programming/Tools/IDEs/RStudio|RStudio]], opening `Global Settings > Publishing` and viewing the *Publishing Accounts*:

![](https://i.imgur.com/Dk9sL6f.png)

2. Run `rsconnect::accounts("shinyapps.io")`:

```R
> rsconnect::accounts("shinyapps.io")
             name       server
1         jimbrig shinyapps.io
2     jimbrig2011 shinyapps.io
3    jimmy-briggs shinyapps.io
4 jimsdeployments shinyapps.io
5   jimsshinyapps shinyapps.io
```

***

## Appendix: Links and References

*Note created on [[2023-08-30]] and last modified on [[2023-08-30]].*

### Internal Linked Notes

- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[R - Setup ShinyApps.io Accounts]] AND -"CHANGELOG" AND -"03 - AREAS/Code/R/R - Setup ShinyApps.io Accounts"
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
