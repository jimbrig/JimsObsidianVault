Function Export-InstalledPackages {
    <#
    .SYNOPSIS
    Exports the list of packages installed by various tools.

    .DESCRIPTION
    This function exports lists of packages installed by various tools.

    Currently the function supports:

    * WinGet Sources and Packages
    * Chocolatey Packages
    * Scoop Buckets and Packages
    * PowerShell Installed Modules, Scripts, and Repositories/Package Sources
    * Python PIP packages
    * Node.js NPM packages
    * R Packages (CRAN & GitHub Remotes)
    * VSCode & VSCode Insiders Extensions
    * DockerHub Extensions
    * GitHub CLI Extensions

    .FUNCTIONALITY
    System and updates

    .EXAMPLE
    Export-InstalledPackages.ps1 |ConvertTo-Json |Out-File ~/installed.json utf8

    Exports all known packages.
    #>

    #Requires -Version 7
    [CmdletBinding()] Param()

    $installed = @{PSModules = Get-Module -ListAvailable | Select-Object -Unique -ExpandProperty Name }

    # WinGet
    if (Get-Command winget -ErrorAction Ignore) {
        winget export -o "$env:temp\winget.json" | Out-Null
        $winget = Get-Content "$env:temp\winget.json" | ConvertFrom-Json
        $installed.Add('WinGetSources', @($winget.Sources.SourceDetails.Name))
        $installed.Add('WinGet', @($winget.Sources.Packages.PackageIdentifier))
    }

    # Chocolatey
    if (Get-Command choco -ErrorAction Ignore) {
        $installed.Add('Chocolatey', @(choco list --idonly | Select-Object -Skip 1 | Select-Object -SkipLast 1))
    }

    # Scoop
    if (Get-Command scoop -ErrorAction Ignore) {
        $installed.Add('ScoopBuckets', @(scoop bucket list | Select-Object -ExpandProperty Name))
        $installed.Add('Scoop', @(scoop list | Select-Object -ExpandProperty Name))
    }

    # NPM
    if (Get-Command npm -ErrorAction Ignore) {
        $installed.Add('Npm', @(npm list -g --json |
                ConvertFrom-Json -AsHashtable |
                Select-Object -ExpandProperty  dependencies |
                Select-Object -ExpandProperty Keys))
    }

    # Pip
    if (Get-Command pip -ErrorAction Ignore) {
        $installed.Add('Pip', @(pip list --format json | ConvertFrom-Json | Select-Object -ExpandProperty name))
    }

    # R
    if (Get-Command RScript -ErrorAction Ignore) {
        $installed.Add('RPackages', @(RScript "$HOME\bin\R\pkgs.R"))
    }

    # VSCode
    if (Get-Command code -ErrorAction Ignore) {
        $installed.Add('VSCodeExtensions', @(code --list-extensions))
    }

    # VSCode Insiders
    if (Get-Command code-insiders -ErrorAction Ignore) {
        $installed.Add('VSCodeInsidersExtensions', @(code-insiders --list-extensions))
    }

    # DotNet Tools
    if (Get-Command dotnet -ErrorAction Ignore) {
        $installed.Add('DotNetTools', @(dotnet tool list -g | Select-Object -Skip 2 | ForEach-Object { ($_ -split '\s+', 2)[0] }))
    }

    # GitHub CLI Extensions
    if (Get-Command gh -ErrorAction Ignore) {
        $installed.Add('GitHubExtensions', @(gh extension list | ForEach-Object { ($_ -split '\s+', 4)[2] }))
    }

    # Docker Extensions
    if (Get-Command docker -ErrorAction Ignore) {
        $installed.Add('DockerExtensions', @(docker extension list | ForEach-Object { ($_ -split '\s+', 2)[0] }))
    }

    # Espanso Packages
    if (Get-Command espanso -ErrorAction Ignore) {
        $installed.Remove('Espanso')
        $installed.Add('Espanso', (Get-ChildItem -Path  "$env:APPDATA\espanso\match\packages").Name)
    }

    # WSL Distros
    if (Get-Command wsl -ErrorAction Ignore) {
        $installed.Add('WSLDistros', @(wsl -l -q))
    }

    Write-Warning 'The exported packages are a verbose list that will probably require editing.'
    return $installed
}

# Function Get-InstalledRPackages {
#     <#
#     #>
#     [CmdletBinding()]
#     Param()

#     $RPkgs = @{}

#     $script = @'
# require(pak)
# require(pkgdepends)
# require(purrr)
# require(dplyr)
# require(fs)
# require(yaml)

# libs <- .libPaths()
# user_lib <- libs[1]

# user_pkgs <- fs::dir_ls(user_lib, type = "directory") %>% basename() %>% setdiff("_cache")

# pkgs <- pkgdepends::lib_status(user_lib, packages = user_pkgs)
# pkgs_cran <- pkgs |> dplyr::filter(repository == "CRAN", !is.na(package)) |> dplyr::pull(package)
# pkgs_gh <- pkgs |> dplyr::filter(remotetype == "github", !is.na(remotepkgref)) |> dplyr::pull(remotepkgref)
# c(pkgs_cran, pkgs_gh)
# '@
#     if (Get-Command RScript -ErrorAction Ignore) {
#         RScript $script
#     }

# }

# Rscript @'

# '@
