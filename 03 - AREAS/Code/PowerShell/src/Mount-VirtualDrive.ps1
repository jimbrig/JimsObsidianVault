Function Mount-VirtualDrive {
    <#

    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [ValidateScript({Test-Path -Path $_ -PathType File -Filter "*.vhd*"})]
        [string]$Path
    )

    $Success = 1


    try { Mount-VHD -Path $Path -ErrorAction Stop }
    catch {
        Write-Verbose "Failed to mount $Path using Mount-VHD with PowerShell $($PSVersionTable.PSVersion)"
        Write-Verbose "Attempting to mount $Path using DISKPART"
    }

    if ($?) {
        Write-Verbose "Successfully mounted $Path"
        $Success = 0
    }
    else {
        Write-Verbose "Failed to mount $Path"
        throw $_
    }

    try { (("RESCAN`n`rSELECT VDISK FILE="$Path"`n`rATTACH VDISK`n`r") | DISKPART) -ErrorAction Stop }
    catch { Write-Warning "Failed to mount $Path using DISKPART"; throw $_ }

    if ($?) {
        Write-Verbose "Successfully mounted $Path using DISKPART"
        $Success = 0
    }
    else {
        Write-Verbose "Failed to mount $Path using DISKPART"
        throw $_
    }

    return $Success
}
