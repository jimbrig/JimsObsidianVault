---
ID: "6d37c7b0-0855-4637-af48-ea25ed772173"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "R - Connect Shiny to PostgreSQL Database.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev/R", "Install", "Database", "Connect", "Running", "Appendix"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2022-01-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/R"]
Alias: "R - Connect Shiny to PostgreSQL Database"
---

# R - Connect Shiny to PostgreSQL Database

*Source: [How To Connect R Shiny to Postgres Database - The Definite Guide (appsilon.com)](https://appsilon.com/r-shiny-postgres-database/)*

## Contents

- [[#Install Necessary Packages|Install Necessary Packages]]
- [[#Database Credentials|Database Credentials]]
- [[#Connect to the Database|Connect to the Database]]
- [[#Running Queries|Running Queries]]
- [[#Appendix: Links|Appendix: Links]]



## Install Necessary Packages

- [[R Package - DBI]]
- [[R Package - RPostgreSQL]]

```R
pak::pak(c("DBI", "RPostgreSQL"))
```

## Database Credentials

- **Database Driver** - `RPostgreSQL::Postgres()` in this instance.
- **Database Name** - The name of the database to connect to (Note: PostgreSQL default database name is *postgres*)
- **Host** (Server) - The server/host URL to connect to: can be cloud based server, `localhost`, [[docker]] Container, etc.
- **Port** - PostgreSQL default port is `5432`
- **Username** & **Password** - User credentials

*Best Practice: Do not keep database connection details tracked in VCS/Git, instead abstract the configuration away from the codebase as a separate config file, a dedicated secrets vault or keyring, or environment variables.*

## Connect to the Database

In R, to connect to a database using [[R Package - DBI|DBI]], you create an [[R - R6|R6]] object housing the connection, in this case the connection object is assigned to `conn`. 

```R
library(DBI)

db <- "postgres"
db_host <- "localhost"
db_port <- "5432"
db_user <- "<your_user>"
db_pass <- "<your_password>"

conn <- dbConnect(
	RPostgres::Postgres(),
	dbname = db,
	host = db_host,
	port = db_port,
	user = db_user,
	password = db_pass
)
```

Next, you can check the connection was successful by running `DBI::dbListTables(conn)` to list all tables.

## Running Queries

- Example `SELECT` query:

```R
DBI::dbGetQuery(conn, "SELECT * FROM <table name> LIMIT 10")
```

***

## Appendix: Links

- [[Development]]
- [[2-Areas/MOCs/R]]
- [[R Shiny]]
- [[Databases]]
- [[PostgreSQL]]
- [[R - Database Packages List]]
- [[R Shiny Packages List]]

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