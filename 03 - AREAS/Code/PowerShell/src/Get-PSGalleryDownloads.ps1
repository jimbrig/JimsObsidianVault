Function Get-PSGalleryDownloads {
    <#
    .SYNOPSIS
        Get the total downloads for a PowerShell Gallery package or packages.

    .DESCRIPTION
        This function uses the <https://img.shields.io/powershellgallery/> API endpoint to get the total downloads for
        a PowerShell Gallery package in JSON format and in turn converts the JSON to a PowerShell value object.

    .PARAMETER PackageName
        (Required) - The name of the package to get the total downloads for. Should be passed as a string or an array
        of strings representing the name of the package(s).

    .EXAMPLE
        > Get-PSGalleryDownloads -PackageName 'PSXLDevTools'

        > Name                           Value
        > ----                           -----
        > Total                          26
        > PSXLDevTools                   26

        # As you can see, the function returns a custom object with the total and the individual download counts.

    .EXAMPLE
        > Get-PSGalleryDownloads -PackageName 'PSXLDevTools', 'PSClearHost'

        > Name                           Value
        > ----                           -----
        > Total                          82
        > PSXLDevTools                   26
        > PSClearHost                    56

        # As you can see, the function returns a custom object with the total and the individual download counts for
        # each package.

    .INPUTS
        System.String[]

    .OUTPUTS
        System.Management.Automation.PSCustomObject

    .NOTES
        Author:     Jimmy Briggs <jimmy.briggs@jimbrig.com>
        Version:    1.0.0
        DateCreated: 2023-10-24

    #>
    [CmdletBinding()]
    Param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            HelpMessage = 'The name of the package to get the total downloads for.'
        )]
        [System.String[]]$PackageName
    )

    Begin {
        $TotalDownloads = 0
        $ReturnObject = @{
            Total = $TotalDownloads
        }
    }

    Process {

        try {
            $PackageName | ForEach-Object {
                $PackageDownloads = $null
                Write-Verbose "PackageName: $_"
                $URL = "https://img.shields.io/powershellgallery/dt/$_.json"
                Write-Verbose $URL
                $PackageDownloads = (((Invoke-WebRequest $Url) | ConvertFrom-JSON).Value)
                Write-Verbose "$_ downloads: $PackageDownloads"
                switch ($PackageDownloads) {
                    { $_ -match 'k' } {
                        $PackageDownloadsInt = [math]::Round([float]$PackageDownloads.Split('k')[0] * 1000)
                        $TotalDownloads = $TotalDownloads + $PackageDownloadsInt
                    } { $_ -match 'm' } {
                        $PackageDownloadsInt = [math]::Round([float]$PackageDownloads.Split('k')[0] * 1000000)
                        $TotalDownloads = $TotalDownloads + $PackageDownloadsInt
                    } DEFAULT {
                        $TotalDownloads = $TotalDownloads + $PackageDownloads
                    }
                }

                Write-Verbose "CurrentTotal: $TotalDownloads"
                $ReturnObject["$_"] = $PackageDownloads
            }
            $ReturnObject['Total'] = $TotalDownloads
        }
        catch {
            Write-Error $_.Exception.Message
        }
    }

    End {
        $ReturnObject
    }

}
