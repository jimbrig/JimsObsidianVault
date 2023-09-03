---
ID: "21892e89-eff1-41d3-a211-7c005a4762cb"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Dimensional Modeling.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev/Data", "Overview", "Description", "Design", "Choose", "Declare", "Identify", "Identify", "Appendix", "Types"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2022-01-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/Data"]
Alias: "Dimensional Modeling"
---

# Dimensional Modeling

*Source: [Dimensional modeling - Wikipedia](https://en.wikipedia.org/wiki/Dimensional_modeling)*

## Contents

- [[#Overview|Overview]]
- [[#Description|Description]]
- [[#Design|Design]]
	- [[#Choose the Business Process|Choose the Business Process]]
	- [[#Declare the Grain|Declare the Grain]]
	- [[#Identify the Dimensions|Identify the Dimensions]]
	- [[#Identify the Facts|Identify the Facts]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

> âDimensions in data management and data warehousing contain relatively static data about such entities as geographical locations, customers, or products. Data captured by Slowly Changing Dimensions (SCDs) change slowly but unpredictably, rather than according to a regular scheduleâ â Wikipedia.

**Dimensional modeling** (**DM**) is part of the *[Business Dimensional Lifecycle](https://en.wikipedia.org/wiki/The_Kimball_Lifecycle "The Kimball Lifecycle")* methodology developed by [[Ralph Kimball]] ([wiki](https://en.wikipedia.org/wiki/Ralph_Kimball "Ralph Kimball")) which includes a set of methods, techniques and concepts for use in [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse") design.

The approach focuses on identifying the key [business processes](https://en.wikipedia.org/wiki/Business_process "Business process") within a business and modeling and implementing these first before adding additional business processes, as a [bottom-up approach](https://en.wikipedia.org/wiki/Top-down_and_bottom-up_design "Top-down and bottom-up design").

An alternative approach from [[Bill Inmon]] ([wiki](https://en.wikipedia.org/wiki/Bill_Inmon "Bill Inmon")) advocates a top down design of the model of all the enterprise data using tools such as [entity-relationship modeling](https://en.wikipedia.org/wiki/Entity-relationship_model "Entity-relationship model") (**ER**).

## Description

To understand Dimensional Modeling, one must first become familiar with the concepts of **facts (measures)** and **dimensions (context)**.

- Facts are typically (but not always) numeric values that can be aggregated
- Dimensions are groups of hierarchies and descriptors that define the facts. 

For example, sales amount is a fact; timestamp, product, register number, store number, etc. are elements of dimensions. 

Dimensional models are built by business process area, e.g. store sales, inventory, claims, etc., because the different business process areas share some but not all dimensions, efficiency in design, operation, and consistency, is achieved using [conformed dimensions](https://en.wikipedia.org/wiki/Dimension_(data_warehouse)#Types "Dimension (data warehouse)"), i.e. using one copy of the shared dimension across subject areas.

## Design

The dimensional model is built on a [star-like schema](https://en.wikipedia.org/wiki/Star_schema "Star schema") or [snowflake schema](https://en.wikipedia.org/wiki/Snowflake_schema "Snowflake schema"), with dimensions surrounding the fact table.

To build the schema, the following design model is used:

1.  Choose the business process
2.  Declare the grain
3.  Identify the dimensions
4.  Identify the fact

### Choose the Business Process

The process of dimensional modeling builds on a 4-step design method that helps to ensure the usability of the dimensional model and the use of the [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse"). The basics in the design build on the actual business process which the [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse") should cover. Therefore, the first step in the model is to describe the business process which the model builds on. This could for instance be a sales situation in a retail store. To describe the business process, one can choose to do this in plain text or use basic Business Process Modeling Notation ([BPMN](https://en.wikipedia.org/wiki/BPMN "BPMN")) or other design guides like the Unified Modeling Language ([UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language "Unified Modeling Language")).

### Declare the Grain

After describing the business process, the next step in the design is to declare the grain of the model. The grain of the model is the exact description of what the dimensional model should be focusing on. This could for instance be âAn individual line item on a customer slip from a retail storeâ. To clarify what the grain means, you should pick the central process and describe it with one sentence. Furthermore, the grain (sentence) is what you are going to build your dimensions and fact table from. You might find it necessary to go back to this step to alter the grain due to new information gained on what your model is supposed to be able to deliver.

### Identify the Dimensions

The third step in the design process is to define the dimensions of the model. The dimensions must be defined within the grain from the second step of the 4-step process. Dimensions are the foundation of the fact table, and is where the data for the fact table is collected. Typically dimensions are nouns like date, store, inventory etc. These dimensions are where all the data is stored. For example, the date dimension could contain data such as year, month and weekday.

### Identify the Facts

After defining the dimensions, the next step in the process is to make keys for the fact table. This step is to identify the numeric facts that will populate each fact table row. This step is closely related to the business users of the system, since this is where they get access to data stored in the [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse"). Therefore, most of the fact table rows are numerical, additive figures such as quantity or cost per unit, etc.

## Benefits of Dimensional Modeling

Benefits of the dimensional model are the following:

-   Understandability. Compared to the normalized model, the dimensional model is easier to understand and more intuitive. In dimensional models, information is grouped into coherent business categories or dimensions, making it easier to read and interpret. Simplicity also allows software to navigate databases efficiently. In normalized models, data is divided into many discrete entities and even a simple business process might result in dozens of tables joined together in a complex way.
-   Query performance. Dimensional models are more denormalized and optimized for data querying, while normalized models seek to eliminate data redundancies and are optimized for transaction loading and updating. The predictable framework of a dimensional model allows the database to make strong assumptions about the data which may have a positive impact on performance. Each dimension is an equivalent entry point into the fact table, and this symmetrical structure allows effective handling of complex queries. [Query optimization](https://en.wikipedia.org/wiki/Query_optimization "Query optimization") for star-joined databases is simple, predictable, and controllable.
-   Extensibility. Dimensional models are scalable and easily accommodate unexpected new data. Existing tables can be changed in place either by simply adding new data rows into the table or executing SQL alter table commands. No queries or applications that sit on top of the data warehouse need to be reprogrammed to accommodate changes. Old queries and applications continue to run without yielding different results. But in normalized models each modification should be considered carefully, because of the complex dependencies between database tables.


***

## Appendix: Links

- [[Data Warehouse]]
- [[Kimball Techniques for Data Warehousing]]
- [[Ralph Kimball]]
- [[Bill Inmon]]
- [[Data Warehousing Concepts - Facts Measures Dimensions]]
- [[Data Warehousing Concepts - Slowly Changing Dimensions]]

**Literature:**

-   [Kimball, Ralph](https://en.wikipedia.org/wiki/Ralph_Kimball "Ralph Kimball"); Margy Ross (2013). _The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling_ (3rdÂ ed.). Wiley. [ISBN](https://en.wikipedia.org/wiki/ISBN_(identifier) "ISBN (identifier)")Â [978-1-118-53080-1](https://en.wikipedia.org/wiki/Special:BookSources/978-1-118-53080-1 "Special:BookSources/978-1-118-53080-1").
-   [Ralph Kimball](https://en.wikipedia.org/wiki/Ralph_Kimball "Ralph Kimball") (1997). ["A Dimensional Modeling Manifesto"](http://www.kimballgroup.com/1997/08/02/a-dimensional-modeling-manifesto/). _DBMS and Internet Systems_. **10** (9).
-   Margy Ross (Kimball Group) (2005). ["Identifying Business Processes"](https://web.archive.org/web/20130612211852/http://www.kimballgroup.com/2005/07/05/design-tip-69-identifying-business-processes/). _Kimball Group, Design Tips_ (69). Archived from [the original](http://www.kimballgroup.com/2005/07/05/design-tip-69-identifying-business-processes/) on 12 June 2013.

*Backlinks:*

```dataview
list from [[Dimensional Modeling]] AND -"Changelog"
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