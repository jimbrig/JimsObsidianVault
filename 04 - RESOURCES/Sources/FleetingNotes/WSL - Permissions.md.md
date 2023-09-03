---
ID: "d6cb64e5-9e34-4e85-84de-d9880b871d86"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "WSL - Permissions.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Windows/WSL"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-08-19 16:10
Last Modified Date: Thursday 19th August 2021 16:10:31
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: WSL - Permissions
Tags: ["#Windows/WSL", "Windows/Setup", "Windows/Tips"]
---

# WSL - Permissions

## SSH

```bash
mv ~/.ssh/* /mnt/c/Users/jimmy/.dotfiles/wsl/ssh/
cd ~/.ssh
ln -s /mnt/c/Users/jimmy/.dotfiles/wsl/ssh/* .
```

Now change permissions:

```bash
sudo chmod 644 id_rsa.pub
sudo chmod 600 id_rsa
sudo chmod 644 known_hosts
cd ../
sudo chmod 700 .ssh/
```

***

Links: [[SSH]] | [[WSL-Notes]] | [[Windows]] | [[Windows Subsystem for Linux (WSL)]]

Sources:



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