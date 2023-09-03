---
ID: "fbc9c5ec-a753-4c70-8dd2-f81255c4439e"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Modern Data Pipeline Complexities.md"
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
Alias: "Modern Data Pipeline Complexities"
---

# Modern Data Pipeline Complexities

![](https://i.imgur.com/kNjjWhZ.png)


#### **Data Pipeline Components**

The purpose of a data pipeline is to move data from a point of origin to a specific destination. At a high level, a data pipeline consists of eight types of components (See figure 1.):

**Origin** â The initial point at which data enters the pipeline.

**Destination** â The termination point to which data is delivered.

**Dataflow** â The sequence of processes and data stores through which data moves to get from origin to destination.

**Storage** â The datasets where data is persisted at various stages as it moves through the pipeline.

**Processing** â The steps and activities that are performed to ingest, persist, transform, and deliver data.

**Workflow** â Sequencing and dependency management of processes.

**Monitoring** â Observing to ensure a healthy and efficient pipeline.

**Technology** â The infrastructure and tools that enable data flow, storage, processing, workflow, and monitoring.

#### **Start with the Destination**

Begin pipeline design by starting at the end point â the destination. Know where data is needed and why it is needed. Are you moving data to a data store â warehouse, data mart, data lake, etc.? Or are you providing data for an application such as a dashboard or analytic application?

Timeliness is a destination-driven requirement. How quickly is data needed at the destination? Recognize that different kinds of data may have different timeliness requirements. One or a few data elements that are needed in real time does not require that the pipeline move all of the data in real time.

#### **Next Look at Origin**

Shift attention from destination to origin to consider the data that will enter the pipeline. Origin may be either an initial data source such as a transaction system, or a data store that exists within the analytical data environment such as a data warehouse or data lake.

Destination requirements are a driving force of origin identification and design. The process, however, may be exploratory and iterative with origin discoveries influencing destination and destination requirements guiding origin exploration and design.

Timeliness needs at the destination are closely coupled with latency constraints at the origin. Kinds of data â event-based and entity based â need to be considered. Event data typically moves at a higher velocity than entity-based reference data and is certainly more likely to be ingested as a data stream.

#### **Design the Dataflow**

With origin and destination understood you know what goes into the pipeline and what comes out. Data flow describes how inputs move through the pipeline to become outputs â the sequence of processes and data stores through which data moves to get from origin to destination.

It is possible for a data flow to consist entirely of processes without intermediate data stores. It is not possible for a data flow to consist only of data stores without processes. Intermediate data stores are valuable when a flow needs to be time-sliced: when all inputs are not ready at the same time, when one process must wait for others to complete, etc.

Intermediate data stores are sometimes used when the stored data serves multiple purposes â continued flow through the pipeline and access to the stored data by other processes. This common practice is really a shortcut that may create future pipeline management problems. It is a better practice to design as two distinct pipelines where the intermediate store becomes the destination of one pipeline and the origin of another.

![](https://i.imgur.com/zwbmfRG.png)

This relatively simple view of dataflow is somewhat deceptive. Dataflow choices can be challenging as there are several distinct data flow patterns (raw data load, ETL, ELT, ETLT, stream processing, and more) as well as several architectural patterns (linear, parallel, lambda, etc.) that Iâll discuss in my next blog post.

#### **Determine Data Storage Methods**

Data storage is the means to persist data as intermediate datasets as it moves through the pipeline and as end point datasets when the pipeline destination is a data store. Data storage choices for data stores such as a data warehouse or data lake are architectural decisions that constrain pipeline design. Data storage choices for intermediate data stores are pipeline design decisions though standards, conventions, skills, and available technology are likely to limit the choices.

Data volume and query requirements are the two primary decision factors when making data storage choices. Volume and query are the two most significant decision factors, but many other variables need to be considered when choosing data storage methods. When designing data storage consider these factors:

-   Data volume
-   Structure and format
-   Duration and retention
-   Query frequency and volume
-   Other users and uses of the data
-   Governance constraints
-   Privacy and security
-   Fault tolerance and disaster recovery

#### **Design the Processing**

Dataflow and data processing work together as the core of a data pipeline. Processing is the mechanism to implement ingestion, persistence, transformation, and delivery activities of the data pipeline. Many kinds of processes are common in data pipelines â ETL, map/reduce, aggregation, blending, sampling, formatting, and much more. The right processes executed in the right sequence turn inputs (origin data) into outputs (destination data).

Data ingestion is performed in a variety of ways including export by source systems, extract from source systems, database replication, message queuing, and data streaming. Data source and type of data constrain the choice of ingestion methods. Other considerations include transport protocols and need to secure data in motion.

Data transformation processing changes data to meet specific needs and goals â getting the right data in the right forms and formats for intended uses. The three primary reasons for data transformation are improving data, enriching data, and formatting data. Specific kinds of transformations include:

**Standardization** consistently encodes and formats data that is similar.

**Conforming** ensures consistent meaning and content when the same data is stored in multiple files or databases.

**Data cleansing** detects and corrects deficiencies in data quality.

**Quality assurance** derives new data (metadata) that rates, scores, or otherwise describes the quality of data.

**De-duplication** intelligently removes redundantly stored data.

**Derivation** creates a new data value from one or more contributing data values using a formula or algorithm.

**Appending** extends a dataset with additional attributes from another data source.

**Aggregation** composes new data records by bringing together data from multiple records and applying formulas or algorithms. Aggregates may be either summaries or assemblies.Â 

**Sorting and sequencing** place data in the order that is best suited to the needs of analysis. Sorting prescribes the sequencing of records. Sequencing prescribes sequence of fields within a record.

**Pivoting** changes data orientation by swapping the positions of rows and columns.

**Sampling** statistically selects a representative subset of a population of data.

**Filtering** reduces a data set to contain only the data that is useful at the destination.

**Masking** obscures data values for sensitive data.

**Assembly and construction** build final format records in the form needed at a destination.

Delivery processes are of many types depending on the destination and use of the data. Publishing works for reports and for âpublishingâ to databases. Cataloging works well together with publishing of data assets. Analytic modeling is a typical delivery process when the destination is an analytic application. Visualization delivers large amounts of complex data in a consumable form. Storytelling adds interpretation and narrative to data visuals.

#### **Design the Workflow**

Workflow defines and manages the sequencing and dependencies of processes in the data pipeline. Sequences and dependencies need to be managed at two levels: individual tasks to perform a specific processing function, and jobs that combine many tasks to be executed as a unit.

Look at dependencies from three perspectives. For any job or task:

What upstream jobs or tasks must complete successfully before execution of the job or task?

What downstream jobs or tasks are conditioned on successful execution?

What parallel processing dependencies require multiple jobs or tasks to complete together?

#### **Consider Pipeline Monitoring Needs**

Monitoring is the work of observing the data pipeline to ensure a healthy and efficient pipeline that is reliable and performs as required. Pipeline design questions for monitoring include:

-   What needs to be monitored?
-   Who is responsible to monitor?
-   What tools will be used to monitor the pipeline?
-   What thresholds and limits are applicable?
-   What actions are needed when thresholds and limits are encountered, and who is responsible to take action?

#### **Choosing the Right Technologies**

Pipeline technology is a huge and continuously evolving topic â too large to address as part of this already lengthy blog. Technology includes all of the infrastructure and tools that enable dataflow, storage, processing, workflow, and monitoring.

#### **Reducing the Complexity**

Data pipelines are inherently complex, but they donât have to be overly complicated. A systematic approach to pipeline design is the key to reducing complexity. A good step-by-step approach to data pipeline design uses these steps:

-   Understand the Destination â Where is the data needed and why?
-   Understand the Origin â Where and how will you acquire the data?
-   Design the Dataflow â How will data move from origin to destination?
-   Design Storage and Processing â What activities are needed to transform and move data, and what techniques to persist data?
-   Design the Workflow â What dependencies exist and what are the right processing sequences?
-   Define the Monitoring â How will you manage pipeline health?
-   Choose the Technology â What tools are needed to implement the pipeline?


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
list from [[Modern Data Pipeline Complexities]] AND -"Changelog"
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