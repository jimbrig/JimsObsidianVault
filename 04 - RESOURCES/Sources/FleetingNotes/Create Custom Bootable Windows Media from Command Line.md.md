---
ID: "fa794e74-3802-4da8-b7fc-957d5637ac7a"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Create Custom Bootable Windows Media from Command Line.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Format", "Copy"]
Aliases:
  - "<% tp.file.title %>"
---


# Create Custom Bootable Windows Media from Command Line
*Source: [Create Bootable USB For Windows 10 Install.wim Larger Than 4GB (winaero.com)](https://winaero.com/create-bootable-usb-for-windows-10-install-wim-larger-than-4gb/)*

## Contents

- [[#Format Flash Drive with Diskpart|Format Flash Drive with Diskpart]]
- [[#Copy Windows Setup Files|Copy Windows Setup Files]]


## Format Flash Drive with Diskpart

Using Windows' `diskpart` shell, run the following commands against a USB stick:

```powershell
diskpart # enters diskpart shell

# find the disk # for the USB
list disk

# select it
select disk 1

# erase drive contents
clean

# create a new 1GB partition
create partition primary size=1000

# create additional primary partition using remaining space
create partition

# select the first partition
select partition 1

# format as FAT32
format fs=fat32 quick

# assign drive letter
assign letter=x

# make it bootable
active

# select second partition
select partition 2

# format as NTFS
format fs=ntfs quick

# assign drive letter
assign letter=y

# exit
exit
```

You are done with the flash drive layout. The `drive X:` is a bootable small partition, and the `drive Y:` is a large NTFS partition to host the `install.wim` file.Â  Now, let's copy Windows files properly.

![](https://i.imgur.com/ZxuMyKV.png)

## Copy Windows Setup Files

1. Open your Windows setup files in File Explorer.
2. Copy everything except the `sources` folder to the `X: drive` (the FAT32 one).
3. Copy the sources folder to the `Y: drive` (the NTFS partition).
4. On the X: partition, create a new `sources` directory. It will contain a single file, `boot.wim`.
5. Copy `boot.wim` from `Y:\sources` to `X:\sources`.
6. In the `Y:\sources` folder, create a new text file with the following contents:

```
[CHANNEL]  
 Retail
```

7.  Save it as `ei.cfg`

You are done. We have created 2 partitions: A FAT32 partition (X:) and an NTFS partition (Y:). We have placed the `sources` folder on `Y:`. On `X:` we store everything else of the original distro. We have also created a new `sources` folder on `X:` with a single file `BOOT.WIM`. The last step is required to start the setup program when booting from our USB drive.

Now you will be able to install Windows using the flash drive you just created without reducing the install.wim file size. This is useful when you have a customized large `install.wim` file.

*Backlinks:*

```dataview
list from [[Create Custom Bootable Windows Media from Command Line]] AND -"Changelog"
```

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