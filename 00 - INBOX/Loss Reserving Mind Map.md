---
Date: 2023-10-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Diagram", "#Topic/Actuarial"]
Aliases: [ "Loss Map", "Loss Reserving Map" ]
---

# Loss Reserving Map Diagram

> [!SOURCE] Sources
> - *[[Loss Map Graphic.pdf]]*

```mermaid
graph TB
	subgraph "Incurred Losses"
		paid[Paid Losses]
		case[Case Reserves]
		inc[Incurred Losses]

		paid --> inc
		case --> inc
	end

	subgraph "Total IBNR"
		ibnr[IBNR Losses]
		known[Development on Known Claims]
		totibnr[Total IBNR]

		ibnr --> totibnr
		known --> totibnr
	end

	subgraph "Estimated Ultimate Losses"

	ult[Estimated Ultimate Losses]

	end
	
	totibnr --> ult
	inc --> ult
	
```

![[Loss Map Graphic.pdf]]


***

## Appendix: Links and References

*Note created on [[2023-10-05]] and last modified on [[2023-10-05]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Untitled]] AND -"CHANGELOG" AND -"//Untitled"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

