---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: raindrop
Link: https://www.surveyking.com/blog/excel-automation-explained/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - "Excel Automation Explained: VBA Code + Sample Workbooks"
  - "Excel Automation Explained: VBA Code + Sample Workbooks"
---
# Excel Automation Explained: VBA Code + Sample Workbooks

## Metadata
- Author: [[surveyking.com]]
- Full Title: Excel Automation Explained: VBA Code + Sample Workbooks
- Category: #Type/Highlight/Article
- Document Tags: [[excel]] [[VBA]] 
- URL: https://www.surveyking.com/blog/excel-automation-explained/

## Highlights
- When using native Excel functions inside of VBA, use Application. Instead of Application.WorksheetFunction. The application will not throw any run-time errors.
- You can use the underscore character to continue a VBA statement on a new line. This will make your code easier to read. In the sample workbook we provide, the email function uses this method.
- Use WITH to shorten your VBA code. This is commonly used only to type a range once, then use WITH to do multiple things with the range.
- Use the locals window in VBA to keep track and view the data inside variables. This is especially helpful for viewing arrays. You just need to add a breakpoint in your code. Highlight a line, then click F9. Then when the code runs, it will stop there, and all variables above that line will show in the locals window.
