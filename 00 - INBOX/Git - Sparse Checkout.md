---
Date Created: 2023-09-09
Date Modified: 2023-09-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Note", "#Type/Code/Git", "#Topic/Dev/Git", "#Topic/Dev", "#Status/Permanent" ]
Aliases: [ "git-sparse-checkout", "Git Sparse Checkout", "Git Sparse Checkout Command" ]
---

# Git Sparse Checkout

> [!SOURCE] Sources:
> - *[Git - git-sparse-checkout Documentation (git-scm.com)](https://www.git-scm.com/docs/git-sparse-checkout)*
> - *[Using Git Sparse Checkout | Brian Coyner](https://briancoyner.github.io/articles/2013-06-05-git-sparse-checkout/#:~:text=Using%20Git%20Sparse%20Checkout%201%20Step%201%3A%20Create,add%20-f%20origin%20https%3A%2F%2Fgithub.%20com%20%2Fgit%2Fgit.%20git%20)*

## Contents

- [Overview](#overview)
- [Usage](#usage)
- [Sub-Commands](#sub-commands)
	- [Init](#init)
		- [Example](#example)
	- [List](#list)
		- [Example](#example)
	- [Set](#set)
		- [Example](#example)
	- [Add](#add)
		- [Example](#example)
	- [Reapply](#reapply)
		- [Example](#example)
	- [Disable](#disable)
		- [Example](#example)
	- [Check Rules](#check-rules)
		- [Example](#example)
- [Internals](#internals)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)





## Overview

There are times when all I want or need from a Git repo are a handful files. For example, I use the awesome `git-completion` and `git-prompt` scripts included in the Git project. Thus, I don't need the entire Git repo taking up space.

This is exactly what [sparse checkouts](https://schacon.github.io/git/git-read-tree.html) enable.

Here are the steps to create a "sparse" Git local repository that only includes the "Completion" scripts.

1. Create local directory
2. Initialize Git Repository
3. Enable Sparse Checkouts
4. Tell Git Which Directories to Checkout
5. Add the Remote
6. Fetch the Files

> [!INFO] See Also
> See my [[Guide - Using Git Sparse Checkout]] for a detailed walkthrough of the steps outlined above. This note is meant for documenting the technical syntax and usage for the `git sparse-checkout` command.

## Usage

> [!WARNING] Warning
> THIS COMMAND IS EXPERIMENTAL. ITS BEHAVIOR, AND THE BEHAVIOR OF OTHER COMMANDS IN THE PRESENCE OF SPARSE-CHECKOUTS, WILL LIKELY CHANGE IN THE FUTURE.

> [!INFO] Sparse Checkout
> Sparse Checkouts are checkouts in [[Git]] which change the working tree from including all tracked files present to only having a subset of those files. It can also switch which subset of files are present, or undo and go back to having all tracked files present in the working copy.
>
> - Source: [Git - git-sparse-checkout Documentation (git-scm.com)](https://www.git-scm.com/docs/git-sparse-checkout)

- `git-sparse-checkout` is a command that is part of [[Git]] allowing the developer to create what are known as *sparse checkouts.*
- The subset of files is chosen by providing a list of directories in cone mode (the default), or by providing a list of patterns in non-cone mode.
- When in a *sparse-checkout*, other [[Git]] commands behave a bit differently. 
	- For example, switching branches will not update paths outside the sparse-checkout directories/patterns, and `git commit -a` will not record paths outside the sparse-checkout directories/patterns as deleted.

Syntax:

```text
git sparse-checkout (init | list | set | add | reapply | disable | check-rules) [<options>]
```

## Sub-Commands

The commands for `git-sparse-checkout` are as following:

- `init`: Deprecated command that behaves like `set` with no specified paths. May be removed in the future.
- `list`: Describe the directories or patterns in the sparse-checkout file.
- `set`: Enable the necessary sparse-checkout config settings.
- `add`: Update the sparse-checkout file to include additional directories (in cone mode) or patterns (in non-cone mode).
- `reapply`: Reapply the sparsity pattern rules to paths in the working tree.
- `disable`: Disable the `core.sparseCheckout` config setting, and restore the working directory to include all files.
- `check-rules`: Check whether sparsity rules match one or more paths.

### Init

> [!WARNING] This sub-command is *deprecated*.

Deprecated command that behaves like `set` with no specified paths. May be removed in the future.

Historically, `set` did not handle all the necessary config settings, which meant that both `init` and `set` had to be called. Invoking both meant the `init` step would first remove nearly all tracked files (and in cone mode, ignored files too), then the `set` step would add many of the tracked files (but not ignored files) back. In addition to the lost files, the performance and UI of this combination was poor.

Also, historically, `init` would not actually initialize the sparse-checkout file if it already existed. This meant it was possible to return to a sparse-checkout without remembering which paths to pass to a subsequent _set_ or _add_ command. However, `--cone` and `--sparse-index` options would not be remembered across the disable command, so the easy restore of calling a plain `init` decreased in utility.

#### Example

```bash
git sparse-checkout init
```

### List

Describe the directories or patterns in the sparse-checkout file.

#### Example

```bash
git sparse-checkout list
```

### Set

`git-sparse-checkout set` enables the necessary sparse-checkout config settings (i.e. `core.sparseCheckout`, `core.sparseCheckoutCone`, and `index.sparse`) if they are not already set to the desired values, populate the sparse-checkout file from the list of arguments following the `set` subcommand, and update the working directory to match.

To ensure that adjusting the sparse-checkout settings within a worktree does not alter the sparse-checkout settings in other worktrees, the `set` subcommand will upgrade your repository config to use worktree-specific config if not already present. The sparsity defined by the arguments to the `set` subcommand are stored in the worktree-specific sparse-checkout file. 

> [!NOTE] See [git-worktree[1]](https://www.git-scm.com/docs/git-worktree) and the documentation of `extensions.worktreeConfig` in [git-config[1]](https://www.git-scm.com/docs/git-config) for more details.

When the `--stdin` option is provided, the directories or patterns are read from standard in as a newline-delimited list instead of from the arguments.

By default, the input list is considered a list of directories, matching the output of `git ls-tree -d --name-only`. This includes interpreting pathnames that begin with a double quote (") as C-style quoted strings. Note that all files under the specified directories (at any depth) will be included in the sparse checkout, as well as files that are siblings of either the given directory or any of its ancestors (see _CONE PATTERN SET_ below for more details). In the past, this was not the default, and `--cone` needed to be specified or `core.sparseCheckoutCone` needed to be enabled.

When `--no-cone` is passed, the input list is considered a list of patterns. This mode has a number of drawbacks, including not working with some options like `--sparse-index`. As explained in the "Non-cone Problems" section below, we do not recommend using it.

Use the `--[no-]sparse-index` option to use a sparse index (the default is to not use it). A sparse index reduces the size of the index to be more closely aligned with your sparse-checkout definition. This can have significant performance advantages for commands such as `git status` or `git add`. This feature is still experimental. Some commands might be slower with a sparse index until they are properly integrated with the feature.

> [!WARNING] Warning
> *Using a sparse index requires modifying the index in a way that is not completely understood by external tools. If you have trouble with this compatibility, then run `git sparse-checkout init --no-sparse-index` to rewrite your index to not be sparse. Older versions of Git will not understand the sparse directory entries index extension and may fail to interact with your repository until it is disabled.*

#### Example

```bash
git sparse-checkout set <MY/DIR1> <SUB/DIR2>
```

- Change to a sparse checkout with all files (at any depth) under `MY/DIR1/` and `SUB/DIR2/` present in the working copy (plus all files immediately under `MY/` and `SUB/` and the top-level directory). 
- If already in a sparse checkout, change which files are present in the working copy to this new selection. 
- Note that this command will also delete all ignored files in any directory that no longer has either tracked or non-ignored-untracked files present.

### Add

Update the sparse-checkout file to include additional directories (in cone mode) or patterns (in non-cone mode). By default, these directories or patterns are read from the command-line arguments, but they can be read from stdin using the `--stdin` option.

#### Example

```bash
git sparse-checkout add SOME/DIR/ECTORY
```

- Add all files under `SOME/DIR/ECTORY/` (at any depth) to the sparse checkout, as well as all files immediately under `SOME/DIR/` and immediately under `SOME/`. 
- Must already be in a sparse checkout before using this command.

### Reapply

Reapply the sparsity pattern rules to paths in the working tree. Commands like merge or rebase can materialize paths to do their work (e.g. in order to show you a conflict), and other sparse-checkout commands might fail to sparsify an individual file (e.g. because it has unstaged changes or conflicts). In such cases, it can make sense to run `git sparse-checkout reapply` later after cleaning up affected paths (e.g. resolving conflicts, undoing or committing changes, etc.).

The `reapply` command can also take `--[no-]cone` and `--[no-]sparse-index` flags, with the same meaning as the flags from the `set` command, in order to change which sparsity mode you are using without needing to also respecify all sparsity paths.

#### Example

```bash
git sparse-checkout reapply
```

- It is possible for commands to update the working tree in a way that does not respect the selected sparsity directories. 
- This can come from tools external to Git writing files, or even affect Git commands because of either special cases (such as hitting conflicts when merging/rebasing), or because some commands didn’t fully support sparse checkouts (e.g. the old `recursive` merge backend had only limited support). 
- This command reapplies the existing sparse directory specifications to make the working directory match.

### Disable

Disable the `core.sparseCheckout` config setting, and restore the working directory to include all files.

#### Example

```bash
git sparse-checkout disable
```

- Repopulate the working directory with all files, disabling sparse checkouts.


### Check Rules

Check whether sparsity rules match one or more paths.

By default `check-rules` reads a list of paths from stdin and outputs only the ones that match the current sparsity rules. The input is expected to consist of one path per line, matching the output of `git ls-tree --name-only` including that pathnames that begin with a double quote (") are interpreted as C-style quoted strings.

When called with the `--rules-file <file>` flag the input files are matched against the sparse checkout rules found in `<file>` instead of the current ones. The rules in the files are expected to be in the same form as accepted by `git sparse-checkout set --stdin` (in particular, they must be newline-delimited).

By default, the rules passed to the `--rules-file` option are interpreted as cone mode directories. To pass non-cone mode patterns with `--rules-file`, combine the option with the `--no-cone` option.

When called with the `-z` flag, the format of the paths input on stdin as well as the output paths are \0 terminated and not quoted. Note that this does not apply to the format of the rules passed with the `--rules-file` option.

#### Example

```bash
git sparse-checkout check-rules
```

## Internals

"Sparse checkout" allows populating the working directory sparsely. It uses the skip-worktree bit (see [git-update-index[1]](https://www.git-scm.com/docs/git-update-index)) to tell Git whether a file in the working directory is worth looking at. If the skip-worktree bit is set, and the file is not present in the working tree, then its absence is ignored. Git will avoid populating the contents of those files, which makes a sparse checkout helpful when working in a repository with many files, but only a few are important to the current user.

The `$GIT_DIR/info/sparse-checkout` file is used to define the skip-worktree reference bitmap. When Git updates the working directory, it updates the skip-worktree bits in the index based on this file. The files matching the patterns in the file will appear in the working directory, and the rest will not.

***

## Appendix: Links and References

*Note created on [[2023-09-09]] and last modified on [[2023-09-09]].*

### Internal Linked Notes

- [[Guide - Using Git Sparse Checkout]]
- [[03 - AREAS/Tools/Tools - Version Control/Git|Git (Tools)]] | [[03 - AREAS/Technology/Programming/DevOps/Version Control/Git|Git (Reference)]]
- [[03 - AREAS/Tools/Tools - Version Control/Github|Github]]
- [[Version Control]]
- [[MOC - Technology|Technology]]
- [[MOC - Development|Development]]
- [[03 - AREAS/Code/Git/_README|Git Code]]

### External References

- *[Git - git-sparse-checkout Documentation (git-scm.com)](https://www.git-scm.com/docs/git-sparse-checkout)*
- *[Using Git Sparse Checkout | Brian Coyner](https://briancoyner.github.io/articles/2013-06-05-git-sparse-checkout/#:~:text=Using%20Git%20Sparse%20Checkout%201%20Step%201%3A%20Create,add%20-f%20origin%20https%3A%2F%2Fgithub.%20com%20%2Fgit%2Fgit.%20git%20)*

#### Backlinks

```dataview
list from [[Git - Sparse Checkout]] AND -"CHANGELOG" AND -"00 - INBOX/Git - Sparse Checkout"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

```bash
mkdir <project> && cd <project>
mkdir -p.git\info\sparse-checkout <path>

```