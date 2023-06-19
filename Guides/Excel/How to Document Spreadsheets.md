---
Date: 2023-06-19
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ "Spreadsheet Documentation" ]
---

# How to Document Spreadsheets

> [!SOURCE] Sources
> - *[Spreadsheet Documentation | Excel Spreadsheets | Audit Excel](https://www.auditexcel.co.za/article/spreadsheet-documentation-using-only-excels-inbuilt-tools/)*

## Contents

- [Overview](#overview)
	- [Minimum Requirements for the Spreadsheet's Documentation](#minimum-requirements-for-the-spreadsheets-documentation)
- [Appendix: Links and References](#appendix-links-and-references)
	- [Internal Linked Notes](#internal-linked-notes)
	- [External References](#external-references)
		- [Backlinks](#backlinks)

## Overview

Spreadsheets should have *sufficient documentation* to enable an independent person to understand and use the spreadsheet model. 

The documentation should give a clear indication of the history of the spreadsheet and significant events in the spreadsheets life cycle. 

This can be achieved by adding a worksheet into the spreadsheet, labeled `Documentation`, which should cover a number of aspects (identified below) and must be updated regularly.

This worksheet can then be printed out and kept as a hard copy if necessary and referred to by the auditors periodically to ensure it is being updated.

To start, create a `Worksheet` for all spreadsheets (old and new alike) and document certain key information. See below for the suggeted minimum requirements for the documentation content.

### Minimum Requirements for the Spreadsheet's Documentation

- **Filename and Path:** 
	- The name of the file and where it is stored. 
	- The easiest way to achieve this is to put a formula in a cell with the formula `CELL("FILENAME")` which will automatically update itself with the current storage location and filename.

- **Date:**
	- The current date. 
	- Can use the formula `NOW()`.
	- This is more for printing purposes.

- **SpreadSheet Owner/Creator/Maintainer:**
	- The name of the person responsible for the spreadsheet. 
	- This may include a history if the owner has changed over the years.

- **Overview:**
	- This sets out the objectives of the spreadheet's model, its basic structure, the sensitivities and scenarios that it does (and does not) perform, and any run-time performance requirements (e.g. iterations must be switched on, it operates on manual calculation etc).

- **How To's:**
	- Description of how to use the spreadsheet. 
	- Any unusual features should be noted (i.e. it has a purposeful circular reference; it works on manual calculation, etc.) 
	- Should also include a legend explaining the meaning of colours, abbreviations, etc. in the spreadsheet.

- **Output:**
	- Describes who the model is intended for, what the model is used for, what types of reports are generated and what information is on those reports at a high level. This may include what sections of the spreadsheet are irrelevant (they should be deleted but sometimes spreadsheets are so intricately linked that staff are scared to delete anything).

- **Calculations**: 
	- This describes the functionality of each calculation module, not on a line by line basis but in sufficient detail for business users to understand how the calculations work. A flow diagram may be useful here.

- **Input**: 
	- This lists the required input data e.g. databases, system owners / business users, files, user keyed data or messages with a full description of sources and formats of the inputs. Inputs also refer to assumptions made, and indicate the ownership of the data. For links to other spreadsheets you can use the ‘External links’ feature in Excel to identify them (watch the adjacent video clip or see the text explanation below on how to do it).

- **Initial Testing Log**: 
	- Information required includes the date of testing, who performed it, what type of tests were performed (see testing explanation) and summary of corrections made.

- **Change Log**: 
	- Changes made to the spreadsheet should be noted within the spreadsheet. In particular the items to be noted should be the date of change, version of the spreadsheet (full spreadsheet name as each significant change should result in a new version of the spreadsheet- see [[Version Control]]), person performing the changes, a brief rational for the changes, and confirmation of testing performed on the changes.

***

## Appendix: Links and References

*Note created on [[2023-06-19]] and last modified on [[2023-06-19]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[How to Document Spreadsheets]] AND -"CHANGELOG" AND -"How to Document Spreadsheets"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

