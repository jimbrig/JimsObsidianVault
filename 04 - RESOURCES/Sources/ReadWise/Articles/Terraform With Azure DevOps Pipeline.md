---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://purple.telstra.com/blog/terraform-with-azure-devops-pipeline
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Terraform With Azure DevOps Pipeline
  - Terraform With Azure DevOps Pipeline
---
# Terraform With Azure DevOps Pipeline

## Metadata
- Author: [[Santhosh Kumar]]
- Full Title: Terraform With Azure DevOps Pipeline
- Category: #Type/Highlight/Article
- URL: https://purple.telstra.com/blog/terraform-with-azure-devops-pipeline

## Highlights
- Terraform uses modules, in the ARM template called Nested template. This is required to call another template for deploying a particular resource. ([View Highlight](https://read.readwise.io/read/01gtd6n98mnymdpjdk3fsc9t0z))
- Terraform init -- This command looks through all of the *.tf files in the current working directory. It automatically downloads any of the providers (Azure or AWS) required for them to provision infrastructure. ([View Highlight](https://read.readwise.io/read/01gtd6nc6jp6v6d9qqsmb8gdp9))
- Terraform plan -- This command determines what actions are necessary to achieve the desired state specified in the configuration files. This is a dry run and shows which actions will be made. ([View Highlight](https://read.readwise.io/read/01gtd6ndbrtn0rechmrxzbny5a))
- Terraform apply - auto-approve -- This will create resources as per config file and create Tfstate file which created on the above command, with auto-approval and not prompt for interactive approval for deploy. ([View Highlight](https://read.readwise.io/read/01gtd6ndyj5srff33d6yr3gemc))
- Terraform destroy -- This will destroy the configuration created based on the tfstate file. ([View Highlight](https://read.readwise.io/read/01gtd6nf9bygepjs32wvkwja7y))
