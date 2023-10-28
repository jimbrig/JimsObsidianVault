Function Update-WslDistro {
    <#
    .SYNOPSIS
        Updates WSL distribution(s).
    .DESCRIPTION
        This function retrieves any WSL distribution that are installed on the system and updates them
        via `apt-get update` and `apt-get upgrade`.
    .PARAMETER DistroName
        (Optional) The name of the WSL distribution to update. If not specified, all WSL distributions will be updated.
    .EXAMPLE
        Update-WslDistro

        # Updates all WSL distributions.
    .EXAMPLE
        Update-WslDistro -DistroName Ubuntu

        # Updates the Ubuntu WSL distribution.
    .NOTES
        This function depends on the Wsl module, which is available on the PowerShell Gallery.
    .LINK
        https://github.com/psconfeu/2023/blob/main/MikeNelson/Terminal%20and%20WSL/Update-WslDistros.ps1
    #>
    #Requires -Modules Wsl
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string[]]$DistroName = $null
    )

    Begin {
        if (-not (Get-Command wsl -ErrorAction SilentlyContinue)) {
            Write-Error 'The wsl command is not available. Please ensure that you have the Windows Subsystem for Linux installed.'
            return
        }

        if ($null -eq $DistroName) {
            $DistroList = (Get-WslDistribution).Name | Where-Object { $_ -notlike '*docker*' }
        }
        else {
            $DistroList = (Get-WslDistribution).Name | Where-Object { $DistroName -contains $_ }
        }

        $steps = $DistroList.Count
    }

    Process {

        $UpdateCmds = @{
            'Ubuntu' = 'apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y autoclean'
            'Debian' = 'apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y autoclean'
            'Kali'   = 'apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y autoclean'
            'Alpine' = 'apk update && apk upgrade && apk autoremove && apk clean'

        }

        ForEach ($Distro in $DistroList) {
            Write-Progress -Activity 'Updating WSL Distributions' -Status "Updating $Distro..." -PercentComplete (($DistroList.IndexOf($Distro) / $steps) * 100)

            if ($Distro -like '*Debian*' -or $Distro -like '*Ubuntu*' -or $Distro -like '*Kali*') {
                wsl -d "$Distro" -u root -e apt-get -y update
                wsl -d "$Distro" -u root -e apt-get -y upgrade
                wsl -d "$Distro" -u root -e apt-get -y autoremove
                wsl -d "$Distro" -u root -e apt-get -y autoclean
            }

            if ($Distro -like '*Alpine*') {
                wsl -d "$Distro" -u root -e apk update
                wsl -d "$Distro" -u root -e apk upgrade
                wsl -d "$Distro" -u root -e apk autoremove
                wsl -d "$Distro" -u root -e apk clean
            }

            if ($Distro -like '*Arch*') {
                wsl -d "$Distro" -u root -e pacman -Syu
            }

            if ($Distro -like '*Fedora*') {
                wsl -d "$Distro" -u root -e dnf -y update
            }

            if ($Distro -like '*OpenSUSE*') {
                wsl -d "$Distro" -u root -e zypper -y update
            }

            if ($Distro -like '*CentOS*') {
                wsl -d "$Distro" -u root -e yum -y update
            }

            if ($Distro -like '*SLES*') {
                wsl -d "$Distro" -u root -e zypper -y update
            }

            if ($Distro -like '*Oracle*') {
                wsl -d "$Distro" -u root -e yum -y update
            }

            if ($Distro -like '*Gentoo*') {
                wsl -d "$Distro" -u root -e emerge --sync
                wsl -d "$Distro" -u root -e emerge -uDU --with-bdeps=y @world
            }
        }
    }

    End {
        Write-Progress -Activity 'Updating WSL Distributions' -Status 'Done' -Completed
        Write-Host 'Updated WSL Distributions.' -ForegroundColor Green
        return $true
    }
}

Function Write-ProgressHelper {
    param(
        [int]$StepNumber,
        [string]$Message
    )

    Write-Progress -Activity 'Title' -Status $Message -PercentComplete (($StepNumber / $steps) * 100)
}
