Function Get-WordCount {
    <#
        .SYNOPSIS
            Returns the number of words in a file.
        .DESCRIPTION
            Returns the number of words in a file.
        .PARAMETER Path
            The path to the file (must be a file, not a directory).
        .EXAMPLE
            Get-WordCount -Path "$HOME\Documents\GitHub\PSObsidian\README.md"

            # Returns the number of words in the README.md file.
        .NOTES
            - Used by the function Get-VaultWordCount.
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ Test-Path -Path $_ -PathType Leaf })]
        [string]$Path
    )

    return (Get-Content -Path $Path -Raw | Measure-Object -Word).Words
}
