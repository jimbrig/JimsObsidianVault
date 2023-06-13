---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://docs.aws.amazon.com/athena/latest/ug/querying-glue-catalog.html
Tags: ["#Type/Highlight/Article"]
Aliases: ["Querying AWS Glue Data Catalog", "Querying AWS Glue Data Catalog"]
---
# Querying AWS Glue Data Catalog

## Metadata
- Author: [[amazon.com]]
- Full Title: Querying AWS Glue Data Catalog
- Category: #Type/Highlight/Article
- URL: https://docs.aws.amazon.com/athena/latest/ug/querying-glue-catalog.html

## Highlights
- To obtain AWS Glue Catalog metadata, you query the `information_schema` database on the Athena backend. The example queries in this topic show how to use Athena to query AWS Glue Catalog metadata for common use cases. ([View Highlight](https://read.readwise.io/read/01gwn9sj2163nqyc53r8ar8eyq))
- Listing databases and searching a specified database ([View Highlight](https://read.readwise.io/read/01gwn9srbypg7n7qha18gkx0f8))
- The following example query lists the databases from the `information_schema.schemata` table. ([View Highlight](https://read.readwise.io/read/01gwn9sv8bh3fx4zeb3r4aeea1))
- SELECT schema_name FROM information_schema.schemata LIMIT 10; ([View Highlight](https://read.readwise.io/read/01gwn9syt67y4szskcfaf620fn))
- SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'rdspostgresql' ([View Highlight](https://read.readwise.io/read/01gwn9t6geyfpkwtjq77tyvsh7))
- Listing tables in a specified database and searching for a table by name ([View Highlight](https://read.readwise.io/read/01gwn9tdk1pjm7e5yh2kywe65g))
- SELECT table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'rdspostgresql' ([View Highlight](https://read.readwise.io/read/01gwn9tkfrhe8y2vr91527w928))
- Listing partitions for a specific table
  You can use `` SHOW PARTITIONS `table_name` `` to list the partitions for a specified table, as in the following example.
  SHOW PARTITIONS cloudtrail_logs_test2 ([View Highlight](https://read.readwise.io/read/01gwn9twkyc79vh1wew3r162a1))
- You can also use a `$partitions` metadata query to list the partition numbers and partition values for a specific table.
  Example – Querying the partitions for a table using the $partitions syntax
  The following example query lists the partitions for the table `cloudtrail_logs_test2` using the `$partitions` syntax. ([View Highlight](https://read.readwise.io/read/01gwn9v9pt9fdazxwm23cvjcst))
- SELECT * FROM default."cloudtrail_logs_test2$partitions" ORDER BY partition_number ([View Highlight](https://read.readwise.io/read/01gwn9vejrh3jenjcnzrb3nygq))
- Listing all columns for all tables ([View Highlight](https://read.readwise.io/read/01gwn9vnb5emkk5eza14gz26fz))
- You can list all columns for all tables in `AwsDataCatalog` or for all tables in a specific database in `AwsDataCatalog`. ([View Highlight](https://read.readwise.io/read/01gwn9wzrxbfr4jnanmv4vx7wm))
- You can list all columns for all tables in `AwsDataCatalog` or for all tables in a specific database in `AwsDataCatalog`. ([View Highlight](https://read.readwise.io/read/01gwn9x0e1pqy5ts2t2zw7tqb5))
- To list all columns for all databases in `AwsDataCatalog`, use the query `SELECT * FROM information_schema.columns`. ([View Highlight](https://read.readwise.io/read/01gwn9x1z2vw0fd28qhc31mznf))
    - Note: SELECT * FROM information_schema.columns
- To list all columns for all databases in `AwsDataCatalog`, use the query `SELECT * FROM information_schema.columns`. ([View Highlight](https://read.readwise.io/read/01gwn9x2ywcwnefhfgqvt31hx3))
- To restrict the results to a specific database, use ``table_schema='`database_name`'`` in the `WHERE` clause. ([View Highlight](https://read.readwise.io/read/01gwn9x4a73jvdrxp23587ek7j))
- To restrict the results to a specific database, use ``table_schema='`database_name`'`` in the `WHERE` clause. ([View Highlight](https://read.readwise.io/read/01gwn9x4g66q8x1pazn4k70bbj))
- Listing or searching columns for a specified table or view ([View Highlight](https://read.readwise.io/read/01gwn9xq9a9a0bg6fkw8p6m4r2))
- You can list all columns for a table, all columns for a view, or search for a column by name in a specified database and table. ([View Highlight](https://read.readwise.io/read/01gwn9xs4nc48rymvavnvy6k22))
- To list the columns, use a `SELECT *` query. In the `FROM` clause, specify `information_schema.columns`. In the `WHERE` clause, use ``table_schema='`database_name`'`` to specify the database and ``table_name = '`table_name`'`` to specify the table or view that has the columns that you want to list. ([View Highlight](https://read.readwise.io/read/01gwn9xtma3beffkkqj491rpe0))
- Example – Listing the columns for a specified view ([View Highlight](https://read.readwise.io/read/01gwn9y9a2shdptdnq25vznkcr))
- The following example query lists all the columns in the `default` database for the view `arrayview`. ([View Highlight](https://read.readwise.io/read/01gwn9yaq90dy1hdeg68yt6te0))
- SELECT * FROM information_schema.columns WHERE table_schema = 'default' AND table_name = 'arrayview' ([View Highlight](https://read.readwise.io/read/01gwn9ye1266wajrbxhfpqst6c))
