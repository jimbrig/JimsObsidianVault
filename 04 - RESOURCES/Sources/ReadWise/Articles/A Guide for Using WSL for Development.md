---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/d135670313a6
Tags: ["#Type/Highlight/Article"]
Aliases: ["A Guide for Using WSL for Development", "A Guide for Using WSL for Development"]
---
# A Guide for Using WSL for Development

## Metadata
- Author: [[Janel Brandon]]
- Full Title: A Guide for Using WSL for Development
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/d135670313a6

## Highlights
- From now on, do all of your work from the directory link created in number 5 above, or some other linked Windows directory in your WSL environment. If you do that, even if you have to reinstall the WSL, you won’t lose any work!
- Get into the habit of opening your WSL, change directory to the linked directory — in our example ‘cd ~/projects’, and then to some subdirectory of that linked directory where you are doing your work, and launch VS code from there with: code .
- 7. If you use SSH, use the same keys from your Windows and WSL environment
- If you have already generated and are using ssh keys from your Windows environment, you can copy them into your WSL home directory like this:
- b. Copy the keys from your Windows user home directory to your WSL user home directory. In the command below substitute your Windows user name for <your windows user name here>:
- cp -r /mnt/c/Users/<your windows user name here>/.ssh ~/.
- c. Remove read/write permissions from the private key (this assumes your private key is named id_rsa. If it isn’t, replace it in the command below)
- chmod 700 ~/.ssh/id_rsa
- Create a script for all of the things you are installing in WSL to support development
- touch /mnt/c/projects/wsl_setup.sh
- Create a script file in your mounted Windows drive called wsl_setup.sh:
- Give it execute permission:
- chmod 755 /mnt/c/projects/wsl_setup.sh
