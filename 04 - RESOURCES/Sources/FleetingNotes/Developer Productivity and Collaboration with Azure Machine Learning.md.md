---
ID: "46127836-5c41-4f34-b294-586ff2815ce1"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "Developer Productivity and Collaboration with Azure Machine Learning.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["Type/Slipbox", "Topic/Dev"]
Aliases:
  - "<% tp.file.title %>"
---

---
Date: 2021-11-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Developer Productivity and Collaboration with Azure Machine Learning"
---

# Developer Productivity and Collaboration with Azure Machine Learning

*Source: [TechNet - Developer Productivity and Collaboration with Azure Machine Learning](https://techcommunity.microsoft.com/t5/azure-ai/improving-collaboration-and-productivity-in-azure-machine/ba-p/2160906)*

## Collaboration and Sharing

An increasing number of data scientists and developers are creating notebooks collaboratively and sharing these notebooks across their team We heard feedback that most users feel like they are missing adequate tools to edit notebooks simultaneously or share their notebooks with a broader audience. Users often resort to screen shares and calls to complete or present work within a notebook. We recently just release a few new features to help combat some of these issues:

-   Co-editing (preview). Co-editing makes collaboration easier than ever. The notebook can now be shared by sending the notebook URL, allowing multiple users to edit the notebook in real-time.
- [Export Notebook as Python, LaTeX or HTML](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-run-jupyter-notebooks#export-a-notebook). When you feel satisfied with the results from your notebook and ready to present to your colleagues, you can export the notebook to various formats for easy sharing. LaTeX, HTML, and .py are currently supported.


## Data scientist & Developer Productivity

- Speed up workflows
	- a clear indication that a cell has finished running
	- a way to templatize common code excerpts
	- a way to check variable contents


- Productivity Features
	- Cell Status Bar: 
		- The status bar located in each cell indicates the cell state: whether a cell has been queued, successfully executed, or run into an error.
		- The status bar also displays the execution time of the last run.
	- [Variable Explorer.](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-run-jupyter-notebooks#explore-variables-in-the-notebook)
		- Provides a quick glance into the data type, size, and contents of your variables and dataframes, allowing for quicker and simpler debugging.

- Notebook snippets (preview):
	- Common Azure ML code excerpts are now available at your fingertips. 
	- Navigate to the code snippets panel, accessible via the toolbar, or activate the in-code snippets menu using `Ctrl + Space`.

- [IntelliCode](https://docs.microsoft.com/en-us/visualstudio/intellicode/overview). IntelliCode provides intelligent auto-completion suggestions using an ML algorithm that analyzes the context of your notebook code. IntelliCode suggestions are designated with a star.

- Keyboard shortcuts with full Jupyter parity. Azure ML now supports all the [keyboard shortcuts available in Jupyter](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-run-jupyter-notebooks#useful-keyboard-shortcuts) and more.
- [Table of Contents.](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-run-jupyter-notebooks#navigate-with-a-toc) For large notebooks, the Table of Contents panel then allows you to navigate to the desired section. The sections of the notebook are designated by the Markdown headers.
- Markdown Side-by-side Editor in Notebooks. Within each notebook, the new side-by-side editor allows you to view the rendered results of your Markdown cells directly in your notebook editing


***

https://docs.microsoft.com/en-us/azure/machine-learning/how-to-run-jupyter-notebooks

*Backlinks:*

```dataview
list from [[Developer Productivity and Collaboration with Azure Machine Learning]] AND -"Changelog"
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