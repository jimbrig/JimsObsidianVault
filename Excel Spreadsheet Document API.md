---
Date: 2023-06-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Note", "#Topic/Unknown"]
Alias: [ ]
---

# Excel Spreadsheet Document API

## Components of a Spreadsheet

- Workbook
- Worksheets and Worksheet
- Cells, Ranges, Rows, and Columns
- Values and Formulas
- Formatting Components:
	- Document/Workbook Theme:
		- Fonts
		- Colors
		- Graphic Effects
	- Cell Styles:
		- Workbook's *StyleCollection* of available styles (built-in and custom styles)
		- Formatting:
			- **Alignment**: Horizontal and Vertical alignment of cell content, indentation and text wrap.
			- **Borders**: Cell border line styles and colors (Top, Bottom, Left, Right, etc.)
			- **Fill**: Background Color of the cell(s)
			- **Font**: Name, Color, Size, and Style(s) (Bold, Italic, Underline, Strikethrough, etc.)
			- **Number Format**: Cell's Number Format
			- **Protection**: Cell protection options (Locked and Hidden)
	
- Named Ranges (Defined Names)
- Shapes and Pictures
- Charts and Sparklines
- Tables or ListObjects
- PivotTables, PivotCharts, and PivotCaches
- Document Properties (Custom and BuiltIn/Default)
- Comments
- Hyperlinks
- 

## Classes and Interfaces

|    Class / Interface    |                                                       Description                                                       |
|:-----------------------:|:-----------------------------------------------------------------------------------------------------------------------:|
|       `Workbook`        | The root object of the spreadsheet engine that allows one to create, load, edit, save, and print spreadsheet documents. |
|       `Worksheet`       |                                         An individual sheet within a workbook.                                          |
|          `Row`          |                                                                                                                         |
|        `Column`         |                                                                                                                         |
|         `Cell`          |                                                                                                                         |
|       `CellRange`       |                                                                                                                         |
|       `CellValue`       |                                                                                                                         |
|      `Formatting`       |                                                                                                                         |
|    `RichTextString`     |                                                                                                                         |
| `ConditionalFormatting` |                                                                                                                         |
|      `DefinedName`      |                                                                                                                         |
|   `WorkbookFunctions`   |                                                                                                                         |
|    `ICustomFunction`    |                                                                                                                         |
|     `FormulaEngine`     |                                                                                                                         |
|       `Hyperlink`       |                                                                                                                         |
|        `Comment`        |                                                                                                                         |
|         `Shape`         |                                                                                                                         |
|        `Picture`        |                                                                                                                         |
|         `Chart`         |                                                                                                                         |
|       `Sparkline`       |                                                                                                                         |
|         `Table`         |                                                                                                                         |
|      `PivotTable`       |                                                                                                                         |
| `WorksheetDataBinding`  |                                                                                                                         |
|                         |                                                                                                                         |



***

## Appendix: Links and References

*Note created on [[2023-06-10]] and last modified on [[2023-06-10]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Excel Spreadsheet Document API]] AND -"CHANGELOG" AND -"//Excel Spreadsheet Document API"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

