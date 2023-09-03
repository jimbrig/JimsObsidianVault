---
ID: "476c1237-0904-459c-bd56-c3664df14549"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "dplyr as a Database Interface for R.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev/R"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/R"]
Alias: "dplyr as a Database Interface for R"
---

# dplyr as a Database Interface for R

*Source: [Overview (rstudio.com)](https://db.rstudio.com/getting-started/overview)*

## Overview

The [[R Package - dplyr|dplyr]] package simplifies data transformation. It provides a consistent set of functions, called verbs, that can be used in succession and interchangeably to gain understanding of the data interactively.

### **dplyr** as a database interface

*Source: [dplyr as a database interface - (rstudio.com)](https://db.rstudio.com/getting-started/overview#dplyr-as-a-database-interface)*

The `dplyr` package simplifies data transformation. It provides a consistent set of functions, called verbs, that can be used in succession and interchangeably to gain understanding of the data iteratively.

`dplyr` is able to **interact with databases directly** by translating the `dplyr` verbs into SQL queries. This convenient feature allows you to âspeakâ directly with the database from R. Other advantages of this approach are:

![](https://db.rstudio.com/homepage/interact.png)

1.  **Run data exploration routines over all of the data**, instead of importing part of the data into R.
    
2.  **Use the SQL Engine to run the data transformations.** In effect, computation is being pushed to the database.
    
3.  **Collect into R only a targeted dataset.**
    
4.  **All of your code is in R.** Because`dplyr` is used to communicate with the database, there is no need to alternate between languages or tools to perform the data exploration.
    

## **Connect to a database**

![](https://db.rstudio.com/homepage/open-source.png)

**At the center of this approach is the `DBI` package.** This package acts as _âmiddle-wareâ_ between packages to allow connectivity with the database from the user or other packages. It provides a consistent set of functions regardless of the database type being accessed. The `dplyr` package depends on the `DBI` package for communication with databases.

There are packages that enables a direct connection between the an open-source database and R. Currently, such packages exist for the following databases: _MySQL, SQLite, PostgreSQL, and bigquery_.

![](https://db.rstudio.com/homepage/commercial.png)

Most commercial databases, like Oracle and Microsoft SQL Server, offer ODBC drivers that allow you to connect your tool to the database. Even though there are R packages that allow you to use ODBC drivers, the connection will most likely not be compatible with `DBI`. The new `odbc` package solves that problem by providing a `DBI` backend to any ODBC driver connection.

If you are interested in creating your own package that connects `DBI` to a database, please review the article [DBI Backend](https://db.rstudio.com/getting-started/backend).

## SQL Translations for `dplyr`

A complementary package called `dbplyr` contains the translations of the vendor-specific SQL for `dplyr` to use. A list of known supported databases are available in our [Databases](https://db.rstudio.com/databases) page.

Is the database you are interested in not listed here? You can still use `DBI` and `odbc` to connect and send SQL queries. If you would like to contribute a translation, please see the [SQL Translation](https://db.rstudio.com/getting-started/translation) page in this website.

### Example

The same dplyr syntax used with data in R will also work with data in a database. In the example below, data from the `nycflights13` package are loaded into a SQLite database then queried from R. The results from the query are then collected into R and visualized with ggplot2. The process is the same if you are using an enterprise data warehouse â like Microsoft SQL Server or Snowflakeâs data cloud.

```
library(DBI)
library(dplyr)
library(ggplot2)


con <- dbConnect(RSQLite::SQLite(), ":memory:")
copy_to(con, nycflights13::flights, "FLIGHTS")

tbl(con, "FLIGHTS") %>%
  filter(distance > 75) %>%
  group_by(origin, hour) %>%
  summarise(delay = mean(dep_delay, na.rm = TRUE)) %>%
  collect() %>%
  ggplot(aes(hour, delay, color = origin)) + geom_line()
```

![](https://db.rstudio.com/homepage/snowflake-flights.png)

***

## Appendix: Links

- [[R - Database Packages List]]
- [[R Package - dplyr]]
- [[R Package - dbplyr]]
- [[Development]]
- [[2-Areas/MOCs/R]]


*Backlinks:*

```dataview
list from [[dplyr as a Database Interface for R]] AND -"Changelog"
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