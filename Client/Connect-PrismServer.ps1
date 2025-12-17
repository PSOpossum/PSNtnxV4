<#
    .DESCRIPTION
    Wrapper for connecting to the Nutanix Prism Central v4 API server.

    .NOTES
    Author: PSOpossum
#>

function Connect-PrismServer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$PrismCentralServer
        ,
        [Parameter(Mandatory = $true)]
        [Int]$PrismCentralServerPort = 9440
        ,
        [Parameter(Mandatory = $true, ParameterSetName = "BasicAuth")]
        [PSCredential]$Credential
        ,
        [Parameter(Mandatory = $true, ParameterSetName = "ApiKey")]
        [PSCredential]$ApiKey
    )

    [System.Collections.HashTable]$Global:PrismServerConnection = @{}
    

    if ($PSCmdlet.ParameterSetName -eq "BasicAuth") {
        # create the HTTP Basic Authorization header
        $UserPassPair = $Credential.GetNetworkCredential().UserName + ":" + $Credential.GetNetworkCredential().Password
        $ToBytes = [System.Text.Encoding]::ASCII.GetBytes($UserPassPair)
        $BytesToBase64 = [System.Convert]::ToBase64String($ToBytes)
        $BasicAuthValue = "Basic $BytesToBase64"

        $Global:PrismServerConnection = @{
            "BaseUrl"   = "https://$($PrismCentralServer):$($PrismCentralServerPort)/api"
            "Authorization" = "$($BasicAuthValue)"
            "AuthorizationType" = "Basic"
            "AccessToken" = $null
            "Cookie" = $null
            "DefaultHeaders" = $null
            "ApiKey" = $null
            "ApiKeyPrefix" = $null
            "SkipCertificateCheck" = $false 
            "Proxy" = $null
        }
    } elseif ($PSCmdlet.ParameterSetName -eq "ApiKey") {
        
        $Global:PrismServerConnection = @{
            "BaseUrl"   = "https://$($PrismCentralServer):$($PrismCentralServerPort)/api"
            "Authorization" = $null
            "AuthorizationType" = "ApiKey"
            "AccessToken" = $null
            "Cookie" = $null
            "DefaultHeaders" = $null
            "ApiKey" = $null
            "ApiKeyPrefix" = $null
            "SkipCertificateCheck" = $false 
            "Proxy" = $null
        }
    }
}