---
Date Created: 2023-10-05
Date Modified: 2023-10-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Brainstorm"
  - "#Topic/Actuarial"
  - "#Topic/Dev"
Aliases:
  - Actuarial Database
  - actuaryDB
---

# Actuarial Relational Database Sample

> ![SOURCES]
> 

## Models

- Need a data model to operate the claims and loss development actuarial reserving data and workflows/business logic.
	- Individual Claims/Occurrence Lossruns by Evaluation Date
	- Tables to store actuarial selections and parameters/thresholds/selections (i.e. Loss Development Factors, Default Averages to Display, Dates and Versions, etc.) 
- Model for housing exposure data.
- Model for Policy Information and Details.
- Reporting (and Importing/Exporting) System
- Comments System
- Logging and Metadata
- Template System

## Tables

- **Policy**: Holds general information about the policies such as *Policy Number*, *Policy Inception Date*, *Policy Expiration Date*, etc.
- **Vehicle**: Keeps information about the insured vehicles. There could be more than one vehicle under a single policy, i.e. there is a *one-to-many* relationship between **Policy** and **Vehicle**.
- **Driver**: Houses details about the drivers involved with *policies that cover vehicles*. There can be more than one driver per policy, i.e. *one-to-many* relationship between **Policy** and **Driver**. Some driver attributes are *Driver Name*, *Date of Birth*, *SSN*, *Driver License Number*, etc.
- **VehicleDriver**: Combines vehicle and driver to manage the *many-to-many* relationship between **Driver** and **Vehicle** in the form of a *bridge table*. 
- **DriverAddress**:
- **TrafficViolationCode**
- **DriverTrafficViolationRecord**:
- **Bill**
- **PaymentDetail**:
- **Coverage**:
- **PolicyCoverage**:
- **VehicleCoverage**:
- **PolicyEditLog**:




***

## Appendix: Links and References

*Note created on [[2023-10-05]] and last modified on [[2023-10-16]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Actuarial Relational Database Sample]] AND -"CHANGELOG" AND -"00 - INBOX/Actuarial Relational Database Sample"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023