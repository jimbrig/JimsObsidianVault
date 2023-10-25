Function Import-EdgeKeywords {
    <#
    .SYNOPSIS
        Adds search keywords to an Edge SQLite profile configuration.

    .DESCRIPTION
        Adds search keywords to an Edge SQLite profile configuration.

    .PARAMETER Data
        Object containing the search keyword details.

    .PARAMETER Profile
        The Edge profile to add the search keywords to. Defaults to the current profile.

    .INPUTS
        System.Management.Automation.PSObject containing the search keyword details.

    .FUNCTIONALITY
        System and updates

    .EXAMPLE
    Get-Content ~/backup/msedge-keywords.json |ConvertFrom-Json |Import-EdgeKeywords.ps1

    Restores Edge search keywords to the current profile from a backup file.
    #>
    #Requires -Version 3
    #Requires -Modules PSSQLite
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseProcessBlockForPipelineCommand', '',
        Justification = 'This script uses $input within an End block.')]
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')] Param(
        # Edge search keyword details.
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true)]
        [PSCustomObject]$Data,
        # The path to the SQLite file containing the Edge keywords table to import into.
        [Parameter(Position = 1)][string] $Path = "$env:LocalAppData\Microsoft\Edge\User Data\Default\Web Data"
    )

    Begin {
        if ((Get-Process msedge) -and $PSCmdlet.ShouldProcess('all Edge processes', 'kill')) {
            Get-Process msedge | Stop-Process -Force
        }
    }
    End {
        Invoke-SQLiteBulkCopy -DataTable ($input | Out-DataTable) -DataSource $Path -Table keywords -NotifyAfter 100 -ConflictClause Ignore
    }
}
