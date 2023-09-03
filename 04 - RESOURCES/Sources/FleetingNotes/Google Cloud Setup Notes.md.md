---
ID: "ef4679de-c8cd-4fb2-ad05-ab7c74edb5a3"
Date Created: "2023-03-22"
Date Modified: "2023-03-22"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Google Cloud Setup Notes.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Development", "Development/Cloud"]
Aliases:
  - "<% tp.file.title %>"
---

---
Creation Date: 2021-05-02 19:42
Last Modified Date: Wednesday 4th August 2021 19:54:37
Author: Jimmy Briggs <jimbrig1993@outlook.com>
Alias: Google Cloud Setup Notes
Tags: [ "#Development", "#Development/Cloud" ]
---



# Google Cloud Setup Notes

## Environment Setup and Configuration

1. In the [Google Cloud Console](https://console.cloud.google.com/), select or create a GCP project.
   - [Project Selector Page](https://console.cloud.google.com/projectselector2/home/dashboard?_ga=2.153494008.1742946965.1610938789-26772365.1609112598)
2. Ensure [Billing is Enabled](https://cloud.google.com/billing/docs/how-to/modify-project) for the project.
3. [Enable the Cloud Run API](http://console.cloud.google.com/apis/library/run.googleapis.com?_ga=2.220194521.1742946965.1610938789-26772365.1609112598).
4. [Install and Initialize `gcloud` SDK](https://cloud.google.com/sdk/docs/) on local machine.
   - On windows run, `cinst gcloud` if using Chocolatey.
   - Update components via `gcloud components update`
5. Authenticate GCP (two methods):
   - Using a dedicated `service account`

***

Links: [[Google Cloud Platform - GCP]] | [[Cloud Hosted Environments]]

Sources:



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