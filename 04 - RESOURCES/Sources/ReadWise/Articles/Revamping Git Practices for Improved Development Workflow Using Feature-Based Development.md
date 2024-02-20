---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/b1ca7a9c7101
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - "Revamping Git Practices for Improved Development Workflow: Using Feature-Based Development"
  - "Revamping Git Practices for Improved Development Workflow: Using Feature-Based Development"
---
# Revamping Git Practices for Improved Development Workflow: Using Feature-Based Development

## Metadata
- Author: [[Basit Raza]]
- Full Title: Revamping Git Practices for Improved Development Workflow: Using Feature-Based Development
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/b1ca7a9c7101

## Highlights
- In this article, I will walk you through how we improved our Git practices to better manage our development workflow.
- Before delving into the specifics of software development approaches, it’s important to understand the two main methodologies: trunk-based development and feature-based development.
- Trunk-Based Development VS Feature-Based Development
- Trunk-based development is a continuous integration approach where developers work on a single shared branch, pushing changes as they complete them. This approach emphasizes collaboration and frequent integration to ensure a stable and functioning codebase.
- Feature-based development, on the other hand, involves creating separate branches for each feature or task. This approach allows for parallel development and isolated testing of each feature before merging them back into the main branch.
- Code Review & Merging a Feature Branch
- In the feature-based workflow, the developer creates a merge request when the feature development is complete. This request is then reviewed by the necessary stakeholders, which could include other developers, QA testers, and project managers. Depending on company policy, there might be a code review process before merging the feature branch into the main branch.
- Completely Isolate Environment
- In our feature-based development, developers never push code changes directly to the main branch. Instead, each feature is developed on its own branch and tested independently before being merged back into the main branch. This helps to minimize conflicts and maintain a stable and functional codebase.
- Feature-based workflows favor less-experienced or less-senior team members. They can work on their features without worrying about breaking the production code. A tech lead, QA, or any development team member can test the build for each pull request (PR).
- Releasing a New Feature to End-Users
- Once a feature has been developed and reviewed, it moves through a development pipeline consisting of the feature branch, staging, and production. The feature branch is merged with the staging branch for further testing, and then merged with the production branch for release to end-users. This ensures that each feature is thoroughly tested and integrated into the existing codebase before being released to users.
- Feature Branch ➜ Staging ➜ Production
- Managing Large-Scale Feature-Based Development with Effective CI/CD Pipelines
- While feature-based development is an efficient way to manage multiple features concurrently, it can become challenging when dealing with a large number of features. By implementing the robust CI/CD pipelines we were able manage a large number of features concurrently while ensuring that each feature is thoroughly tested and integrated into the existing codebase before release.
- Consistent Naming Convention For Feature Branches
- In a feature-based workflow, it’s important to have a consistent naming convention for feature branches. Typically, all feature branches start with a specific keyword, such as “feature/,” which signals to the CI/CD pipeline to build the branch. For example, a feature branch for a new login page might be named “feature/<feature-number>”, Both frontend & backend branching used this convension and there corresponding CI/CD pipelines triggered and create build artifacts.
- Release Pipeline for Frontend Feature Deployment
- The release pipeline for frontend application e.g. Angular involves creating folders in the serving directory of the web server such as Nginx or Apache. These folders correspond to the different features being developed, e.g., /var/www/html/projectName/frontend/0001/ /var/www/html/projectName/frontend/0002/ and so on.
- Release Pipeline for Backend Feature Deployment
- When a feature build is complete, it triggers the release pipeline, which performs several tasks to ensure the feature is released correctly. These tasks include:
- Identifying the name of the branch that was built for the feature.
- Determining the associated port number for the feature. This information is typically stored in a configuration file.
- Starting the application for the feature on the assigned port number. This ensures that the feature is available for testing and review by the development team.
- The number of features that can be supported depends on the server capacity and the resources required for each feature. If the backend is compute-intensive, more compute power will be needed to support a larger number of features.
- In conclusion, feature-based development can be a powerful strategy for managing complex projects with multiple developers and concurrent features. However, it requires careful planning and efficient resource management to ensure that the development process and CI/CD pipeline can handle a large number of features simultaneously. With the right approach and infrastructure, feature-based development can improve development speed, collaboration, and quality, resulting in a more efficient and successful software development process.
