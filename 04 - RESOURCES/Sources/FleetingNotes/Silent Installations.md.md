---
ID: "4b7ee222-fb16-41f1-9ee6-261cdecf6983"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Silent Installations.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev", "Overview", "Resources", "Finding", "Find", "Use", "Universal", "Extract", "Last"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2022-02-04
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Silent Installations"
---

# Silent Installations

## Contents

- [[#Overview|Overview]]
- [[#Resources|Resources]]
- [[#Finding Install Parameters|Finding Install Parameters]]
	- [[#Find Silent Install Parameters With the Usage Statement|Find Silent Install Parameters With the Usage Statement]]
	- [[#Use Google To Find Silent Install Parameters|Use Google To Find Silent Install Parameters]]
	- [[#Universal Silent Switch Finder (ussf)|Universal Silent Switch Finder (ussf)]]
	- [[#Extract Executables With 7-Zip|Extract Executables With 7-Zip]]
	- [[#Last but not Least|Last but not Least]]


## Overview

A silent install is the [installation](https://techterms.com/definition/install) of a software [program](https://techterms.com/definition/program) that requires no user interaction. It is a convenient way to streamline the installation process of a desktop [application](https://techterms.com/definition/application). Silent installs are performed by many legitimate software programs, but they are also used by [malware](https://techterms.com/definition/malware) and [PUPs](https://techterms.com/definition/pup) to hide the installation process from the user.

A typical [installer](https://techterms.com/definition/installer) has several parameters that instruct the installer how to run. Examples include where the program should be installed, if a shortcut should be placed on [desktop](https://techterms.com/definition/desktop), and if additional components should be installed. In a non-silent or "attended installation," the user is prompted to select or confirm these options during the installation process. In a silent install, these items are selected automatically and the installer runs from start to finish without requiring any user input.

Silent installs are useful for simple programs that have limited installation options. They are also helpful for installing software on several machines at once. For example, a [network](https://techterms.com/definition/network) administrator may prefer to distribute a software program via a silent installer to ensure all users within the network have the same installation settings. Even though silent installers run without any user interaction, legitimate programs typically require you to manually initiate the installation process.

While silent installations are used for many good reasons, some programs, such as [spyware](https://techterms.com/definition/spyware) and [adware](https://techterms.com/definition/adware) use silent installers to run without your knowledge. These types of programs may even run without you initiating the installation process. They may be tacked on to another installer or executed by a malicious file, such as [virus](https://techterms.com/definition/virus).

## Resources

- [silent-install.net [silent-install.net]](https://silent-install.net/)
- [Silent Install HQ â Silent Install & Command Line Switch Knowledge Base](https://silentinstallhq.com/)
- [Silent Install Builder](https://www.silentinstall.org/)

The best resource to find relevant silent installation commands and parameters is [silent-install.net](https://silent-install.net/):

![](https://i.imgur.com/7J5SgCQ.png)


## Finding Install Parameters

### Find Silent Install Parameters With the Usage Statement

Displaying the usage statement is my go-to method for finding silent installation parameters. The problem is that not all EXE files are created equal, and not all EXE files include a usage statement. Thankfully, viewing the usage statement, if one exists, is pretty straightforward. Here are a couple of different methods you can use to view the usage statement.

The first, and my preferred method is to drag the executable file into the Run window. Open the folder containing the EXE file and launch the Run window by typing **run** into the Windows 10 search bar and hitting enter. Next, drag the EXE file into the **Open** field of the Run window. Doing so will bring up the path to the executable. Add **/?** to the end of the path, making sure to include the space before the backslash and click **OK**.

```powershell
setup.exe /?
```

![](https://i.imgur.com/phnPNS0.png)

### Use Google To Find Silent Install Parameters

Is there anything Google canât do? Probably, but the list of things it canât do gets shorter and shorter every day. Today, it informed me how many licks it takes to get to the center of a Tootsie Pop. If you were wondering, it takes 364 licks. It can also be a good source of information for install parameters. Simply search Google for âsilently install _(application_name)_â and youâll find loads of information to help you out. As an example, I searched for â[silently install Firefox](https://www.pdq.com/blog/how-to-install-firefox-silently/),â which lead me to [this support page](https://support.mozilla.org/en-US/kb/silently-install-uninstall-firefox-enterprise), which contained this information:

![](https://i.imgur.com/N4xpLOQ.png)

### Universal Silent Switch Finder (ussf)

*See Also: [[Universal Silent Switch Finder]]*

[Universal Silent Switch Finder](https://www.softpedia.com/get/System/Launchers-Shutdown-Tools/Universal-Silent-Switch-Finder.shtml) (USSF) is about as accurate a program name as Iâve ever seen. Â  If you havenât guessedÂ  already, Universal Silent Switch Finder attempts to detect the silent switch or parameter for an executable. Simply launch the program and point it to an executable file, and itâll take care of the rest.

Full disclaimer, Iâve had mixed results using USSF. Some apps simply donât have a silent switch option, in which case USSF was never going to find anything. Another possible explanation for my mixed results could be that USSF hasnât been updated in quite some time. Regardless, when you need to find a silent parameter, and youâve already tried the other resources, USSF is worth a shot.


### Extract Executables With 7-Zip

One more option when finding silent parameters is to extract the executable using 7-Zip to see if any other MSI or EXE files within the executable can help us get the [application installed](https://www.pdq.com/blog/how-to-show-computers-that-do-not-have-a-particular-application-installed/) silently. If you have 7-Zip installed, you can explore the contents of an executable by right-clicking on the EXE file and selecting 7-Zip > Open archive.

### Last but not Least

If youâve exhausted all of your resources and still canât find a silent install option for an application you need to deploy, there is a last resort option you can consider.Â  [[AutoHotKey]] is an application that can automate tasks by mimicking clicks and button presses. It can launch EXE files minimized and still run through interactive menus without requiring user interaction. This process is scripted in AutoHotKey, after which it can be deployed to end-users.Â 

Again, this is a last resort option. If youâre not familiar with AutoHotKey, things can go south quickly if the script you deploy isnât perfect. Check out [this video](https://youtu.be/aeTUKRAAh1E) to learn more about AutoHotKey and see this process in action.

*Backlinks:*

```dataview
list from [[Silent Installations]] AND -"Changelog"
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