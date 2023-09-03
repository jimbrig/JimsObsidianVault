---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://azureossd.github.io/2023/02/06/Deploying-Web-App-for-Containers-with-CI-CD-pipelines/index.html
Tags: ["#Type/Highlight/Article"]
Aliases: ["Deploying Web App for Containers With CI/CD Pipelines", "Deploying Web App for Containers With CI/CD Pipelines"]
---
# Deploying Web App for Containers With CI/CD Pipelines

## Metadata
- Author: [[azureossd.github.io]]
- Full Title: Deploying Web App for Containers With CI/CD Pipelines
- Category: #Type/Highlight/Article
- URL: https://azureossd.github.io/2023/02/06/Deploying-Web-App-for-Containers-with-CI-CD-pipelines/index.html

## Highlights
- This post will cover some ways to set up a CI/CD pipeline and deploy your image to Web App for Containers on Azure. ([View Highlight](https://read.readwise.io/read/01gsm5sveq61das3dvxjanfcma))
- You can continuously build and deploy your images to Web App for Containers through GitHub Actions or Azure DevOps pipelines. Through this approach, you can simply push commits to your repository in question - and from there, will kick off the workflows defined below that will automatically build, tag, push and deploy your images to Azure Container Registry and your Web App for Container on Azure. ([View Highlight](https://read.readwise.io/read/01gsm5t1aq4t9yed9dsdsfbqzj))
- **IMPORTANT:** Ensure that App Service Logs are enabled - review [this document on](https://learn.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs#enable-application-logging-linuxcontainer) how to do so. ([View Highlight](https://read.readwise.io/read/01gsm5v7m0x98xra578hpre1cw))
    - Note: https://learn.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs#enable-application-logging-linuxcontainer
- This is important incase the application crashes due to misconfiguration of any of these profilers - given this is all at the application level, we need these logs enabled to see what may have gone wrong. You can view logging in a few ways: ([View Highlight](https://read.readwise.io/read/01gsm5tmm51xe10tkt7fxt6xdf))
