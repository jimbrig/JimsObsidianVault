---
ID: "1bcbe463-5485-4595-a079-8c9c6e846847"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Data Warehousing Concepts - Slowly Changing Dimensions.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2022-02-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Data Warehousing Concepts - Slowly Changing Dimensions"
---

# Data Warehousing Concepts - Slowly Changing Dimensions

There are six types (Type 1 thru Type 6) of *Slowly Changing Dimensions* (SCD) operations and transformers that enable you to handle and implement two common SCD Types: Type 1 and Type 2

**Type 1 SCD**Â â Doesnât require history of dimension changes to be maintained and the old dimension value is simply overwritten with the new one. This type of operation is easy to implement (similar to a normal SQL update) and is often used for things like removing special characters, correcting typos and spelling mistakes in record field values.

**Type 2 SCD** â Requires maintaining history of all changes made to each key in a dimensional table. Here are some challenges involved when manually dealing with Type 2 SCD:

-   Every process that updates these tables has to honor the Type 2 SCD pattern of expiring old records and replacing them with new ones
-   There might not be a built-in constraint to prevent overlapping start and end dates for a given dimension key
-   When converting an existing table to a Type 2 SCD, it will most likely require you to update every single query that reads from or writes to that table
-   Every query against that table will need to account for the historical Type 2 SCD pattern by filtering only for current data or for a specific point in time

As you can imagine, Type 2 SCD operations can become complex and hand-written code, SQL queries, etc. may not scale and can be difficult to maintain.

## One-Time Migration - File Based (Batch Mode)

Letâs first take a very simple yet concrete example of managing customer records (with updates to addresses) for existing and new customers. In this case, the assumption is that the destination is empty so itâs more of a one-time migration scenario for ingesting "master" and "change" records from respective origins to a new file destination.

This scenario involves:

-   Creating one record for every row in "master" origin
-   Creating one record for every row in "change" origin
    -   New customers: Version set to 1 where customer id doesnât exist in "master" origin
    -   Existing customers: Version set to current value in "master" origin + 1 where customer id exists in "master" origin

## Incremental Updates â JDBC Based (Streaming mode)

Now letâs say there is a JDBC connection enabled database (for example, MySQL) and it has a dimension table âcustomersâ with composite primary key â _customer_id, version._ In this case, the goal is still the same as pattern 1 and 2 where weâd like to capture and maintain history of updates for new and existing customer records.

The main differences between this and pattern 1 are as follows:

-   Pattern 1 is designed to run in batch mode and terminate automatically after all the data has been processed; whereas pipeline in pattern 2 is configured to run in streaming modeâcontinuously till the pipeline is stopped manuallyâwhich means it will âlistenâ for customer updates being dropped in S3 bucket and process them as soon as theyâre available without user intervention.
-   Pattern 1 can only handle up to one additional update for any given customer record because of the fact that the master origin is not updated with new version number for every corresponding change record â which effectively means every update record coming in via change origin will get assigned version 2.
-   Unlike pattern 1, the master gets updated with the latest version in pattern 2 (via JDBC Producer destination) so every update record coming in via change origin will get a new version assigned to it.

**Query Customers:**

```SQL
SELECT * FROM customers WHERE customer_id = 1
```

## Incremental Updates â Databricks Delta Lake (Streaming mode)

This is very similar to Pattern 2. The main differences are:

-   Single origin 
-   Delta Lake Lookup â For every update/change record coming in a lookup against the current Delta Lake will be performed based on dimension key _customer_id_. If thereâs a match, the values _customer_id_ and _version_ will be returned and passed on to SCD processor. The SCD processor will increment the version number based on the lookup value and a new record with updated version will be inserted into the Delta Lake table.

**Query Customers in Delta Lake DBFS:**

```SQL
SELECT * FROM delta.`/DeltaLake/customers` where customer_id in (1)
```

## Upserts â Databricks Delta Lake And Time Travel (Streaming mode)

If youâre using Delta Lake, another option is to leverage Delta Lakeâs built-in upserts using merge functionality. Here the underlying concept is the same as SCD which is to maintain versions of dimensions, but the implementation of it is much simpler.

In this pattern, for every record coming in via the (S3) origin, an insert or an update operation is performed in Delta Lake based on the conditions configured for new (âWhen Not Matchedâ) and existing products (âWhen Matchedâ) respectively. And since Delta Lake storage layer supports ACID transactions, it is able to create new (parquet) files for updates â while allowing to query for the most recent record with simple SQL without explicitly requiring tracking field (for example, â_version_â) to be present in the table and the where clause.

For instance, consider this original record:

```SQL
SELECT * FROM products WHERE product_id = 1
```

Note that the table _products_ doesnât have tracking type field (for example, â_version_â) while the query still retrieves the most âcurrentâ version of the record with product price of **_$69.98_**. 

To query older versions of the data, Delta Lake provides a feature called âTime Travelâ. So in our case, to retrieve the previous (0) version of the productâs price, the SQL query would look like:

```SQL
SELECT * FROM products VERSION AS OF 0 where product_id = 1
```


***

## Appendix: Links

- [[ETL]] | [[ELT]]
- [[Data Engineering]]
- [[Amazon Web Services]]
- [[Microsoft Azure]]
- [[Google Cloud Platform]]
- [[Data Warehouse]]
- [[Dimensional Modeling]]



*Backlinks:*

```dataview
list from [[Data Warehousing Concepts - Slowly Changing Dimensions]] AND -"Changelog"
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