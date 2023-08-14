Function ConvertTo-Base64 {
    <#
    .SYNOPSIS
    Converts bytes or text to base64-encoded text.
    .DESCRIPTION
    Converts bytes or text to base64-encoded text.
    .PARAMETER Data
    The bytes to encode.
    .PARAMETER Text
    The text to encode.
    .PARAMETER Encoding
    The encoding to use when converting the text to bytes. Default is 'utf8'.
    Valid values are:
        ascii
        utf16
        utf16BE
        utf32
        utf32BE
        utf7
        utf8
    .PARAMETER UriStyle
    Indicates that the output should be in URI-safe base64 format.
    .INPUTS
    System.String or System.Byte[] of data to base64-encode.
    .OUTPUTS
    System.String containing the base64-encoded data.
    .FUNCTIONALITY
    Data Encoding
    .LINK
    https://docs.microsoft.com/dotnet/api/system.convert.tobase64string
    .EXAMPLE
    ConvertTo-Base64 'username:BadP@ssword' utf8

    # dXNlcm5hbWU6QmFkUEBzc3dvcmQ=
    .EXAMPLE
    '{"alg":"HS256","typ":"JWT"}' | ConvertTo-Base64 -UriStyle

    # eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9

    .EXAMPLE
    ,[byte[]]@(0xEF,0xBB,0xBF,0x74,0x72,0x75,0x65,0x0D,0x0A) | ConvertTo-Base64

    # 77u/dHJ1ZQ0K
    #>
    [CmdletBinding()]
    [OutputType([String])]
    Param(
        [Parameter(ParameterSetName = 'BinaryData', Position = 0, Mandatory = $true, ValueFromPipeline = $true)]
        [Byte[]]$Data,

        [Parameter(ParameterSetName = 'TextData', Position = 0, Mandatory = $true, ValueFromPipeline = $true)]
        [String]$Text,

        [Parameter(ParameterSetName = 'TextData', Position = 1)]
        [ValidateSet('ascii', 'utf16', 'utf16BE', 'utf32', 'utf32BE', 'utf7', 'utf8')]
        [String]$Encoding = 'utf8',

        [Switch]$UriStyle
    )

    Process {
        if ($PSCmdlet.ParameterSetName -eq 'TextData') {
            $encoder = [Text.Encoding]::GetEncoding(($Encoding -replace '^utf', 'utf-'))
            $Data = $encoder.GetBytes($Text)
        }
        $value = [Convert]::ToBase64String($Data)
        if ($UriStyle) { $value.Trim('=') -replace '\+', '-' -replace '/', '_' }
        else { $value }
    }
}
