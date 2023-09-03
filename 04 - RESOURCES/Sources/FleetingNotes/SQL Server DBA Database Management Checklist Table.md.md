---
ID: "1a921713-59fc-4478-bf70-a972be5588ce"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "SQL Server DBA Database Management Checklist Table.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---


# SQL Server DBA Database Management Checklist Table

> Source: *https://www.mssqltips.com/sqlservertip/1278/sql-server-dba-database-management-checklist/*

For both old and new DBAs there are fundamental procedures that should be addressed and proper processes put in place to handle various areas of database management for SQL Server. Whether you are a full time DBA or this is one of many job roles that you perform the same basic steps should be implemented and adhered to in order to have some peace of mind that you are performing the correct procedures to ensure a healthy running SQL Server environment. For old DBAs these items should be a no-brainer, but often a refresher is good reminder to make sure everything is in place. For new DBAs some of these basic items are not all that apparent and often some of the most basic DBA 101 items are sometimes overlooked. So based on this, what is a good plan to implement to make sure the basic SQL Server DBA items are being addressed?

***

The following is a checklist of 10 items that should be in place for all of your SQL Server database servers. Some of these items are pretty basic and easy to implement, while others require a higher level of effort to think through what is needed and then to implement the process. 

These items are not necessarily written in any priority order, because not any one of these items is a complete database management plan it really requires all of these items to be thought about, addressed and implemented.

