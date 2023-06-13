---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://sgryphon.gamertheory.net/2021/12/10/azure-cli-vs-powershell-vs-arm-vs-bicep/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Azure CLI vs PowerShell vs ARM vs Bicep", "Azure CLI vs PowerShell vs ARM vs Bicep"]
---
# Azure CLI vs PowerShell vs ARM vs Bicep

## Metadata
- Author: [[gamertheory.net]]
- Full Title: Azure CLI vs PowerShell vs ARM vs Bicep
- Category: #Type/Highlight/Article
- URL: https://sgryphon.gamertheory.net/2021/12/10/azure-cli-vs-powershell-vs-arm-vs-bicep/

## Highlights
- Microsoft provides [Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/), the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/), as well as both [Azure Resource Manager (ARM) and the newer Bicep templates](https://docs.microsoft.com/en-us/azure/templates/). There are also third party (and cross-cloud) solutions such as Terraform and Pulumi. ([View Highlight](https://read.readwise.io/read/01gtd6bv5x7v4wq3b9f7rjr3db))
- In the past I have been leaning towards Azure CLI, as I found ARM templates a bit cumbersome, plus my previous experience with migrations vs desired state for database deployments. With Bicep being promoted as a lighter weight alternative I thought I would compare the Microsoft alternatives. ([View Highlight](https://read.readwise.io/read/01gtd6bxm226kqj5t5hw5r27qw))
- My recommendations: ([View Highlight](https://read.readwise.io/read/01gtd6c20e04s61hgw188555ca))
- For incremental development or changing environments, use Azure PowerShell scripts. They allow easy manipulation of parameters, and a migration/scripted approach can handle changes that a desired state/template approach can not.
  • If you are already heavily invested in an alternative scripting system, e.g. Bash, then Azure CLI would be easier to use. ([View Highlight](https://read.readwise.io/read/01gtd6c2qxn8q8ttcb4dahavr6))
- If you have relatively stable infrastructure, such as a preset development environment or sample/demo code, that you want to repeatedly tear down and then recreate the same, then Bicep offers a nicer syntax than raw ARM templates. The deployments are viewable in the Azure portal, but templates do have some limitations compared to scripting. ([View Highlight](https://read.readwise.io/read/01gtd6c4wa6kjxzsh2x4e1a7r4))
- In either case, follow the Azure [Cloud Adoption Framework naming guidelines](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming), allowing for unique global resources, as well as the associated tagging guidelines. ([View Highlight](https://read.readwise.io/read/01gtd6c6j85fkv23qtjcn956e1))
- Example code is available on Github at [https://github.com/sgryphon/azure-deployment-examples](https://github.com/sgryphon/azure-deployment-examples) ([View Highlight](https://read.readwise.io/read/01gtd6c8nfr871nd932axx3vmb))
- The examples follow the recommended [Cloud Adoption Framework naming guidelines](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming), with an additional organisation / subscription identifier used in global scope names to make them unique. ([View Highlight](https://read.readwise.io/read/01gtd6cb5f9a5wq9hvj0bwd4pg))
- Migrations vs desired states ([View Highlight](https://read.readwise.io/read/01gtd6cq05vp62k4b6ccjsd7rg))
- Using scripts (migrations) to deploy infrastructure allow for incremental change. This can be important where a state-based solution can not handle the desired change. ([View Highlight](https://read.readwise.io/read/01gtd6cryaj85r9a0rp7tpver4))
- A similar situation exists with database deployments, where while desired state tools exist the problems with them have led to [migration](https://en.wikipedia.org/wiki/Schema_migration) based tools such as [DbUp](https://dbup.readthedocs.io/en/latest/philosophy-behind-dbup/). ([View Highlight](https://read.readwise.io/read/01gtd6ct72g8qf9v6y0cvgd5sz))
- State based solutions, like Bicep or ARM templates, attempt to take the current state of infrastructure, compare it to the desired or ideal state (in the template file), try and work out what the differences are, and then make those changes. ([View Highlight](https://read.readwise.io/read/01gtd6cw8832vam1hdax8erw73))
- For example suppose you want to split one data blob into two new ones (and remove the old); you can't do this in a single template, as deploying in complete mode will remove the old blob before the data is copied. A single script can do the create, copy, and then delete operations. ([View Highlight](https://read.readwise.io/read/01gtd6d3wks9d7hgc7nxmw4qfq))
- There are also some properties that can only be set at creation, so changing them in a template has no effect (or generates an error). A script could create a brand new resource, copy across all the settings, change any references, and then remove the old. ([View Highlight](https://read.readwise.io/read/01gtd6d5c05ev91dr3r3qxqpj6))
- Both Azure PowerShell and Azure CLI commands are (mostly) idempotent, so they can be re-run as needed. However a real migration solution usually needs some kind of journal ability, so that it knows which scripts have run (in a target environment), and only needs to run any new scripts. ([View Highlight](https://read.readwise.io/read/01gtd6d621prc724yxx93nwdpp))
- For database deployment this is usually some kind of journal table, although I have seen other solutions (e.g. site attributes in SharePoint). Maybe resource group tags could be used to record what version migrations are up to. ([View Highlight](https://read.readwise.io/read/01gtd6d7eed0mbwrr4n74k5nf6))
- Hybrid solutions ([View Highlight](https://read.readwise.io/read/01gtd6d9qjjvr7cksrw56dh47z))
- Template solutions work best when they need to be deployed from scratch (not incremental), and offer some benefits as they are reported in the Azure Portal, and can run independent components in parallel. ([View Highlight](https://read.readwise.io/read/01gtd6dacmm64ffn396ey7vwce))
- There are also a lot of pre-written example templates available from Microsoft. ([View Highlight](https://read.readwise.io/read/01gtd6dbjwccccv181n720pjxn))
- One potential approach may be a hybrid approach, where the primary system is scripting (e.g. PowerShell), but the initial deployment of resources are done as a series of templates. ([View Highlight](https://read.readwise.io/read/01gtd6dc1s05a9m83nra5xp32f))
- The scope of each script can be kept small, either one or a small number of resources, deployed at first via a template. If using a migrations journal, this template will only be deployed once per environment. ([View Highlight](https://read.readwise.io/read/01gtd6dczjpb2q2kehjpb5tcvp))
- Instead of changing the template, subsequent scripts use direct PowerShell to manipulate the resource (or deploy a new template over the top). ([View Highlight](https://read.readwise.io/read/01gtd6dddp4xk8skeb78brcmsk))
- Recommendations ([View Highlight](https://read.readwise.io/read/01gtd6dfvbwcpdvk1sh5ws8v96))
- Scripted migrations still seem the easiest approach to me, particularly because while templates seem easy at first (like database desired state) they eventually run into a situation too complex to handle, and are very difficult to debug as you don't know the internal state. ([View Highlight](https://read.readwise.io/read/01gtd6dggs4x4fng1mwxwq0mhr))
- Templates do have benefits — syntax support, visibility in the portal, parallel deployment, dependency management, and easy repeatable deployment from an empty state — but without a way to overcome eventual problems I think using scripts from the beginning is safer. ([View Highlight](https://read.readwise.io/read/01gtd6dhmpeda0jekqyta21rpd))
- For a small project (maybe some example code) a single script that simply does all the steps is sufficient. ([View Highlight](https://read.readwise.io/read/01gtd6dj6j5f89tr2xtcntxvhg))
- For a more complex project, you should consider a generic deployment script that simply runs all the scripts in a sub-folder. This is a bit nicer with multiple developers as they are adding independent scripts, rather than all trying to edit the same one, which makes merging easier. ([View Highlight](https://read.readwise.io/read/01gtd6dk3qr4hycd2yrvys4846))
- It also makes code reviews easier if following best practices for migrations where you only ever add new migrations, and never change old ones (that will have been run as is in other environments). These is a similar solution to what is used for database migrations. ([View Highlight](https://read.readwise.io/read/01gtd6dmyn6ehtw7c4njf0y5tg))
- Scripted migrations may even consider hybrid approaches in some cases, getting some benefit from editor syntax support, parallel resource creation, and visibility in the portal. ([View Highlight](https://read.readwise.io/read/01gtd6dnngavvcb5w2ngpfhad7))
