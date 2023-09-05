---
Date Created: 2023-09-04
Date Modified: 2023-09-04
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Topic/Dev/Shell", "#Type/Tool/Shell", "#Status/Permanent" ]
Alias: [ "shenv", "Simple Shell Version Manager"]
---

# Simple Shell Version Manager - `shenv`

> [!SOURCE] Sources
> - *[shenv/shenv: Simple shell version management (github.com)](https://github.com/shenv/shenv)*


## Contents

- [Overview](#overview)
- [Features](#features)
- [How it Works](#how-it-works)
	- [Understanding PATH](#understanding-path)
	- [Understanding Shims](#understanding-shims)
	- [Choosing Shell Version](#choosing-shell-version)
	- [Locating Shell Installations](#locating-shell-installations)
	- [Manage Virtual Environments](#manage-virtual-environments)
- [Installation](#installation)
- [Upgrading](#upgrading)
- [Uninstalling](#uninstalling)
- [Advanced Configuration](#advanced-configuration)
- [Command Reference](#command-reference)
- [Environment Variables](#environment-variables)
- [Development](#development)
- [License](#license)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)


## Overview

> [!INFO] About
> - *Simple Shell Version Manager* (`shenv`) lets one easily switch between multiple versions of a [[shell]]. 
> - It's simple, unobtrusive, and follows the [[UNIX]] tradition of single-purpose tools that do one thing well.

> [!NOTE] Note
> `shenv` is a [[fork]] of [[pyenv]] (which in turn is a fork of [[rbenv]]) but modified for the [[shell]].

## Features

`shenv` has the following features:

- Lets one **change the global shell version** on a per-user basis.
- Provide support for **per-project shell versions**.
- Allow you to **override the shell version** with an environment variable.
- Search commands from **multiple versions of shell at a time**.

## How it Works

At a high level, `shenv` intercepts [[shell]] commands using [[shim executables]] injected into your `PATH`, determines which shell version has been specified by your application, and passes your commands along to the correct shell installation.

### Understanding PATH

When you run a command like `bash` or `zsh`, your [[operating system]] searches through a list of directories to find an executable file with that name. 

This list of directories lives in an [[environment variable]] called `PATH`, with each directory in the list separated by a colon (on [[UNIX]], on [[Windows]], separated by a semi-colon):

```bash
# Example $PATH
/usr/local/bin:/usr/bin:/bin
```

Directories in `PATH` are searched from left to right, so a matching executable in a directory at the beginning of the list takes precedence over another one at the end. In this example, the `/usr/local/bin` directory will be searched first, then `/usr/bin`, then `/bin`.

### Understanding Shims

`shenv` works by inserting a directory of _shims_ at the front of your `PATH`:

```bash
$(shenv root)/shims:/usr/local/bin:/usr/bin:/bin
```

Through a process called _rehashing_, `shenv` maintains shims in that directory to match every shell command across every installed version of shell.

*Shims are lightweight executables that simply pass your command along to `shenv`*. 

So with `shenv` installed, when you run, say, `pip`, your operating system will do the following:

- Search your `PATH` for an executable file named `pip`
- Find the `shenv` shim named `pip` at the beginning of your `PATH`
- Run the shim named `pip`, which in turn passes the command along to `shenv`

### Choosing Shell Version

When you execute a shim, shenv determines which shell version to use by reading it from the following sources, in this order:

1. The `SHENV_VERSION` environment variable (if specified). You can use the [`shenv shell`](https://github.com/shenv/shenv/blob/master/COMMANDS.md#shenv-shell) command to set this environment variable in your current shell session.
    
2. The application-specific `.shell-version` file in the current directory (if present). You can modify the current directory's `.shell-version` file with the [`shenv local`](https://github.com/shenv/shenv/blob/master/COMMANDS.md#shenv-local) command.
    
3. The first `.shell-version` file found (if any) by searching each parent directory, until reaching the root of your filesystem.
    
4. The global `$(shenv root)/version` file. You can modify this file using the [`shenv global`](https://github.com/shenv/shenv/blob/master/COMMANDS.md#shenv-global) command. If the global version file is not present, shenv assumes you want to use the "system" shell. (In other words, whatever version would run if shenv weren't in your `PATH`.)

### Locating Shell Installations

Once shenv has determined which version of shell your application has specified, it passes the command along to the corresponding shell installation.

Each shell version is installed into its own directory under `$(shenv root)/versions`.

For example, you might have these versions installed:

- `$(shenv root)/versions/2.7.8/`
- `$(shenv root)/versions/3.4.2/`
- `$(shenv root)/versions/pypy-2.4.0/`

As far as shenv is concerned, version names are simply the directories in `$(shenv root)/versions`.

### Manage Virtual Environments

There is a shenv plugin named [shenv-virtualenv](https://github.com/shenv/shenv-virtualenv) which comes with various features to help shenv users to manage virtual environments created by virtualenv or Anaconda. Because the `activate` script of those virtual environments are relying on mutating `$PATH` variable of user's interactive shell, it will intercept shenv's shim style command execution hooks. We'd recommend to install shenv-virtualenv as well if you have some plan to play with those virtual environments.

## Installation

Install `shenv` using `git` by checking out the repository from [[GitHub]]:

1. Checkout `shenv` repository to your desired installation location (usually `$HOME/.shenv` or `$HOME/.config/shenv`)

```bash
git clone https://github.com/shenv/shenv.git ~/.shenv
```

or 

```bash
git clone https://github.com/shenv/shenv.git $XDG_CONFIG_HOME:-$HOME/.config/shenv
```

2: **Define Environment Variable `SHENV_ROOT`** to point to the path where shenv repo is cloned and add `$SHENV_ROOT/bin` to your `$PATH` for access to the `shenv` command-line utility.

```bash
echo 'export SHENV_ROOT="$HOME/.shenv"' >> ~/.bash_profile
echo 'export PATH="$SHENV_ROOT/bin:$PATH"' >> ~/.bash_profile
```

> [!NOTE] Notes
> - **[[zsh]] Note:** modify `.zshenv` instead of `.bash_profile`.
> - **[[Ubuntu]] or [[Fedora]] Note:** modify `.bashrc` instead of `.bash_profile`.
> - **Proxy Note:** If you use a proxy, export `http_proxy` and `HTTPS_PROXY` too.

3. **Add `shenv init` to your shell** to enable shims and autocompletion. Please make sure `eval "$(shenv init -)"` is placed toward the end of the shell configuration file since it manipulates `PATH` during the initialization.

```bash
echo -e 'if command -v shenv 1>/dev/null 2>&1; then\n  eval "$(shenv init -)"\nfi' >> ~/.bash_profile
```

> [!NOTE] Notes
> - **[[zsh]] Note:** modify `.zshenv` instead of `.bash_profile`.
> - **[[Ubuntu]] or [[Fedora]] Note:** modify `.bashrc` instead of `.bash_profile`.

> [!WARNING] Warning
> There are some systems where the `BASH_ENV` variable is configured to point to `.bashrc`. On such systems you should almost certainly put the abovementioned line `eval "$(shenv init -)"` into `.bash_profile`, and **not** into `.bashrc`. Otherwise you may observe strange behaviour, such as `shenv` getting into an infinite loop. See [#264](https://github.com/pyenv/pyenv/issues/264) for details.

4. **Restart your shell so the path changes take effect.** You can now begin using `shenv`.

```bash
exec "$SHELL"
```

5. **Install shell versions into `$(shenv root)/versions`.** 

For example, to download and install [[Bash]] v4.4.12, run:

```bash
shenv install bash-4.4.12
```

> [!NOTE] Notes
> - If you need to pass configure option to build, please use `CONFIGURE_OPTS` environment variable.
> - If you want to use proxy to download, please use `http_proxy` and `https_proxy` environment variable.
> - If you are having trouble installing a shell version, please visit the wiki page about [Common Build Problems](https://github.com/shenv/shenv/wiki/Common-build-problems).

## Upgrading

If you've installed shenv using the instructions above, you can upgrade your installation at any time using git.

To upgrade to the latest development version of shenv, use `git pull`:

```bash
cd $(shenv root)
git pull
```

To upgrade to a specific release of shenv, check out the corresponding tag:

```bash
cd $(shenv root)
git fetch
git tag
v0.1.0
git checkout v0.1.0
```

## Uninstalling

The simplicity of shenv makes it easy to temporarily disable it, or uninstall from the system.

1. To **disable** shenv managing your shell versions, simply remove the `shenv init` line from your shell startup configuration. This will remove shenv shims directory from PATH, and future invocations like `bash` will execute the system shell version, as before shenv.

`shenv` will still be accessible on the command line, but your shell apps won't be affected by version switching.

2. To completely **uninstall** shenv, perform step (1) and then remove its root directory. This will **delete all shell versions** that were installed under `$(shenv root)/versions/` directory:

```bash
rm -rf $(shenv root)
```

If you've installed shenv using a package manager, as a final step perform the shenv package removal. 

For instance, for [[Homebrew]]:

```bash
brew uninstall shenv
```

## Advanced Configuration

Skip this section unless you must know what every line in your shell profile is doing.

`shenv init` is the only command that crosses the line of loading extra commands into your shell. Coming from rvm, some of you might be opposed to this idea. Here's what `shenv init` actually does:

1. **Sets up your shims path.** This is the only requirement for shenv to function properly. You can do this by hand by prepending `$(shenv root)/shims` to your `$PATH`.
    
2. **Installs autocompletion.** This is entirely optional but pretty useful. Sourcing `$(shenv root)/completions/shenv.bash` will set that up. There is also a `$(shenv root)/completions/shenv.zsh` for Zsh users.
    
3. **Rehashes shims.** From time to time you'll need to rebuild your shim files. Doing this on init makes sure everything is up to date. You can always run `shenv rehash` manually.
    
4. **Installs the sh dispatcher.** This bit is also optional, but allows shenv and plugins to change variables in your current shell, making commands like `shenv shell` possible. The sh dispatcher doesn't do anything crazy like override `cd` or hack your shell prompt, but if for some reason you need `shenv` to be a real script rather than a shell function, you can safely skip it.
    

To see exactly what happens under the hood for yourself, run `shenv init -`.

## Command Reference

## Environment Variables

You can affect how shenv operates with the following settings:

Name | Default | Description
-----|---------|------------
`SHENV_VERSION` | | Specifies the shell version to be used.<br>Also see [`shenv shell`](https://github.com/shenv/shenv/blob/master/COMMANDS.md#shenv-shell)
`SHENV_ROOT` | `~/.shenv` | Defines the directory under which shell versions and shims reside.<br>Also see `shenv root`
`SHENV_DEBUG` | | Outputs debug information.<br>Also as: `shenv --debug <subcommand>`
`SHENV_HOOK_PATH` | [_see wiki_][wiki] | Colon-separated list of paths searched for shenv hooks.
`SHENV_DIR` | `$PWD` | Directory to start searching for `.shell-version` files.
`SHELL_BUILD_ARIA2_OPTS` | | Used to pass additional parameters to [`aria2`](https://aria2.github.io/).<br>If `aria2c` binary is available on PATH, `shenv` uses `aria2c` instead of `curl` or `wget` to download the shell Source code.<br>If you have an unstable internet connection, you can use this variable to instruct `aria2` to accelerate the download.<br>In most cases, you will only need to use `-x 10 -k 1M` as value to `SHELL_BUILD_ARIA2_OPTS` environment 


## Development

- The `shenv` source code is [hosted on GitHub](https://github.com/shenv/shenv).  
- It's clean, modular, and easy to understand, even if you're not a shell hacker.

Tests are executed using [Bats](https://github.com/bats-core/bats-core):

```bash
bats test
bats/test/<file>.bats
```

Please feel free to submit pull requests and file bugs on the [issue tracker](https://github.com/shenv/shenv/issues).

## License

Software licensed under [MIT](https://opensource.org/licenses/MIT) license.

***

## Appendix: Links and References

*Note created on [[2023-09-04]] and last modified on [[2023-09-04]].*

### Internal Linked Notes

- [[03 - AREAS/Technology/Programming/Command Line/Shell/_README|Shell]]
- [[03 - AREAS/Technology/Programming/Command Line/Shell/Other/_README|Other Shells]]
- [[pyenv|Python Environment Manager]] (`pyenv`)
- [[rbenv|Ruby Environment Manager]] (`rbenv`)
- [[tfenv|Terraform Environment Manager]] (`tfenv`)
- [[Bash]]
- [[03 - AREAS/Technology/Programming/DevOps/Version Control/Git|Git]]
- [[Windows Terminal]]



### External References

#### Backlinks

```dataview
list from [[shenv]] AND -"CHANGELOG" AND -"03 - AREAS/Technology/Programming/Command Line/Shell/Other/shenv"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023



[wiki]: https://github.com/shenv/shenv/wiki/Authoring-plugins#shenv-hooks

