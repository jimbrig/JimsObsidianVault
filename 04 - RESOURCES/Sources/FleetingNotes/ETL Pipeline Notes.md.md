---
ID: "8bd3688c-456a-4034-ae66-4e2c36663c98"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "ETL Pipeline Notes.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# ETL Pipeline Notes

![](https://i.imgur.com/N7AQRxE.png)
#### Instrument ETL processes

A key factor in the long-term success and continual improvement of our ETL processes is **instrumentation**.

For each task, we need to be able to âflick an on/off switchâ to start collecting the performance and runtime metrics that will allow us to track the progress of tasks, troubleshoot failures quickly, and establish baselines by which to gauge recent performance compared to past performance.

If the duration of each ETL task is not monitored, then the team will inevitably fail to spot that an ETL job has suddenly, or gradually over time, increased in duration. Clearly, a variability in the data volume must be accounted for, but a measure such as âduration per 1000 recordsâ is something to watch over time to catch performance deterioration.

In addition, itâs important to track the delays between ETL steps, particularly if there are manual or manually-triggered processing steps in the ETL workflow. There is little point in performance-tuning an ETL transform step from 2 minutes down to 40 seconds if the following step is routinely not triggered until 3 or 4 hours have passed because the step is waiting for a member of the overworked team to inspect the output.

There are several possible ways to instrument ETL processes. In the _Resources_ section, you will find articles describing to build instrumentation into SSIS packages, as well describing a tool called **DTLoggedExec**, a separate instrumentation tool for SSIS.

However, a general-purpose ETL instrumentation technique on the Windows platform may just require use of performance counters and PowerShell. This allows existing tools to monitor the progress and behavior of the ETL operation.

*Backlinks:*

```dataview
list from [[ETL Pipeline Notes]] AND -"Changelog"
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