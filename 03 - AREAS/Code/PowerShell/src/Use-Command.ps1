
Function Test-NewerFile {
    <#
    .SYNOPSIS
        Returns true if the difference file is newer than the reference file.
    .DESCRIPTION
        Returns true if the difference file is newer than the reference file.
    .PARAMETER ReferenceFile
        The file to compare against.
    .PARAMETER DifferenceFile
        The file to compare.
    .OUTPUTS
        System.Boolean indicating the difference file is newer.
    .FUNCTIONALITY
        Files
    .LINK
        Find-NewestFile
    .EXAMPLE
        Test-NewerFile $NewestFile $File

        # True if $NewestFile is newer than $File
    #>
    [CmdletBinding()]
    [OutputType([Bool])]
    Param(
        [Parameter(Position = 0)]
        [IO.FileInfo]$ReferenceFile,

        [Parameter(Position = 1)]
        [IO.FileInfo]$DifferenceFile
    )

    Write-Verbose "Comparing ReferenceFile: $ReferenceFile & DifferenceFile: $DifferenceFile"
    if (!$ReferenceFile -or !$ReferenceFile.Exists) { Write-Verbose 'Reference file does not exist.'; return $DifferenceFile.Exists }
    if (!$DifferenceFile -or !$DifferenceFile.Exists) { Write-Verbose 'Difference file does not exist.'; return $false }
    if ($ReferenceFile.VersionInfo.FileVersionRaw -lt $DifferenceFile.VersionInfo.FileVersionRaw)
    { Write-Verbose "Newer file version: $($ReferenceFile.VersionInfo.FileVersionRaw) < $($DifferenceFile.VersionInfo.FileVersionRaw)"; return $true }
    elseif ($ReferenceFile.VersionInfo.FileVersionRaw -gt $DifferenceFile.VersionInfo.FileVersionRaw)
    { Write-Verbose "Older file version: $($ReferenceFile.VersionInfo.FileVersionRaw) > $($DifferenceFile.VersionInfo.FileVersionRaw)"; return $false }
    if ($ReferenceFile.VersionInfo.ProductVersionRaw -lt $DifferenceFile.VersionInfo.ProductVersionRaw)
    { Write-Verbose "Newer product version: $($ReferenceFile.VersionInfo.ProductVersionRaw) < $($DifferenceFile.VersionInfo.ProductVersionRaw)"; return $true }
    elseif ($ReferenceFile.VersionInfo.ProductVersionRaw -gt $DifferenceFile.VersionInfo.ProductVersionRaw)
    { Write-Verbose "Older product version: $($ReferenceFile.VersionInfo.ProductVersionRaw) > $($DifferenceFile.VersionInfo.ProductVersionRaw)"; return $false }
    if ($ReferenceFile.LinkType -and $DifferenceFile.LinkType) {
        $targets = [string[]]$ReferenceFile.Target + [string[]]$DifferenceFile.Target
        if ($targets -and ($targets -icontains $ReferenceFile.FullName -or $target -icontains $DifferenceFile.FullName))
        { Write-Verbose 'Shared hardlink targets.'; return $false }
    }
    if ($ReferenceFile.Length -eq $DifferenceFile.Length) {
        $readbytes =
        if ((Get-Command Get-Content).Parameters.Encoding.ParameterType -eq [Text.Encoding]) { @{AsByteStream = $true } }
        else { @{Encoding = 'Byte' } }
        if (Get-Command -Verb Get -Noun FileHash) {
            if ((Get-FileHash $ReferenceFile).Hash -eq (Get-FileHash $DifferenceFile).Hash)
            { Write-Verbose 'Identical hash values.'; return $false }
        } elseif (!(Compare-Object (Get-Content $ReferenceFile @readbytes) (Get-Content $DifferenceFile @readbytes)))
        { Write-Verbose 'Identical contents.'; return $false }
    }
    if ($ReferenceFile.LastWriteTimeUtc -lt $DifferenceFile.LastWriteTimeUtc)
    { Write-Verbose "Newer date: $($ReferenceFile.LastWriteTimeUtc) < $($DifferenceFile.LastWriteTimeUtc)"; return $true }
    Write-Verbose 'Inconclusive.'
    return $false
}
Function Find-NewestFile {
    <#
        .SYNOPSIS
        Finds the most recent file.
        .INPUTS
        System.IO.FileInfo[] of files to compare.
        .OUTPUTS
        System.IO.FileInfo of the most recent file.
        .FUNCTIONALITY
        Files
        .LINK
        Test-NewerFile
        .EXAMPLE
        ls C:\java.exe -Recurse -ErrorAction Ignore | Find-NewestFile

        # Directory: C:\Program Files (x86)\Minecraft\runtime\jre-x64\1.8.0_25\bin
        # Mode                LastWriteTime         Length Name
        # ----                -------------         ------ ----
        # -a----              2017-02-05 15:03      190888 java.exe
    #>
    [CmdletBinding()]
    [OutputType([IO.FileInfo])]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromRemainingArguments = $true
        )]
        [IO.FileInfo[]]$Files
    )

    BEGIN {
        $NewestFile = $null
    }

    PROCESS {
        $Files | ForEach-Object {
            if (Test-NewerFile $NewestFile $_) {
                $NewestFile = $_
            }
        }
    }

    END {
        $NewestFile
    }
}

