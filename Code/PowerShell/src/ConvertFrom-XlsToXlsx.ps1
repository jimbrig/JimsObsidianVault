Function Convert-ExcelXlstoXlsx {
    <#
        .SYNOPSIS
            Converts file(s) from `.xls` to `.xlsx` for Excel.
        .DESCRIPTION
            This function will convert file(s) from `.xls` to `.xlsx` for Excel using the `Microsoft.Office.Interop.Excel`
            assembly. This function will not overwrite existing `.xlsx` files.  If the `-RemoveSourceFile` switch is used
            the original `.xls` file will be removed.
        .PARAMETER Path
            The path to the file(s) to convert. This can be a single file or a directory.  If a directory is specified
            all `.xls` files in the directory will be converted. If a directory is specified and the `-Recurse` switch
            is used all `.xls` files in the directory and all subdirectories will be converted. Also note that array
            input is supported to list multiple file paths at once.
        .PARAMETER RemoveSourceFile
            If this switch is used the original `.xls` file will be removed after the conversion is complete.
        .EXAMPLE
            ConvertFrom-XlsToXlsx -Path 'C:\Test', 'C:\Test2\'

            This will convert all `.xls` files in both the `C:\Test` and `C:\Test2\ directories to `.xlsx` files,
            keeping the original `xls` file in-place.
        .EXAMPLE
            ConvertFrom-XlsToXlsx -Path 'C:\Test', 'C:\Test2\' -RemoveSourceFile

            This will convert all `.xls` files in both the `C:\Test` and `C:\Test2\ directories to `.xlsx` files,
            removing the original `xls` file after the conversion is complete.
        .EXAMPLE
            ConvertFrom-XlsToXlsx -Path 'C:\Test', 'C:\Test2\' -Recurse

            This will convert all `.xls` files in both the `C:\Test` and `C:\Test2\ directories and all subdirectories
            to `.xlsx` files, keeping the original `xls` file in-place.
        .EXAMPLE
            ConvertFrom-XlsToXlsx -Path 'C:\Test', 'C:\Test2\' -Recurse -RemoveSourceFile

            This will convert all `.xls` files in both the `C:\Test` and `C:\Test2\ directories and all subdirectories
            to `.xlsx` files, removing the original `xls` file after the conversion is complete.
        .NOTES
            Name: ConvertFrom-XlsToXlsx
            Version: 1.0
            Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
            Creation Date: 2019-10-01
        .OUTPUTS
            None - This function does not return any PowerShell objects, but is used for its side-effects
            (i.e. converting the file(s) from `.xls` to `.xlsx`).
    #>
    [CmdletBinding()]
    [OutputType()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateScript( { Test-Path -Path $_ } )]
        [String[]]$Path,
        [Parameter(Mandatory = $false, ValueFromPipeline = $false)]
        [Switch]$RemoveSourceFile,
        [Parameter(Mandatory = $false, ValueFromPipeline = $false)]
        [Switch]$Recurse
    )

    BEGIN {

        # Load the Excel Interop Assembly
        Add-Type -AssemblyName Microsoft.Office.Interop.Excel

    }

    PROCESS {


        ForEach ($FilePath in $Path) {

            $WorkingFiles = Get-ChildItem -Path $FilePath -Include *xls -Recurse

            $WorkingFiles | ForEach-Object {

                Write-Verbose "Working on file $($_.FullName)"

                $WorkingFile = ($_.FullName).SubString(0, ($_.FullName).LastIndexOf('.')) + '.xlsx'

                if (-not (Test-Path -Path $WorkingFile)) {

                    Write-Verbose "Destination file $WorkingFile does not exist trying to convert"

                    Try {

                        $xlFixedFormat = [Microsoft.Office.Interop.Excel.XlFileFormat]::xlOpenXMLWorkbook
                        $Excel = New-Object -ComObject Excel.Application
                        $Excel.Visible = $true
                        $Excel.Interactive = $true

                        # Open read-only in case file has read only password or file in use.
                        $Workbook = $Excel.Workbooks.Open($_.FullName, $null, $true)

                        Start-Sleep -Seconds 2

                        $Workbook.SaveAs($WorkingFile, $xlFixedFormat)
                        $Workbook.Close()

                        if ((Test-Path $WorkingFile) -and ($RemoveSourceFile -eq $true)) {
                            Remove-Item -Path $_.FullName -Force
                        }

                    } Catch {
                        Write-Error $_
                    } Finally {
                        $Excel.Quit()
                        $Excel = $null
                        [gc]::collect()
                        [gc]::WaitForPendingFinalizers()
                    }
                }
            }
        }
    }

    END {

        # Unload the Excel Interop Assembly
        Remove-Type -AssemblyName Microsoft.Office.Interop.Excel

        Write-Verbose 'Finished converting files'
    }
}