|  #   |                  Item                  | Instructions, Notes, and Details                             |
| :--: | :------------------------------------: | ------------------------------------------------------------ |
|  1   |                Backups                 | This is one of the most basic items to be addressed.  Everyone knows that a good solid backup plan should be in place for all databases, but time and time again I run across servers where the wrong or no backup plan is in place. To get started you need to ask yourself a few questions such as the following: What are you trying to recover from when a failure occurs? How much data can be lost? A day, one hour, a week, none.. What kind of processing occurs, transaction based, batch loading, a combination? Can the data be easily recreated if there is a failure or is this the only source of this data? This is just a short list of questions to ask, but once these are addressed this will allow you to determine; 1) the recovery model for your database and 2) the backup processing. Depending on your needs your backup plan may look like one of the following:  Daily full backups only; Daily full backups and transaction log backups every hour; Daily full backups, transaction log backups every 15 minutes and differential backups every 4 hours. Note: If you are unsure what to do, start with at least full backups on a daily basis.  If your data is very important and you cannot easily recreate the data, change your database recovery model to FULL and implement both full and transaction log backups. |
|  2   |          Run Integrity Checks          | Another area that should be addressed is the integrity of your data.  SQL Server offers a few options to address this such as DBCC CHECKDB, DBCC CHECKTABLE, DBCC CHECKALLOC, etc... These commands check the allocation, structure and logical integrity of all objects in your database.  In addition, to running these commands either through maintenance plans, maintenance jobs or via a query window you also need to analyze the data to look for any integrity issues that need to be addressed.  This is another area that I see a lot of where the commands are run via maintenance jobs, but no one ever reviews the reports to see if there are any issues that need to be addressed. For the most part these integrity issues pop up a lot less than they did with earlier versions of SQL Server, but this is still an area that should be part of your DBA procedures. |
|  3   |            Maintain Indexes            | Indexes are those helpful pointers that allow you quick access to your data pages in your database.  When indexes are newly created the structure is nice and clean and everything works great by accessing your data via the index instead of having to scan the entire table. Over time these helpful indexes become fragmented and take up unnecessary space and accessing your data pages is not as efficient as it was when the indexes were first created.  This is where index maintenance is a critical DBA process that needs to be in place. In SQL Server 2000 you have the ability to run index rebuilds across the board for all tables when using maintenance plans.  This was an all or nothing approach.  In SQL Server 2005, you also have the ability to run index rebuilds as well as index defrags.  In addition, you can pick specific tables that you need to manage.  Although this is not a perfect process for maintaining indexes it is definitely better than not doing anything. To take this a step further you can manage your index maintenance table by table or index by index.  Some indexes will become fragmented while others may never have an issue based on how the index was created and how data is applied to the table/index.  Based on this, by doing the across the board method of index management you are spending unnecessary time addressing a problem that does not exist for some the tables.  Therefore the best approach would be to use the tools that SQL Server offers such as DBCC SHOWCONTIG and sys.dm_db_index_physical_stats to identify where the real issues exist and then take steps to address these tables and indexes instead of every table and index in your database. |
|  4   |           Review Error Logs            | There are several areas where SQL Server logs information about processes that are occurring as well as errors that occur.  The most used is probably the SQL Server Error Log.  This error log gives you startup information, integrity check information, backup information, etc... as well as any SQL Server errors that occur.  In addition to this log, there is also a log for SQL Server Agent and now in SQL Server 2005 Database Mail.  In addition to these internal SQL Server logs you should also use the Windows Event Log to find other errors that may be occurring or possibly additional information that is not in the SQL Server logs. Reviewing the logs should be part of your daily routine for checking the health of your system.  The ideal way to handle this is to use some tool that automates the alert process when there is an error, but either way you should keep these error logs on your radar list as something to review each day. |
|  5   |      Manage SQL Server Agent Jobs      | SQL Server's built-in job scheduling tool is a great tool for automating your backups, index rebuilds, integrity checks, etc...  But in addition to this tool giving you the flexibility to run these jobs during off hours you also need to make sure you are monitoring job success and failure.  This can be automated by setting up SQL Mail (SQL 2000) or Database Mail (SQL 2005) and having failures be sent out to operators that are configured. This is another area I see all the time where there are several jobs that fail not just once or twice but every single time they were run.  Take the time on a daily basis to check out the job failures and address the issue so all of your jobs run successfully. |
|  6   |              Test Backups              | A SQL Server backup is only good if the restore works.  No matter how many backups you take of your database if you cannot restore the file when needed there is no point in doing backups in the first place.  The only way to determine if your backup/restore process will work is to periodically test on another server.  This not only gives you peace of mind that the restore was successful, but this also gives you an idea of how long the entire process will take if you ever need to do this on your production server.  Having this little insight and the time it will take to recover you database will go along way when you have people breathing down you neck. In addition to testing, you should also use the RESTORE VERIFY option when creating your backups.  It doesn't necessarily tell you that the restore will not have any issues, but it will at least prove that SQL Server can read the entire backup file without a problem. |
|  7   |          Monitor Performance           | This is one area that should be a no-brainer if you are responsible for monitoring your SQL Server environment.  The database is usually the last thing people think about when they are working with an application, but when the application is slow the database is usually the first thing that is blamed for the poor performance. The problem with performances monitoring is not that most people don't do this, it is that they are not sure how to do this.  Windows and SQL Server offer built in tools such as Performance Monitor, Profiler, Execution Plans, Index Tuning Wizard, Database Engine Tuning Advisor, etc...  In addition, there are a whole bunch of third party tools that allow you to trend performance issues and be alerted when there are issues.  Without good data it is very difficult to say when there really is a performance issue and also without this data it is difficult to know where to spend your time fixing issues that will have a big impact versus fixing something that will not have a very big impact. |
|  8   |                Document                | Another thing that should be implemented is a documentation process to document procedures, priority lists, escalation lists, production changes, roll out procedures, etc...  A good set of procedures should be established, so everyone that works on your SQL Servers understands the processes that you have put in place as well as to document all changes that occur, so when a problem does arise you can pinpoint when a change was made. A simple text file could be used to track your changes or since we are all database developers/DBAs why not use SQL Server to document and track the changes. This should be one of the simplest things to implement and there is no reason you can start doing this today. |
|  9   | Create and Test Disaster Recovery Plan | Disasters don't strike all that often and because of this disaster recovery plans are usually not implemented.  I am sure just about everyone has thought about this at one point in time, but thinking about a disaster recovery plan and implementing a plan are two totally different things. As a DBA you need to take the time to determine what kind of issues may arise and how to resolve the problem when it does occur.  Think about this from a server level, database level and also down to a table level.  Once you have determine what you need to do and how you are going to go about resolving the issue take the time to do some tests.  You don't need to test every single server in your environment, but you should try to test each type of failure that you are trying to recover from. Another thing to put in place is a priority list for your servers and your databases.  This way if there are multiple failures that occur you already have a priority list of what needs to be addressed and the order that they need to be dealt with. |
|  10  |            Manage Security             | Security is also another area that is the DBAs responsibility to monitor.  As you probably know security levels exist at the Windows server level, SQL Server server level, database level, object level, etc...  There are SQL Server server level roles, database roles and user defined roles.  Take the time to analyze your permission structure and make the necessary adjustments to ensure people have the rights they need to work, but not additional rights that may cause potential problems.  In addition, to securing your database servers, make sure your database backups and any external programs are also secure, so no one can gain backdoor access to your servers or your data. |



***

## Appendix: Links

- [[Development]]
- [[Databases]]
- [[03 - AREAS/Technology/Data Engineering/Data Science]]
- [[Data Engineering]]


*Backlinks:*

```dataview
list from [[SQL Server DBA Database Management Checklist Table]] AND -"Changelog"
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