Function Set-ResolvedAlias {
    <#
    #>
    [CmdletBinding()]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true
        )]
        [String]$Name,

        [Parameter(
            Position = 1,
            Mandatory = $true
        )]
        [String]$Path
    )

    Set-Alias $Name (Resolve-Path $Path -EA SilentlyContinue | `
                Select-Object -ExpandProperty Path | `
                Find-NewestFile | `
                Select-Object -ExpandProperty FullName) -Scope Global
}

Function Use-Command {
    <#
    .SYNOPSIS
    Checks for the existence of the given command, and adds if missing and a source is defined.
    .DESCRIPTION
    Use-Command checks to see if a command exists by the name given. If the command does not exist, but the path is
    valid, an alias is created. Otherwise, if one of several installation methods is provided,
    an installation attempt is made before aliasing.
    .PARAMETER Name
    The name of the command to use.
    .PARAMETER Path
    The full path of the command, if installed.
    Accepts wildcards, as supported by Resolve-Path.
    .PARAMETER WindowsFeature
    The name of Windows OS feature to install if command is missing.
    .PARAMETER WinGetPackage
    The name of the Windows Package Manager package to install if the command is missing.
    .PARAMETER ChocolateyPackage
    The name of the Chocolatey package to install if the command is missing.
    .PARAMETER ScoopPackage
    The name of the Scoop package to install if the command is missing.
    .PARAMETER DotNetTool
    The name of the .NET global tool to install if the command is missing.
    .PARAMETER NugetPackage
    The name of the NuGet package to install if the command is missing.
    .PARAMETER NodePackage
    The name of the Node NPM package to install if the command is missing.
    .PARAMETER Version
    The specific package version to install.
    .PARAMETER InstallDir
    The directory to install NuGet or Node packages to.
    Node will create and use a "node_modules" folder under this one.
    Default is C:\Tools
    .PARAMETER WindowsInstaller
    The location (file or URL) of an MSI package to install if the command is missing.
    .PARAMETER InstallLevel
    The INSTALLLEVEL to pass to Windows Installer.
    Default is 32767
    .PARAMETER ExecutableInstaller
    The location (file or URL) of an .exe installer to use if the command is missing.
    .PARAMETER InstallerParameters
    Parameters to pass to the .exe installer.
    .PARAMETER ExecutePowerShell
    The URL or file path of a PowerShell script to download and execute to install the command if it is missing.
    .PARAMETER DownloadZip
    The URL to download a .zip file containing the command if it is missing.
    .PARAMETER DownloadUrl
    The URL to download the command from if it is missing.
    .PARAMETER Message
    A message to display, rather than attempting to install a missing command.
    .PARAMETER Fail
    Throw an exception rather than attempt to install a missing command.
    .FUNCTIONALITY
    Command
    .COMPONENT
    System.IO.Compression.FileSystem
    .LINK
    Find-NewestFile.ps1
    .LINK
    Resolve-Path
    .LINK
    https://chocolatey.org/
    .LINK
    https://docs.microsoft.com/dotnet/core/tools/global-tools
    .LINK
    https://www.nuget.org/
    .LINK
    https://www.npmjs.com/
    .LINK
    https://technet.microsoft.com/library/bb490936.aspx
    .LINK
    http://www.iheartpowershell.com/2013/05/powershell-supportsshouldprocess-worst.html

    .EXAMPLE
    Use-Command nuget $ToolsDir\NuGet\nuget.exe -url https://dist.nuget.org/win-x86-commandline/latest/nuget.exe

    # This example downloads and aliases nuget, if missing.

    .EXAMPLE
    Use-Command npm 'C:\Program Files\nodejs\npm.cmd' -cinst nodejs

    # This example downloads and silently installs node if npm is missing.

    .EXAMPLE
    Use-Command Get-ADUser $null -WindowsFeature RSAT-AD-PowerShell

    # This example downloads and installs the RSAT-AD-PowerShell module if missing.
#>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSAvoidUsingInvokeExpression', '', Justification = 'Some functionality currently requires executing script code.'
    )]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSReviewUnusedParameter', '', Justification = 'The Fail parameter is used to select a parameter set only.'
    )]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '', Justification = 'Set-ResolvedAlias is implied by the cmdlet.'
    )]
    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
    [OutputType([Void])]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true
        )]
        [String]$Name,

        [Parameter(
            Position = 1,
            Mandatory = $true
        )]
        [String]$Path,

        [Parameter(
            ParameterSetName = 'WindowsFeature'
        )]
        [Alias('WinFeature')]
        [String]$WindowsFeature,

        [Parameter(
            ParameterSetName = 'WinGetPackage'
        )]
        [Alias('winget')]
        [String]$WinGetPackage,

        [Parameter(
            ParameterSetName = 'ChocolateyPackage'
        )]
        [Alias('ChocoPackage', 'chocopkg', 'cinst')]
        [String]$ChocolateyPackage,

        [Parameter(
            ParameterSetName = 'ScoopPackage'
        )]
        [Alias('scoop')]
        [String]$ScoopPackage,

        [Parameter(
            ParameterSetName = 'DotNetTool'
        )]
        [Alias('DotNetGlobalTool', 'dotnet')]
        [String]$DotNetTool,

        [Parameter(
            ParameterSetName = 'NugetPackage'
        )]
        [Alias('nupkg')]
        [String]$NugetPackage,

        [Parameter(
            ParameterSetName = 'NodePackage'
        )]
        [Alias('npm')]
        [String]$NodePackage,

        [Parameter(
            ParameterSetName = 'ChocolateyPackage'
        )]
        [Parameter(
            ParameterSetName = 'NugetPackage'
        )]
        [Parameter(
            ParameterSetName = 'NodePackage'
        )]
        [ValidatePattern('\A\S+\z')]
        [String]$Version,

        [Parameter(
            ParameterSetName = 'NugetPackage'
        )]
        [Parameter(
            ParameterSetName = 'NodePackage'
        )]
        [Alias('dir')]
        [String]$InstallDir = 'C:\Tools',

        [Parameter(
            ParameterSetName = 'WindowsInstaller'
        )]
        [Alias('msi')]
        [Uri]$WindowsInstaller,

        [Parameter(
            ParameterSetName = 'WindowsInstaller'
        )]
        [Int]$InstallLevel = 32767,

        [Parameter(
            ParameterSetName = 'ExecutableInstaller'
        )]
        [Alias('exe')]
        [Uri]$ExecutableInstaller,

        [Parameter(
            ParameterSetName = 'ExecutableInstaller'
        )]
        [Alias('params')]
        [String[]]$InstallerParameters = @(),

        [Parameter(
            ParameterSetName = 'ExecutePS'
        )]
        [Alias('iex')]
        [Uri]$ExecutePowerShell,

        [Parameter(
            ParameterSetName = 'DownloadZip'
        )]
        [Alias('zip')]
        [Uri]$DownloadZip,

        [Parameter(
            ParameterSetName = 'DownloadUrl'
        )]
        [Alias('url')]
        [Uri]$DownloadUrl,

        [Parameter(
            ParameterSetName = 'WarnOnly'
        )]
        [Alias('msg')]
        [String]$Message,

        [Parameter(
            ParameterSetName = 'Fail'
        )]
        [Switch]$Fail
    )


    if ((Get-Command $Name -ErrorAction Ignore)) { Write-Verbose "$Name command found." ; return }
    if ($Path -and (Test-Path $Path)) { Set-ResolvedAlias $Name $Path ; return }

    switch ($PSCmdlet.ParameterSetName) {
        WindowsFeature {
            if (!(Get-Command Install-WindowsFeature -ErrorAction Ignore))
            { throw "Install-WindowsFeature not found, unable to install $WindowsFeature." }
            if ($PSCmdlet.ShouldProcess($WindowsFeature, 'install Windows feature')) {
                Install-WindowsFeature $WindowsFeature
            } else { Write-Warning "Installation of $WindowsFeature was cancelled." }
        }

        ChocolateyPackage {
            if (!(Get-Command choco -ErrorAction Ignore))
            { throw "Chocolatey installer ""choco"" not found, unable to install $ChocolateyPackage." }
            if ($PSCmdlet.ShouldProcess($ChocolateyPackage, 'Chocolatey install')) {
                if ($Version) { choco install $ChocolateyPackage -y --version=$Version }
                else { choco install $ChocolateyPackage -y }
                if ($ChocolateyPackage -eq 'dot') { Write-Warning "You must run 'dot -c' as admin before Graphviz will work" }
                Set-ResolvedAlias $Name $Path
            } else { Write-Warning "Installation of $ChocolateyPackage was cancelled." }
        }

        DotNetTool {
            Use-Command.ps1 dotnet $env:ProgramFiles\dotnet\dotnet.exe -cinst dotnet
            if (!(Get-Command dotnet -ErrorAction Ignore))
            { throw "dotnet not found, unable to install $DotNetTool." }
            if ($PSCmdlet.ShouldProcess($DotNetTool, 'install .NET global tool')) { dotnet tool install -g $DotNetTool }
            else { Write-Warning "Installation of $DotNetTool was cancelled." }
        }

        NugetPackage {
            Use-Command.ps1 nuget $env:ChocolateyInstall\bin\nuget.exe -cinst NuGet.CommandLine
            if (!(Get-Command nuget -ErrorAction Ignore))
            { throw "NuGet not found, unable to install $NugetPackage." }
            if ($PSCmdlet.ShouldProcess("$NugetPackage in $InstallDir", 'NuGet install')) {
                if ($Version) { nuget install $NugetPackage -x -o $InstallDir -Version $Version -NonInteractive }
                else { nuget install $NugetPackage -x -o $InstallDir -NonInteractive }
                Set-ResolvedAlias $Name $Path
            } else { Write-Warning "Installation of $NugetPackage was cancelled." }
        }

        NodePackage {
            Use-Command.ps1 npm $env:ProgramFiles\nodejs\npm.cmd -cinst nodejs
            if (!(Get-Command npm -ErrorAction Ignore))
            { throw "Npm not found, unable to install $NodePackage." }
            if (!(Test-Path "$env:USERPROFILE\AppData\Roaming\npm" -PathType Container))
            { mkdir "$env:USERPROFILE\AppData\Roaming\npm" | Out-Null }
            if ($PSCmdlet.ShouldProcess("$NodePackage in $InstallDir", 'npm install')) {
                Push-Location $InstallDir
                if ($Version) { npm install $NodePackage@$Version }
                else { npm install $NodePackage }
                Pop-Location
                Set-ResolvedAlias $Name $Path
            } else { Write-Warning "Installation of $NodePackage was cancelled." }
        }

        WindowsInstaller {
            if (!(Get-Command msiexec -ErrorAction Ignore))
            { throw "Windows installer (msiexec) not found, unable to install $WindowsInstaller." }
            $file = $WindowsInstaller.Segments[$WindowsInstaller.Segments.Length - 1]
            if ($PSCmdlet.ShouldProcess("$file (INSTALLLEVEL=$InstallLevel)", 'Windows install')) {
                $msi =
                if ($WindowsInstaller.IsUnc)
                { Copy-Item $WindowsInstaller $env:TEMP; "$env:TEMP\$file" }
                elseif ($WindowsInstaller.IsFile)
                { [string]$WindowsInstaller }
                else
                { (New-Object System.Net.WebClient).DownloadFile($WindowsInstaller, "$env:TEMP\$file"); "$env:TEMP\$file" }
                msiexec /i $msi /passive /qb INSTALLLEVEL=$InstallLevel
                while (!(Test-Path $Path) -and $PSCmdlet.ShouldContinue(
                        "The file $Path was still not found. Continue waiting for installation?", 'Await Installation')) { Start-Sleep 5 }
                if (Test-Path $Path) { Set-ResolvedAlias $Name $Path }
            } else { Write-Warning "Installation of $WindowsInstaller was cancelled." }
        }

        ExecutableInstaller {
            $file = $ExecutableInstaller.Segments[$ExecutableInstaller.Segments.Length - 1]
            if ($PSCmdlet.ShouldProcess("$file $InstallerParameters", 'execute installer')) {
                $exe =
                if ($ExecutableInstaller.IsUnc)
                { Copy-Item $ExecutableInstaller.OriginalString $env:TEMP; "$env:TEMP\$file" }
                elseif ($ExecutableInstaller.IsFile)
                { [string]$ExecutableInstaller }
                else
                { (New-Object System.Net.WebClient).DownloadFile($ExecutableInstaller, "$env:TEMP\$file"); "$env:TEMP\$file" }
                Start-Process $exe $InstallerParameters -NoNewWindow -Wait
                while (!(Test-Path $Path) -and $PSCmdlet.ShouldContinue(
                        "The file $Path was still not found. Continue waiting for installation?", 'Await Installation')) { Start-Sleep 5 }
                if (Test-Path $Path) { Set-ResolvedAlias $Name $Path }
            } else { Write-Warning "Installation of $ExecutableInstaller was cancelled." }
        }

        ExecutePowerShell {
            if ($PSCmdlet.ShouldProcess($ExecutePowerShell, 'execute PowerShell script')) {
                switch ($ExecutePowerShell.Scheme) {
                    file { Invoke-Expression (Get-Content $ExecutePowerShell.OriginalString -Raw) }
                    default { Invoke-Expression ((New-Object net.webclient).DownloadString($ExecutePowerShell)) }
                }
            } else { Write-Warning "Execution of $ExecutePowerShell was cancelled." }
        }

        DownloadZip {
            $dir = Split-Path $Path
            if ($PSCmdlet.ShouldProcess("$DownloadZip to $dir", 'download/unzip')) {
                $filename = [IO.Path]::GetFileName($DownloadZip.LocalPath)
                if (!(Test-Path $dir -PathType Container)) { mkdir $dir | Out-Null }
                $zippath = Join-Path $env:TEMP $filename
                Write-Verbose "Downloading $DownloadZip to $path"
                Invoke-WebRequest $DownloadZip -OutFile $zippath
                try { [void][IO.Compression.ZipFile] }catch { Add-Type -AN System.IO.Compression.FileSystem }
                Write-Verbose "Copying zipped items from $zippath to $dir"
                [IO.Compression.ZipFile]::ExtractToDirectory($zippath, $dir)
                Set-ResolvedAlias $Name $Path
            } else { Write-Warning "Download/unzip of $Name was cancelled." }
        }

        DownloadUrl {
            if ($PSCmdlet.ShouldProcess("$DownloadUrl to $Path", 'download')) {
                $dir = Split-Path $Path
                if (!(Test-Path $dir -PathType Container)) { mkdir $dir | Out-Null }
                Invoke-WebRequest $DownloadUrl -OutFile $Path
                Set-ResolvedAlias $Name $Path
            } else { Write-Warning "Download of $Name was cancelled." }
        }

        WarnOnly {
            Write-Warning $Message
        }

        Fail {
            throw "$Name command not found!"
        }
    }

}
