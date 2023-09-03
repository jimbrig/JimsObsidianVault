---
ID: "446318a4-8384-480e-8618-a53431774c7b"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Git - Setting up GitHub Keys.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# Git - Setting up GitHub Keys

*Source: [dev-notes/git-setting-up-github-keys.md at main Â· brotherkaif/dev-notes](https://github.com/brotherkaif/dev-notes/blob/main/git/git-setting-up-github-keys.md)*

## Resources

- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

## Setup

Open a terminal and type this, replacing the email with **yours** (the same one you used to create your [[03 - AREAS/Tools/Tools - Version Control/Github]] account). It will prompt for information. Just press enter until it asks for a **passphrase**:

```bash
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "TYPE_YOUR_EMAIL@HERE.com"
```

**NB:** when asked for a passphrase, put something you want (and that you'll remember), it's a password to protect your private key stored on your hard drive. You'll type, nothing will show up on the screen, **that's normal**. Just type the passphrase, and when you're done, press `Enter`.

Then you need to give your **public** key to GitHub. Run:

```bash
cat ~/.ssh/id_ed25519.pub
```

It will prompt on the screen the content of the `id_ed25519.pub` file. Copy that text, then go to [github.com/settings/ssh](https://github.com/settings/ssh). 

Click on **Add SSH key**, fill in the Title with your computer name, and paste the **Key**.

Finish by clicking on the **Add key** green button.

To check that this step is completed, in the terminal run this. You will be prompted a warning, type `yes` then `Enter`.

```bash
ssh -T git@github.com
```

If you see something like this, you're done!

```bash
# Hi --------! You've successfully authenticated, but GitHub does not provide shell access
```

If it does not work, try running this before trying again the `ssh -T` command:

```bash
ssh-add ~/.ssh/id_ed25519
```

***

## Appendix: Links and References

- [[2022-09-04]]
- [[03 - AREAS/Tools/Tools - Version Control/Git]]

*Backlinks:*

```dataview
list from [[Git - Setting up GitHub Keys]] AND -"Changelog"
```

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022


***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>