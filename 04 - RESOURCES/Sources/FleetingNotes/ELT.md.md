---
ID: "af5b6763-4d67-4d1c-9ad2-50cc7b500bd1"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "ELT.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2022-01-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "ELT"
---

# ELT

In addition to the order of the processes (i.e transformation coming after the loading) in ELT, surprisingly, there are several key differences that separate the ELT from the usual ETL pipeline.

![](https://i.imgur.com/ke9C4DY.png)

![](https://i.imgur.com/2UdxAue.png)

ELT has been more and more popular these days, thanks to the emergence of Cloud Storage and Database As Services (DBaaS) which provide high scalability, availability and fault-tolerant repository.

In a more advanced ETL/ELT process, tools such as [Apache Spark](https://spark.apache.org/), [Apache Kafka](https://kafka.apache.org/), [Apache Airflow](https://airflow.apache.org/), etc are usually employed for better performance and efficiency of the pipeline. In our next article, we will employ these frameworks for another ETL process. So stay tuned for that!

## Appendix: Links

- [[ELT]]
- [[Data Warehouse]]
- [[ETL Data Warehousing Best Practices]]
- [[Data Warehousing Concepts and Definitions]]
- [[Databases]]

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