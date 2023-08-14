Function ConvertFrom-Base64 {
    <#
    .SYNOPSIS
        Converts base64-encoded text to bytes or text.
    .DESCRIPTION
        Converts base64-ecoded text to bytes or text.
    .PARAMETER Data
        The base64-encoded text to decode.
    .PARAMETER Encoding
        The encoding to use when converting the decoded bytes to text. Default is 'byte'.
        Valid values are:
            ascii
            byte
            utf16
            utf16BE
            utf32
            utf32BE
            utf7
            utf8
    .PARAMETER UriStyle
        Indicates that the input is in URI-safe base64 format.
    .INPUTS
        System.String of base64-encoded text to decode.
    .OUTPUTS
        System.String or System.Byte[] of decoded text or data.
    .FUNCTIONALITY
        Data Encoding
    .LINK
        https://docs.microsoft.com/dotnet/api/system.convert.frombase64string
    .EXAMPLE
        ConvertFrom-Base64.ps1 dXNlcm5hbWU6QmFkUEBzc3dvcmQ= -Encoding utf8

        # username:BadP@ssword
    .EXAMPLE
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9' | ConvertFrom-Base64.ps1 -Encoding ascii -UriStyle

        # {"alg":"HS256","typ":"JWT"}
    #>
    [CmdletBinding()]
    [OutputType([String], [Byte[]])]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [String]$Data,
        [Parameter(
            Position = 1
        )]
        [ValidateSet('ascii', 'byte', 'utf16', 'utf16BE', 'utf32', 'utf32BE', 'utf7', 'utf8')]
        [String]$Encoding = 'byte',
        [Switch]$UriStyle
    )
    Process {
        if ($UriStyle) {
            $Data = $Data -replace '-', '+' -replace '_', '/'
            $Data += New-Object string '=', (3 - (($Data.Length - 1) % 4))
        }
        $value = [Convert]::FromBase64String($Data)
        if ($Encoding -eq 'byte') { $value }
        else {
            $encoder = [Text.Encoding]::GetEncoding(($Encoding -replace '^utf', 'utf-'))
            $encoder.GetString($value)
        }
    }
}
