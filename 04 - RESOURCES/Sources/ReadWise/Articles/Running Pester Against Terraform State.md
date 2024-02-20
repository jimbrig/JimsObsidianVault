---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/5dc3d8868d9
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Running Pester Against Terraform State
  - Running Pester Against Terraform State
---
# Running Pester Against Terraform State

## Metadata
- Author: [[Paul Mackinnon]]
- Full Title: Running Pester Against Terraform State
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/5dc3d8868d9

## Highlights
- the state files for Terraform are kept in Azure storage account in a container called tfstate; however these practices could be altered and applied anywhere.
- Create a service connection linking to your subscription, using the naming convention sub-<last-12-digits-of-sub-id>
- Create an Agent pool
- Create a Personal Access Token that has the following rights; Agent Pools (Read & manage)
- Create a backend storage account and key vault to store the state files and subscription credential secrets.
