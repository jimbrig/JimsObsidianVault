---
ID: "0d6f048e-55e4-4890-ae5f-9a6264b2baf4"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Stored Procedures - SQL Server.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev", "Benefits", "Types", "Related", "Related", "Appendix"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2021-11-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Stored Procedures - SQL Server"
---

# Stored Procedures - SQL Server

*Source: [Stored Procedures (Database Engine) - SQL Server | Microsoft Docs](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver15)*

*See Also: [[SQL Stored Procedures Best Practices]]*

## Contents

- [[#Benefits of Using Stored Procedures|Benefits of Using Stored Procedures]]
- [[#Types of Stored Procedures|Types of Stored Procedures]]
- [[#Related Tasks|Related Tasks]]
- [[#Related Content|Related Content]]
- [[#Appendix: Links|Appendix: Links]]


## Benefits of Using Stored Procedures

The following list describes some benefits of using procedures.

Reduced server/client network traffic  
The commands in a procedure are executed as a single batch of code. This can significantly reduce network traffic between the server and client because only the call to execute the procedure is sent across the network. Without the code encapsulation provided by a procedure, every individual line of code would have to cross the network.

Stronger security  
Multiple users and client programs can perform operations on underlying database objects through a procedure, even if the users and programs do not have direct permissions on those underlying objects. The procedure controls what processes and activities are performed and protects the underlying database objects. This eliminates the requirement to grant permissions at the individual object level and simplifies the security layers.

The [EXECUTE AS](https://docs.microsoft.com/en-us/sql/t-sql/statements/execute-as-clause-transact-sql?view=sql-server-ver15) clause can be specified in the CREATE PROCEDURE statement to enable impersonating another user, or enable users or applications to perform certain database activities without needing direct permissions on the underlying objects and commands. For example, some actions such as TRUNCATE TABLE, do not have grantable permissions. To execute TRUNCATE TABLE, the user must have ALTER permissions on the specified table. Granting a user ALTER permissions on a table may not be ideal because the user will effectively have permissions well beyond the ability to truncate a table. By incorporating the TRUNCATE TABLE statement in a module and specifying that module execute as a user who has permissions to modify the table, you can extend the permissions to truncate the table to the user that you grant EXECUTE permissions on the module.

When calling a procedure over the network, only the call to execute the procedure is visible. Therefore, malicious users cannot see table and database object names, embed Transact-SQL statements of their own, or search for critical data.

Using procedure parameters helps guard against SQL injection attacks. Since parameter input is treated as a literal value and not as executable code, it is more difficult for an attacker to insert a command into the Transact-SQL statement(s) inside the procedure and compromise security.

Procedures can be encrypted, helping to obfuscate the source code. For more information, see [SQL Server Encryption](https://docs.microsoft.com/en-us/sql/relational-databases/security/encryption/sql-server-encryption?view=sql-server-ver15).

Reuse of code  
The code for any repetitious database operation is the perfect candidate for encapsulation in procedures. This eliminates needless rewrites of the same code, decreases code inconsistency, and allows the code to be accessed and executed by any user or application possessing the necessary permissions.

Easier maintenance  
When client applications call procedures and keep database operations in the data tier, only the procedures must be updated for any changes in the underlying database. The application tier remains separate and does not have to know how about any changes to database layouts, relationships, or processes.

Improved performance  
By default, a procedure compiles the first time it is executed and creates an execution plan that is reused for subsequent executions. Since the query processor does not have to create a new plan, it typically takes less time to process the procedure.

If there has been significant change to the tables or data referenced by the procedure, the pre-compiled plan may actually cause the procedure to perform slower. In this case, recompiling the procedure and forcing a new execution plan can improve performance.

## Types of Stored Procedures

**User-defined**  
A user-defined procedure can be created in a user-defined database or in all system databases except the **Resource** database. The procedure can be developed in either Transact-SQL or as a reference to a Microsoft .NET Framework common runtime language (CLR) method.

**Temporary**  
Temporary procedures are a form of user-defined procedures. The temporary procedures are like a permanent procedure, except temporary procedures are stored in **tempdb**. There are two types of temporary procedures: local and global. They differ from each other in their names, their visibility, and their availability. Local temporary procedures have a single number sign (#) as the first character of their names; they are visible only to the current user connection, and they are deleted when the connection is closed. Global temporary procedures have two number signs (##) as the first two characters of their names; they are visible to any user after they are created, and they are deleted at the end of the last session using the procedure.

**System**  
System procedures are included with SQL Server. They are physically stored in the internal, hidden **Resource** database and logically appear in the **sys** schema of every system- and user-defined database. In addition, the **msdb** database also contains system stored procedures in the **dbo** schema that are used for scheduling alerts and jobs. Because system procedures start with the prefix **sp_**, we recommend that you do not use this prefix when naming user-defined procedures. For a complete list of system procedures, see [System Stored Procedures (Transact-SQL)](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/system-stored-procedures-transact-sql?view=sql-server-ver15)

SQL Server supports the system procedures that provide an interface from SQL Server to external programs for various maintenance activities. These extended procedures use the xp_ prefix. For a complete list of extended procedures, see [General Extended Stored Procedures (Transact-SQL)](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/general-extended-stored-procedures-transact-sql?view=sql-server-ver15).

**Extended User-Defined**  
Extended procedures enable creating external routines in a programming language such as C. These procedures are DLLs that an instance of SQL Server can dynamically load and run.

## Related Tasks

| Task Description                                                        | Topic                                                                                                                                                                                        |
| ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Describes how to create a stored procedure.                             | [Create a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/create-a-stored-procedure?view=sql-server-ver15)                                     |
| Describes how to modify a stored procedure.                             | [Modify a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/modify-a-stored-procedure?view=sql-server-ver15)                                     |
| Describes how to delete a stored procedure.                             | [Delete a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/delete-a-stored-procedure?view=sql-server-ver15)                                     |
| Describes how to execute a stored procedure.                            | [Execute a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/execute-a-stored-procedure?view=sql-server-ver15)                                   |
| Describes how to grant permissions on a stored procedure.               | [Grant Permissions on a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/grant-permissions-on-a-stored-procedure?view=sql-server-ver15)         |
| Describes how to return data from a stored procedure to an application. | [Return Data from a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/return-data-from-a-stored-procedure?view=sql-server-ver15)                 |
| Describes how to recompile a stored procedure.                          | [Recompile a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/recompile-a-stored-procedure?view=sql-server-ver15)                               |
| Describes how to rename a stored procedure.                             | [Rename a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/rename-a-stored-procedure?view=sql-server-ver15)                                     |
| Describes how to view the definition of a stored procedure.             | [View the Definition of a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/view-the-definition-of-a-stored-procedure?view=sql-server-ver15)     |
| Describes how to view the dependencies on a stored procedure.           | [View the Dependencies of a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/view-the-dependencies-of-a-stored-procedure?view=sql-server-ver15) |
| Describes how Parameters are used in a stored procedure.                | [Parameters](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/parameters?view=sql-server-ver15)                                                                   |

## Related Content

[CLR Stored Procedures](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql/clr-stored-procedures)  
[Deferred name resolution](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver15#deferred-name-resolution)

***

## Appendix: Links

- [[SQL Stored Procedures Best Practices]]
- [[SQL]]
- [[SQL Server]]
- [[ETL]]
- [[ETL Data Warehousing Best Practices]]
- [[Data Warehouse]]
- [[Data Warehousing Roadmap]]
- [[Data Engineering]]
- [[03 - AREAS/Technology/Data Engineering/Data Science]]


*Backlinks:*

```dataview
list from [[Stored Procedures - SQL Server]] AND -"Changelog"
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