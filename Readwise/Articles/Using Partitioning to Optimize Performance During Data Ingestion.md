---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: Matter
Link: https://www.bluegranite.com/blog/using-partitioning-to-optimize-performance-during-data-ingestion
Tags: ["#Type/Highlight/Article"]
Aliases: ["Using Partitioning to Optimize Performance During Data Ingestion", "Using Partitioning to Optimize Performance During Data Ingestion"]
---
# Using Partitioning to Optimize Performance During Data Ingestion

## Metadata
- Author: [[Emily Schmucker]]
- Full Title: Using Partitioning to Optimize Performance During Data Ingestion
- Category: #Type/Highlight/Article
- URL: https://www.bluegranite.com/blog/using-partitioning-to-optimize-performance-during-data-ingestion

## Highlights
- Data ingestion is the process of transferring data from its source system to a data store, often a data lake.
    - Tags: [[data-engineering]] [[datalake]] [[datapipelines]] 
- Your data should be ingested in a timely manner, your data should arrive in its destination in an accurate format, your data should be in a format that can be transformed for analytical processes...
    - Tags: [[datalake]] [[datapipelines]] [[data-engineering]] 
- In a cloud-based data architecture, utilizing one server for ten hours costs the same as utilizing ten servers for one hour. Because of this, the best and most cost-effective way to optimize performance is to shorten your longest running job. An incredibly powerful way to do this is to employ a partitioning pattern. A partitioning pattern essentially involves breaking a large data ingestion job into several smaller jobs.
    - Tags: [[datapipelines]] [[data-engineering]] [[datalake]] 
- A data lake is a central storage location that allows you to store vast amounts of data, both structured and unstructured. Since organization is key to maintaining your data lake, data lakes typically have several zones. Each zone fulfills a separate role or purpose in the data ingestion or transformation process. There is no single template for the number of zones or types of zones in a data lake, so these can vary across organizations depending on their needs.
    - Tags: [[data-engineering]] [[datalake]] [[datapipelines]] 
- For our example, our data lake includes a raw zone and a curated zone. The raw zone stores data from its source in a raw, unfiltered format. This zone also contains copies of every single version of the raw data from every single ingestion. The data from the raw zone is then transformed and loaded to the curated zone. The curated zone is more structured than the raw zone and is ready for analytical processing. Once a use case is defined, data from the curated zone can then be used to build a data warehouse.
    - Tags: [[datalake]] [[datapipelines]] [[data-engineering]] 
- So how does partitioning fit into all that? When ingesting a data source to the data lake, you can break that job into several jobs by partitioning your dataset on a selected field. Then, you can load each of the partitioned jobs to the same target in the data lake.
    - Tags: [[datapipelines]] [[data-engineering]] [[datalake]] 
- First, you need to decide which field to partition your data on. It is most common to use dates to partition data, such as the year or month of a date. When deciding on the field to partition your data on, you must pay close attention to the cardinality of that field. A field with a high cardinality such as ProductNo, Name, or Description are not good candidates for partitioning because it could result in needing millions or billions of partitioning tasks. You could consider using low cardinality fields such as Category or Color. However, it is important to take into consideration whether that field could introduce additional values in the future.
    - Tags: [[datalake]] [[data-engineering]] [[datapipelines]] 
- In this example, we will follow best practices of using a date field as the partitioning field. Below is an example source query for a partitioning job to ingest data to the raw zone of the data lake:
    - Tags: [[datapipelines]] [[datalake]] [[data-engineering]] 
- SELECT *, YEAR(LaunchDate) AS PartitionedBy FROM Products WHERE YEAR(LaunchDate) = 2021
    - Tags: [[datalake]] [[datapipelines]] [[data-engineering]] 
- Applying Partitioning to a Growing Dataset In many cases, you won’t ingest your data from the start using partitioning. Over time, your data set will grow and eventually reach the point where it can no longer run in the necessary time frame. To implement the partitioning method, how do you handle all the data that has already been ingested in order for it to be compatible with the partitioned data?
    - Tags: [[datapipelines]] [[datalake]] [[data-engineering]] 
- The data that has already been ingested will need to be transformed to include a partition and a PartitionedBy column. This transformation will provide seamless integration with your incoming data.
    - Tags: [[data-engineering]] [[datalake]] [[datapipelines]] 
- The finished product will be a partitioned table that incorporates the data that existed before the partitioning pattern was applied and efficiently ingests data partitioned by YEAR(LaunchDate).
    - Tags: [[datapipelines]] [[data-engineering]] [[datalake]] 
