---
Date: 2023-06-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Terraform Project Structure

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

## Basic Concepts and File Types

Any Terraform project is created to manage infrastructure in the form of code i.e., IaC. Managing the Terraform IaC deals with the following at the least.

1. The cloud platform of choice, which translates to the appropriate provider configurations.
2. Various resources, i.e., cloud components.
3. State file management.
4. Input and output variables.
5. Reuse of modules and associated internal wiring.
6. Infrastructure security standards.
7. Developer collaboration and CI/CD workflow.

To begin writing a Terraform configuration while adhering to the best practices, we create the **files** below in the project’s root directory.

1. **provider.tf** – containing the terraform block, s3 backend definition, provider configurations, and aliases.
2. **main.tf** – containing the resource blocks which define the resources to be created in the target cloud platform.
3. **variables.tf** – containing the variable declarations used in the resource blocks.
4. **output.tf** – containing the output that needs to be generated on successful completion of “apply” operation.
5. **[*.tfvars](https://spacelift.io/blog/terraform-tfvars)** – containing the environment-specific default values of variables.


The files are not required to have the exact same names listed above. However, these are general conventions used in Terraform projects. Scenarios which need additional files are not surprising. For example, if the Terraform project is created to manage many resources, then many lines of code are included in the main.tf file – thus making it difficult to navigate.

There are multiple ways to supply the values for variables using .tfvars, apart from supplying them as CLI arguments and [environment variables](https://spacelift.io/blog/terraform-environment-variables). Terraform loads the values from the terraform.tfvars file by default.

Similar behavior is achieved by using custom file names with *.auto.tfvars extension. However, for any other file name, it has to be passed explicitly using -var-file argument in the CLI.

The order of precedence between these files is as shown below.

**Terraform.tfvars > *.auto.tfvars  > custom_file_name**

The screenshot below shows the directory structure of a Terraform project when we start writing the configurations for the first time.

![](https://i.imgur.com/0ArYTul.png)

In such situations, it may make sense to consolidate various components depending on a certain pattern. A couple of examples of slicing the main.tf files are:

1. **By services** – the team may include all the components required to support a particular business service in one file. This file includes all the databases, compute resources, network configs, etc., in a single file. The file is named as per the service being supported. Thus, while doing the root cause analysis (RCA), we already know which Terraform file needs to be investigated.
2. **By components** – it may be decided to segregate the resource blocks based on the nature of the components used. A Terraform project may have a single file to manage all the databases. Similarly, all network configurations, compute resources, etc., are managed in their individual files.

Note that Terraform does not interpret the .tf files included in the sub-directories. This takes us to the discussion of modules, which we will discuss later in this post. Irrespective of how the Terraform source code is segregated, the intention behind this should be to enable easy analysis and navigation.

One of the advantages of using Terraform to manage infrastructure is consistency. Owing to this, [multiple Terraform environments](https://spacelift.io/blog/terraform-environments) are spun using the same project source code. This makes it easy to create sub-production and ephemeral environments, identical copies of the production. The sub-production environments are usually scaled-down versions of the production. 

This variation is achieved using variables in the variables.tf file. .tfvars files are used to specify the scale of any environment. Thus it is also common to have multiple .tfvars files alongside the rest of the Terraform configs.

For example, if we have to create three environments – prod, qa, and dev, then the following three .tfvars files are created with clear names.

1. variables-dev.tfvars
2. variables-qa.tfvars
3. variables-prod.tfvars

Multiple environments are usually managed using [workspaces in Terraform](https://spacelift.io/blog/terraform-workspaces). Depending on the workspace being used the appropriate .tfvars file needs to be used – a manual error here can be risky. Spacelift provides a way to manage workspaces in the form of stacks. A set of environment variables defined in context are associated with each stack. This reduces the risk and promotes the reusability of variable values.

***

## Appendix: Links and References

*Note created on [[2023-06-07]] and last modified on [[2023-06-07]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Terraform Project Structure]] AND -"CHANGELOG" AND -"//Terraform Project Structure"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

