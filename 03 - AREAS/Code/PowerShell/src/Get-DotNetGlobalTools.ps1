. .\Use-Command.ps1

Function Get-DotNetGlobalTools {
    <#
    .SYNOPSIS
    Returns a list of global dotnet tools.
    .DESCRIPTION
    Returns a list of global dotnet tools.
    .PARAMETER Name
    The name of the tool to search for.
    .INPUTS
    System.String of the tool name to search for.
    .OUTPUTS
    System.Management.Automation.PSCustomObject containing the following properties:
        PackageName
        Version
        Authors
        Downloads
        Verified
    .FUNCTIONALITY
    DotNet
    #>
    [CmdletBinding()]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $false
        )]
        [String]$Name = '*'
    )

    Use-Command dotnet "$env:ProgramFiles\dotnet\dotnet.exe" -winget 

    foreach ($line in dotnet tool search $Name | Where-Object { $_ -match '^\S+\s+\d+(?:\.\d+)+\b' }) {
        $package, $version, $authors, $downloads, $verified = $line -split '\s\s+', 5
        [pscustomobject]@{
            PackageName = $package
            Version     = try { [semver]$version }catch { try { [version]$version }catch { $version } };
            Authors     = $authors
            Downloads   = $downloads
            Verified    = $verified.Trim() -eq 'x'
        }
    }
