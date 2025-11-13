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
    )

    #$Global:PrismServerConnection = @()
    <#
    $Global:PrismServerConnection += [PrismSession]@{
    "BaseUrl"   = "https://$($PrismCentralServer):$($PrismCentralServerPort)/api"
    "Authorization" = "$($BasicAuthValue)"
    }
    
    #>
    [System.Collections.HashTable]$Global:PrismServerConnection = @{}
    

    if ($PSCmdlet.ParameterSetName -eq "BasicAuth") {
        $Username = $Credential.GetNetworkCredential().UserName
        $Password = $Credential.GetNetworkCredential().Password
        
        # create the HTTP Basic Authorization header
        
        $UserPassPair = $Username + ":" + $Password
        $ToBytes = [System.Text.Encoding]::ASCII.GetBytes($UserPassPair)
        $BytesToBase64 = [System.Convert]::ToBase64String($ToBytes)
        $BasicAuthValue = "Basic $BytesToBase64"

        $Global:PrismServerConnection = @{
            "BaseUrl"   = "https://$($PrismCentralServer):$($PrismCentralServerPort)/api"
            "Authorization" = "$($BasicAuthValue)"
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