---
Date: 2023-07-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: [ "Convert XLS to XLSX" ]
---

# Convert XLS to XLSX

> [!NOTE] About
> 

## Contents

[TOC]

## Code

```embed-powershell
PATH: "vault://Code/PowerShell/src/Convert-XlsToXlsx.ps1"
TITLE: "Convert-XlsToXlsx.ps1"
```

## Details

> Details about what the code does.

Prior version:

```powershell
function Convert-ExcelXlstoXlsx {
    <#
        .Synopsis
            Converts a directory of Excel xls files to Excel xlsx
        .EXAMPLE
            Convert-ExcelXlstoXlsx -path 'c:\test', 'c:\test2'
        .EXAMPLE
            Convert-ExcelXlstoXlsx -path 'c:\test', 'c:\test2' -removeSourceFile
        .EXAMPLE
            'c:\test' | Convert-ExcelXlstoXlsx -removeSourceFile
        .AUTHOR
            Ben Taylor - 08/09/2017
    #>
    [CmdletBinding()]
    [OutputType()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateScript( {Test-Path -Path $_ } )]
        [string[]]
        $path,
        [switch]
        $removeSourceFile
    )

    begin {
        Add-Type -AssemblyName Microsoft.Office.Interop.Excel
    } process {
        forEach ($filePath in $path) {
            $workingFiles = Get-ChildItem -Path $filePath -Include *xls -recurse

            $workingFiles | ForEach-Object {
                Write-Verbose "Working on file $($_.fullname)"

                $workingFile = ($_.fullname).substring(0, ($_.FullName).lastindexOf(".")) + '.xlsx'

                if (-not (Test-Path -Path $workingFile)) {
                    Write-Verbose "Destination file $workingFile does not exist trying to convert"

                    try {
                        $xlFixedFormat     = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlOpenXMLWorkbook
                        $excel             = New-Object -ComObject excel.application
                        $excel.visible     = $true
                        $excel.Interactive = $true

                        # Open read only incase file has read only password or file in use.
                        $workbook = $excel.workbooks.open($_.fullname, $null, $true)

                        Start-Sleep -Seconds 2

                        $workbook.saveas($workingFile, $xlFixedFormat)
                        $workbook.close()

                        if((Test-Path $workingFile) -and ($removeSourceFile -eq $true)) {
                            Remove-Item -path $_.fullname -Force
                        }
                    } catch {
                        Write-Error $_
                    } finally {
                        $excel.Quit()
                        $excel = $null
                        [gc]::collect()
                        [gc]::WaitForPendingFinalizers()
                    }
                }
            }
        }
    }
}
```

***

## Appendix: Links and References

*Note created on [[2023-07-28]] and last modified on [[2023-07-28]].*

### Internal Linked Notes

- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[PowerShell - Convert XLS to XLSX]] AND -"CHANGELOG" AND -"Code/PowerShell/PowerShell - Convert XLS to XLSX"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

