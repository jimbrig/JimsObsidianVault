---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://purple.telstra.com/blog/using-saved-credentials-securely-in-powershell-scripts
Tags: ["#Type/Highlight/Article"]
Aliases: ["Using Saved Credentials Securely in PowerShell Scripts", "Using Saved Credentials Securely in PowerShell Scripts"]
---
# Using Saved Credentials Securely in PowerShell Scripts

## Metadata
- Author: [[David Lee]]
- Full Title: Using Saved Credentials Securely in PowerShell Scripts
- Category: #Type/Highlight/Article
- URL: https://purple.telstra.com/blog/using-saved-credentials-securely-in-powershell-scripts

## Highlights
- One of the most common tasks out in the field is the need to run PowerShell scripts that require credentials to be saved in some form of another so that they can be fed into scripts to be executed autonomously. This is particularly common in cloud environments where the current user context in which the scripts are run (e.g. within a scheduled task) are insufficient or not appropriate for the remote execution. Office 365 management is a perfect example of this, where often a credential object must be passed in order to connect and execute the cmdlets. ([View Highlight](https://read.readwise.io/read/01gtd6rjxjvwksp7r3zpkxhj09))
- From that perspective your process to have a PowerShell script with a secure ‘saved’ password would be as follows: ([View Highlight](https://read.readwise.io/read/01gtd6svy9y4pe43696sggmstr))
- Run the Get-Credential command to prompt an administrator to provide the credentials they wish to save ([View Highlight](https://read.readwise.io/read/01gtd6sx10e4p90kr0a3d79vjg))
- Convert the secure-string object that is part of that credential object into a text string (which is now encrypted) and store that in a file ([View Highlight](https://read.readwise.io/read/01gtd6t1krpx8jafc582ravy0k))
- For scripts that need the saved credentials, read in the file, decrypt the string and recreate the credential object and feed to the appropriate cmdlets. ([View Highlight](https://read.readwise.io/read/01gtd6t7j80x48wbwkba7jqv21))
- The script that runs and reads the saved credentials, must be run on the same machine and in the same user context. ([View Highlight](https://read.readwise.io/read/01gtd6tcgtz2s59rhpdp8v5gnk))
- This means you can’t just copy the ‘saved credential’ file to other machines and reuse it. ([View Highlight](https://read.readwise.io/read/01gtd6tdecfpd8m3gkzy34ze1h))
- In the scenario where your scripts are run as scheduled tasks under a service account, be aware that in order to prompt an admin to provide the credentials in the first place, the service account requires ‘Interactive’ ability. This means the service account, at least temporarily, needs ‘log on locally’ to give you that interactive session. ([View Highlight](https://read.readwise.io/read/01gtd6teb0bbqxs904hjknmt71))
- In order for DAPI to work, the GPO setting **Network Access: Do not allow storage of passwords and credentials for network authentication** must be set to **Disabled** (or not configured). Otherwise the encryption key will only last for the lifetime of the user session (i.e. upon user logoff or a machine reboot, the key is lost and it cannot decrypt the secure string text) ([View Highlight](https://read.readwise.io/read/01gtd6tfvn4qrm4k7jkxnvs9tf))
