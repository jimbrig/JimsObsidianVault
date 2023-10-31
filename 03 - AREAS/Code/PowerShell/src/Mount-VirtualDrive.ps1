Function Mount-VirtualDrive {
    <#

    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [ValidateScript({Test-Path -Path $_ -PathType File -Filter "*.vhd*"})]
        [string]$Path,

        [Parameter(Mandatory=$False)]
        [string]$DriveLetter
    )

    Begin {
        Set-StrictMode -Version Latest
    }

    Process {

        try {
            Mount-VHD -Path $Path -ErrorAction Stop
        } catch {
            Write-Warning "Failed to mount $Path using Mount-VHD with PowerShell $($PSVersionTable.PSVersion)"
            Write-Verbose "Attempting to mount $Path using DISKPART"
            try {
                (("RESCAN`nSELECT VDISK FILE="$Path"`nATTACH VDISK`n") | DISKPART)
            } catch {
                Write-Warning "Failed to mount $Path using DISKPART"
                throw $_
            }
        }
    }

    End {}

}
