---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://devblogs.microsoft.com/azure-sql/using-ledger-in-azure-sql-database/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Using Ledger in Azure SQL Database
  - Using Ledger in Azure SQL Database
---
# Using Ledger in Azure SQL Database

## Metadata
- Author: [[Brian Spendolini]]
- Full Title: Using Ledger in Azure SQL Database
- Category: #Type/Highlight/Article
- URL: https://devblogs.microsoft.com/azure-sql/using-ledger-in-azure-sql-database/

## Highlights
- Ledger, available in Azure SQL Database and SQL Server 2022, helps to protect your database and establish trust, accuracy and integrity in your data. ([View Highlight](https://read.readwise.io/read/01gytsc4px5dpc7fb4mnc0c64n))
- Ledger accomplishes this goal in a couple of ways. First, it provides you with a history of records in your database; if a row was updated or deleted in the database, its previous value is maintained and protected in a history table. This provides you with a chronicle of all changes made to the table over time. You can even enable this feature database wide so that all tables can have this historical information. ([View Highlight](https://read.readwise.io/read/01gytsc9jhwpp3q9zx9sy5rawy))
- Ledger accomplishes this goal in a couple of ways. First, it provides you with a history of records in your database; if a row was updated or deleted in the database, its previous value is maintained and protected in a history table. This provides you with a chronicle of all changes made to the table over time. You can even enable this feature database wide so that all tables can have this historical information. ([View Highlight](https://read.readwise.io/read/01gytscbc6m89r920t1yvyc7xb))
- The second way Ledger helps is by creating insert only tables. Update and deletes cannot be done on these tables making them perfect for scenarios such as security information and event management (SIEM) applications. Both these features incorporate a blockchain that reside in the Azure SQL Database ledger. More on how Azure SQL Database uses blockchain at the end of this post. ([View Highlight](https://read.readwise.io/read/01gytscgvmytnez34qtrkyxz4b))
