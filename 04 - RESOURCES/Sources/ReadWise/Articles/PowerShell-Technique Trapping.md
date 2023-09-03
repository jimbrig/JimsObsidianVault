---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://devdojo.com/hcritter/powershell-technique-trapping
Tags: ["#Type/Highlight/Article"]
Aliases: ["PowerShell-Technique: Trapping", "PowerShell-Technique: Trapping"]
---
# PowerShell-Technique: Trapping

## Metadata
- Author: [[DevDojo]]
- Full Title: PowerShell-Technique: Trapping
- Category: #Type/Highlight/Article
- URL: https://devdojo.com/hcritter/powershell-technique-trapping

## Highlights
- This blog post explains how to use the trap statement in PowerShell to improve error handling, reduce code size, and make scripts more organized and readable. ([View Highlight](https://read.readwise.io/read/01gwx33pc1e9jk5v3752821hqc))
- PowerShell's $trap statement is one of the most underutilized features, in my opinion. It can reduce code size, increase readability, and improve organization in your scripts. In this post, I will demonstrate how to use trapping to respond to errors in a uniform manner and handle different error types. ([View Highlight](https://read.readwise.io/read/01gwx33twn500bw1zbmfpka9gv))
- trap { Write-Error "An error occurred, Error-Message: $($_.Exception.Message)" Write-EventLog -LogName Application -Source MyScript -EventId 1001 -EntryType Error -Message "An error occurred, Error-Message: $($_.Exception.Message)" Break } ([View Highlight](https://read.readwise.io/read/01gwx34151zyk7ka6940ea43q0))
- trap [System.IO.FileNotFoundException] { Write-Error "The specified file or folder could not be found: $($_.Exception.Message)" return 1002 } ([View Highlight](https://read.readwise.io/read/01gwx34kssn686cttz7xj7qs8b))
- In this example, we respond specifically to the System.IO.FileNotFoundException exception type, which is commonly encountered when working with files and folders. We return a unique exit code, 1002, which can be used by monitoring systems or other scripts. ([View Highlight](https://read.readwise.io/read/01gwx34p4pqewkbnd8kpe3gypc))
