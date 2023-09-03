---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://www.spsanderson.com/steveondata/posts/rtip-2023-05-09/
Tags: ["#Type/Highlight/Article"]
Aliases: ["VBA to R and Back Again: Running R From VBA", "VBA to R and Back Again: Running R From VBA"]
---
# VBA to R and Back Again: Running R From VBA

## Metadata
- Author: [[Steven P. Sanderson II, MPH]]
- Full Title: VBA to R and Back Again: Running R From VBA
- Category: #Type/Highlight/Article
- URL: https://www.spsanderson.com/steveondata/posts/rtip-2023-05-09/

## Highlights
- Sub CallRnorm() ([View Highlight](https://read.readwise.io/read/01h06qk4ycjje094ydn6xtvk8p))
- This line defines a subroutine called “CallRnorm”. A subroutine is a block of code that can be executed repeatedly from any part of the code, and it starts with the “Sub” keyword followed by the subroutine name and any arguments in parentheses. ([View Highlight](https://read.readwise.io/read/01h06qkb5bp2scpjg7aeh7xnw3))
- Dim R As Variant [](https://www.spsanderson.com/steveondata/posts/rtip-2023-05-09/#cb2-2)Dim result As Variant ([View Highlight](https://read.readwise.io/read/01h06qkdh4yvgvg2kka78c561m))
- These two lines declare two variables named “R” and “result” as “Variant” data type. “Variant” is a data type that can store any type of data. ([View Highlight](https://read.readwise.io/read/01h06qkf6yr63k6e00pvean21r))
- R = "library(stats);rnorm(10) |> as.data.frame()" ([View Highlight](https://read.readwise.io/read/01h06qkma0cmm5h9p53vef54h3))
- result = VBA.CreateObject("WScript.Shell").Exec("C:\Program Files\R\R-4.1.2\bin\x64\Rscript.exe -e """ & R & """").StdOut.ReadAll ([View Highlight](https://read.readwise.io/read/01h06qks73b0bxskj7wset7h16))
- This line uses the “CreateObject” method to create a new object of the “WScript.Shell” class, which allows us to execute commands in the Windows command shell. It then uses the “Exec” method to execute the R code stored in the “R” variable using the “Rscript.exe” command-line tool, which runs R scripts from the command line. The result of the command is stored in the “result” variable by reading the output of the command using the “StdOut” property of the “Exec” object and the “ReadAll” method. ([View Highlight](https://read.readwise.io/read/01h06qkwb1yxzh0qzd4p27b2v7))
- result = Split(result, vbCrLf) [](https://www.spsanderson.com/steveondata/posts/rtip-2023-05-09/#cb6-2)For i = 0 To UBound(result) [](https://www.spsanderson.com/steveondata/posts/rtip-2023-05-09/#cb6-3)ActiveSheet.Range("A1").Offset(i, 0).Value = result(i) [](https://www.spsanderson.com/steveondata/posts/rtip-2023-05-09/#cb6-4)Next i ([View Highlight](https://read.readwise.io/read/01h06qm0gt9nbnk99r99ace7ca))
- These two lines split the result of the R code execution into an array of strings using the “Split” function and the newline character (vbCrLf) as the delimiter. It then loops through the array using a “For” loop and assigns each element to a cell in the active worksheet, starting from cell A1 and offsetting each cell by one row using the “Offset” method.
  So, in summary, this VBA code creates a subroutine that deletes column A from the active worksheet, executes a block of R code that generates 10 random numbers from a normal distribution and converts the result to a data frame, captures the output of the R code execution, splits the output into an array of strings, and pastes the result into column A of the active worksheet. ([View Highlight](https://read.readwise.io/read/01h06qm4tagcwg98808gmv57z3))
- Today I am going to briefly go over an extremely simple example of running some R code via Excel VBA. ([View Highlight](https://read.readwise.io/read/01h06qhqrb9c984adz41nx984y))
