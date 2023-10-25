Function Export-InstalledPackages {
    <#
    .SYNOPSIS
    Exports the list of packages installed by various tools.

    .FUNCTIONALITY
    System and updates

    .EXAMPLE
    Export-InstalledPackages.ps1 |ConvertTo-Json |Out-File ~/installed.json utf8

    Exports all known packages.
    #>

    #Requires -Version 7
    [CmdletBinding()] Param()

    $installed = @{PSModules = Get-Module -ListAvailable | Select-Object -Unique -ExpandProperty Name }

    if (Get-Command winget -ErrorAction Ignore) {
        winget export -o "$env:temp\winget.json" | Out-Null
        $winget = Get-Content "$env:temp\winget.json" | ConvertFrom-Json
        $installed.Add('WinGet', @($winget.Sources.Packages.PackageIdentifier))
    }
    if (Get-Command choco -ErrorAction Ignore) {
        $installed.Add('Chocolatey', @(choco list -l --idonly | Select-Object -Skip 1 | Select-Object -SkipLast 1))
    }
    if (Get-Command scoop -ErrorAction Ignore) {
        $installed.Add('ScoopBuckets', @(scoop bucket list | Select-Object -ExpandProperty Name))
        $installed.Add('Scoop', @(scoop list | Select-Object -ExpandProperty Name))
    }
    if (Get-Command npm -ErrorAction Ignore) {
        $installed.Add('Npm', @(npm list -g --json |
                ConvertFrom-Json -AsHashtable |
                Select-Object -ExpandProperty  dependencies |
                Select-Object -ExpandProperty Keys))
    }
    if (Get-Command pip -ErrorAction Ignore) {
        $installed.Add('Pip', @(pip list --format json | ConvertFrom-Json | Select-Object -ExpandProperty name))
    }
    if (Get-Command RScript -ErrorAction Ignore) {
        $installed.Add('RPackages', @(RScript -e "installed.packages()[,c('Package')]"))
    }
    if (Get-Command code -ErrorAction Ignore) {
        $installed.Add('VSCodeExtensions', @(code --list-extensions))
    }
    if (Get-Command dotnet -ErrorAction Ignore) {
        $installed.Add('DotNetTools', @(dotnet tool list -g | Select-Object -Skip 2 | ForEach-Object { ($_ -split '\s+', 2)[0] }))
    }
    if (Get-Command gh -ErrorAction Ignore) {
        $installed.Add('GitHubExtensions', @(gh extension list | ForEach-Object { ($_ -split '\s+', 4)[2] }))
    }
    if (Get-Command docker -ErrorAction Ignore) {
        $installed.Add
    }

    Write-Warning 'The exported packages are a verbose list that will probably require editing.'
    return $installed
}

Function Get-InstalledRPackages {
    <#
    #>
    [CmdletBinding()]
    Param()

    $RPkgs = @{}

    $script = @'
require(pak)
require(pkgdepends)
require(purrr)
require(dplyr)
require(fs)
require(yaml)

libs <- .libPaths()
user_lib <- libs[1]

user_pkgs <- fs::dir_ls(user_lib, type = "directory") %>% basename() %>% setdiff("_cache")

pkgs <- pkgdepends::lib_status(user_lib, packages = user_pkgs)
pkgs_cran <- pkgs |> dplyr::filter(repository == "CRAN", !is.na(package)) |> dplyr::pull(package)
pkgs_gh <- pkgs |> dplyr::filter(remotetype == "github", !is.na(remotepkgref)) |> dplyr::pull(remotepkgref)
c(pkgs_cran, pkgs_gh)
'@
    if (Get-Command RScript -ErrorAction Ignore) {
        RScript -e $script
    }

}
