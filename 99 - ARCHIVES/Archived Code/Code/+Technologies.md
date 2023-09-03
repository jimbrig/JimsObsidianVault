```dataview  
TABLE  
length(file.inlinks) as Snippets  
FROM "Code" 
	AND !"Code/+Technologies" 
	AND !"Code/_README" 
	AND !"Code/CMD/_README" 
	AND !"Code/Bash/_README" 
	AND !"Code/PowerShell/_README"
	AND !"Code/VBA/_README"
	AND !"Code/GitHub Actions/_README"
SORT file.name  
```