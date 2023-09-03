---
ID: "190d0e02-96dc-4589-a87d-e172e2c68d76"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "programming as an actuary"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: []
Aliases:
  - "<% tp.file.title %>"
---

## Intended Audience
- senior actuarial managers
- chief actuaries
- senior insurance leaders

## Key Takeaways

- Programming is essential in actuarial and other analytical work, not an afterthought
- Actuarial teams need to be supported through training, access to tools, access to experts and adjusted hiring policies

## Programming Model and Workflows

### Project Managgement and Communication
- short development cycles - sprints, agile
- issue tracking, pipeline management
- Ditching email e.g. Slack, MS Teams, projection management systems, 

### Version Control

- Version Control leads to:
    - clear version history
    - backup, easy to revert if necessary
    - understanding why things went wrong
    - easier collaboration (both within teams and across teams), a process to merge changes by team members
    - being able to view changes
    - code reviews
    - pull requests (links to project management and CI)
    - no more accidental changes
    - no more  Jan 10 with RAS change final v3 RAS draft final v2.xslx

### Continuous Integration
- automated checks of changes
- automated builds
- automated deployments

### Don't Repeat Yourself (DRY)

- reduces chances of error
- better reuse of work
- modularisation

### Project and Code Documentation

### Testing

- test driven development
- unit testing
- batch testing
- reconciliation testing
- speed tests
- Aim to avoid backward steps, no regressions, speed slow downs
- Documentation coverage

### Containerised Environments

- reproducible code
- guarantees analysis/process works the same for everyone
- avoid deployment issues and manual work
- more responsibility for the developer

### Quality

## A Recipe for a Team

- Decide on a stack (but don't make it too rigid as new tech is coming in all the time)
        - Which base languages (R, Python, Julia, Scala, Matlab, C++, etc)
        - Which version control tool (Git, Murcurial, SVN)
        - Which version control server (GitHub, BitBucket, GitLab)
        - Which continuous integration and testing tool (Jenkins, CircleCI)
    - Coding style
        - For Python - PEP8, docstring standards
        - What for R
    - Documentation tools:
        - For Python: Sphynix, readthedocs
        - For R: Vignettes, etc
    - Learn Command Line, a base language and Git at the same time
    - Start with some 
    

## Standard Actuarial Team Model

- 'Get some data', explore an idea
- some rough work
- gets developed
- becomes messy, move on to the next problem
- needs to be maintained indefinitely
- data stored in silos
- lots of spreadsheets and links
- copies of logic
- easy for errors to slip in
- difficult to test
- how to version control
- how to refactor
- poor data visualisation options
- cannot extend to more advanced statistical methods
- difficult to follow - complex array formulas, nested if statements, formula in name definitions
- struggles with data changing size
- spreadsheets create dimension problems - restricted to 2 dimensions (how do you model a process that varies by class, underwriting and calendar year)

## Path Towards Adopting Best Practices

1. Engage with IT
    - Don't let IT own the conversation - just because you are talking in their language doesn't give them a right of refusal.
    - 'Spec it up and IT will implement it' is not often the solution
    - Explain what you need (simple but will develop over time):
        - access to software - almost everything is free (but you should try to contribute)
        - figure out how analysts can experiment with new tools and approaches in work - staff shouldn't have to figure this out in their own time or on their own machines first
        - websites
        - hardware (down the line)
        - try to find IT staff interested (they should be for their own development)

2.  Training:
    - Add to objectives
    - loads of stuff for free
    - Lots of online courses use Freemium model (e.g. Datacamp, etc) - provide subscriptions
    - Go on training courses
    - In house training / lunch-and-learns (give people time to run these)
    - Aim for a mix of skills in the team
        - actuarial teams tend to be full of actuaries
        - analysts in other industries might mix data architects, data scientists, PhDs alongside domain experts
    - Who is supporting teams in projects
        - consider external consultants on a retainer basis if expertise not available in house

3.  Start simple
    - Give people time / avoid the temptation to rush for results
    - Show off progress to others in the team
    - Examples:
        - Try a new reserving method for a class of business
        - Validation of capital model output
        - An ETL process
        - A dashboard
        - NLP for claims
        - Clustering on a class of business
        
4.  Get Version Control into projects as soon as possible
    
Get some tools (luckily)



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