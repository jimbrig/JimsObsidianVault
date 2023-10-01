
Function Get-MD5Hash {
    <#
    .SYNOPSIS
    Returns the MD5 hash of a file.
    .PARAMETER Path
    The path to the file to hash.
    .EXAMPLE
    Get-MD5Hash -Path C:\Temp\test.txt

    # Returns the MD5 hash of the file C:\Temp\test.txt.
    #>
    [CmdletBinding()]
    Param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Specify the path to the file to hash'
        )]
        [ValidateScript({ Test-Path $_ })]
        [String]$Path
    )

    Process {
        $filePath = Resolve-Path $Path
        $bytes = [IO.File]::ReadAllBytes($filePath)
        $hash = [Security.Cryptography.MD5]::Create().ComputeHash($bytes)
    }

    End {
        Write-Verbose -Message "Hash for $Path is $hash"
        [BitConverter]::ToString($hash).Replace('-', '').ToLowerInvariant()
    }
}

Function Export-ExcelVBAProject {
    <#
    .SYNOPSIS
    Exports Excel VBA Project Components (Classes, Modules, Forms, etc.) from a Workbook to individual files.

    .DESCRIPTION
    This script exports Excel VBA Project Components (Classes, Modules, Forms, etc.) from a Workbook to individual files.
    It exports the components to the specified output folder.
    The script also provides options to exclude certain modules from the export and to include auto-named items.

    .PARAMETER Path
    Specifies the path to the Excel VBA Enabled Workbook.

    .PARAMETER OutputPath
    Specifies the path to the output folder.

    .PARAMETER ExcludePattern
    Regular Expression Pattern indentifying any modules to exclude from the export.

    .PARAMETER IncludeAutoNamed
    Export items that may be auto-named, like Class1, Module2, etc.

    .PARAMETER Force
    Forces the command to run without asking for user confirmation.

    .EXAMPLE
    Export-ExcelVBAProject -Path "C:\Users\JohnDoe\Documents\Workbook.xlsm" -OutputPath "C:\Users\JohnDoe\Documents\VBAComponents" -ExcludePattern "Test*" -IncludeAutoNamed

    This example exports all VBA components from the Workbook located at "C:\Users\JohnDoe\Documents\Workbook.xlsm" to the folder "C:\Users\JohnDoe\Documents\VBAComponents". It excludes any modules that match the pattern "Test*" and includes auto-named items.

    .NOTES
    This script requires Microsoft Excel to be installed on the system.

    .LINK
    https://github.com/jimmywim/PowerShell/blob/master/src/Export-ExcelVBAProject.ps1

    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]

    Param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Specify the path to the Excel VBA Enabled Workbook'
        )]
        [ValidateScript({ Test-Path $_ })]
        [String]$Path,

        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = 'Specify the path to the output folder'
        )]
        [ValidateScript({ Test-Path $_ -PathType Container })]
        [String]$OutputPath,

        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Regular Expression Pattern indentifying any modules to exclude from the export.'
        )]
        [String]$ExcludePattern,

        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Export items that may be auto-named, like Class1, Module2, etc.'
        )]
        [Switch]$IncludeAutoNamed,

        [Parameter()]
        [Switch]$Force
    )

    Begin {
        Set-StrictMode -Version Latest

        # Ensure VBA Project Model Access in Registry
        $regPath = 'HKCU:\Software\Microsoft\Office\*\Excel\Security'
        $regKey = 'AccessVBOM'

        $Test = Get-ItemProperty -Path $regPath -Name $regKey -ErrorAction SilentlyContinue |
        Where-Object { $_.$regKey -eq 0 } |
        Measure-Object

        if ($Test.Count -eq 0) {
            Write-Warning -Message '[Warning]: Access to the VBA Project Model may be denied due to current security configuration.'
            Write-Warning -Message 'To enable VBA Project Model access, run the following command:'
            Write-Warning -Message "    Set-ItemProperty -Path $regPath -Name $regKey -Value 1 -PropertyType DWORD -Force"
        }

        $ExtByComponentType = @{
            100 = '.cls'
            1   = '.bas'
            2   = '.cls'
            3   = '.frm'
        }

        $OutputPath = ($OutputPath, (Get-Item .).FullName)[[String]::IsNullOrEmpty($OutputPath)]
        New-Item -Path $OutputPath -ItemType Directory -Force | Out-Null

        $TempFilePath = [IO.Path]::GetTempFileName()

        # Missing Type
        $Missing = [Type]::Missing
    }

    Process {
        Write-Verbose -Message "Exporting VBA Project Components from $Path to $OutputPath"
        $XL = New-Object -ComObject Excel.Application -ErrorAction Stop
        $XL.DisplayAlerts = $false

        Try {
            # Open(Filename, [UpdateLinks], [ReadOnly], [Format], [Password], [WriteResPassword], [IgnoreReadOnlyRecommended], [Origin], [Delimiter], [Editable], [Notify], [Converter], [AddToMru], [Local], [CorruptLoad])
            $WB = $XL.Workbooks.Open(
                $Path,
                $False,
                $True,
                $Missing, $Missing, $Missing, $Missing, $Missing, $Missing, $Missing, $Missing, $Missing, $Missing, $Missing,
                $True
            )

            $WB | Get-Member | Out-Null # Don't know why but next line doesn't work without this
            $Project = $WB.VBProject

            If ($null -eq $Project) {
                Write-Warning -Message "No VBA Project found in $Path"
                return
            }
            Else {
                $vbcomps = $Project.VBComponents

                If (!([String]::IsNullOrEmpty($ExcludePattern))) {

                    $Verbose = ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Verbose') -and $PSCmdlet.MyInvocation.BoundParameters['Verbose'].IsPresent)
                    If ($Verbose) {
                        Write-Verbose -Message "Excluding modules matching $ExcludePattern"
                        $ExcludedComponents = $vbcomps | Where-Object { $_.Name -match $ExcludePattern }
                        Write-Verbose -Message "Found $($ExcludedComponents.Count) matching components to exclude"
                    }

                    $vbcomps = $vbcomps | Where-Object { $_.Name -notmatch $ExcludePattern }

                }

                $vbcomps |
                Where-Object {
                    $vbcomp = $_
                    $name = $vbcomp.Name
                    $ext = $extByComponentType[$vbcomp.Type]
                    If ($null -eq $ext) {
                        Write-Verbose "Skipping component: $($name)"
                    }
                    ElseIf (!($IncludeAutoNamed -and $name -match '^(Form|Module|Class|Sheet)[0-9]+$')) {
                        Write-Verbose "Skipped possibly auto-named component: $name"
                    }
                    Else {
                        $vbcomp.Export($tempFilePath)
                        $exportedFilePath = Join-Path $outputPath "$name$ext"
                        $exists = Test-Path $exportedFilePath -PathType Leaf

                        if ($exists) {
                            $oldHash = Get-MD5Hash $exportedFilePath
                            $newHash = Get-MD5Hash $tempFilePath
                            $changed = !($oldHash -eq $newHash)
                            $status = ('Unchanged', 'Conflict', 'Unchanged', 'Changed')[[int]$changed + (2 * [int]$force.IsPresent)]
                        }
                        else {
                            $status = 'New'
                        }

                        if (($status -eq 'Changed' -or $status -eq 'New') -and $PSCmdlet.ShouldProcess($name)) {
                            Move-Item -Path $tempFilePath -Destination $exportedFilePath -Force
                        }

                        New-Object PSObject -Property @{
                            Name   = $name
                            Status = $status
                            File   = (Get-Item $exportedFilePath -ErrorAction Stop)
                        }
                    }
                }
            }

            $WB.Close($False, $Missing, $Missing)

        }
        Finally {
            $XL.Quit()
            [Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComObject]$xl) | Out-Null
            [GC]::Collect()
            [GC]::WaitForPendingFinalizers()
        }
    }

    End {
        Remove-Item -Path $TempFilePath -Force
    }
}
