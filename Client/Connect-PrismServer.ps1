<#
    .DESCRIPTION
    Wrapper for connecting to the Nutanix Prism Central v4 API server.

    .NOTES
    Author: PSOpossum

    .PARAMETER PrismCentralServer
    The url of the server. Can be the DNS name or the ip of the prism central endpoint. Don't prefix https://, just the hostname or ip.

    .PARAMETER PrismCentralServerPort
    The port for accessing the gui/api endpoint of prism central. It is an [int] variable.

    .PARAMETER BasicAuthCredential
    Username/Password for connectiong to the api with Basic Authorization

    .PARAMETER ApiKeyCredential
    X-Ntnx-Api-Key for connectiong to the api with an already configured API key.
#>

function Connect-PrismServer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$PrismCentralServer
        ,
        [Parameter(Mandatory = $false)]
        [Int]$PrismCentralServerPort
        ,
        [Parameter(Mandatory = $false, ParameterSetName = "BasicAuth")]
        [ValidateNotNull()]
        [System.Management.Automation.Credential()]
        [System.Management.Automation.PSCredential]$BasicAuthCredential = [System.Management.Automation.PSCredential]::Empty
        ,
        [Parameter(Mandatory = $false, ParameterSetName = "ApiKey")]
        [ValidateNotNull()]
        [System.Management.Automation.Credential()]
        [System.Management.Automation.PSCredential]$ApiKeyCredential = [System.Management.Automation.PSCredential]::Empty
    )

    [System.Collections.HashTable]$Global:PrismServerConnection = @{}

    if ($null -eq $PrismCentralServerPort) {
        Write-Verbose -Message 'A port was not specified in $PrismCentralServerPort, defaulting to 9440.'
        $PrismCentralServerPort = 9440
    }

    if ($PSCmdlet.ParameterSetName -eq "BasicAuth") {
        [pscredential]$Credential = $BasicAuthCredential

        # create the HTTP Basic Authorization header
        $UserPassPair = $Credential.GetNetworkCredential().UserName + ":" + $Credential.GetNetworkCredential().Password
        $ToBytes = [System.Text.Encoding]::ASCII.GetBytes($UserPassPair)
        $BytesToBase64 = [System.Convert]::ToBase64String($ToBytes)
        $BasicAuthValue = "Basic $BytesToBase64"

        $Global:PrismServerConnection = @{
            "BaseUrl" = "https://$($PrismCentralServer):$($PrismCentralServerPort)/api"
            "Authorization" = "$($BasicAuthValue)"
            "AuthorizationType" = "Basic"
            "AccessToken" = $null
            "Cookie" = $null
            "DefaultHeaders" = $null
            "X-Ntnx-Api-Key" = $null
            "ApiKeyPrefix" = $null
            "SkipCertificateCheck" = $false 
            "Proxy" = $null
        }
    } elseif ($PSCmdlet.ParameterSetName -eq "ApiKey") {
        [pscredential]$Credential = $ApiKeyCredential
        # TODO: figure out the apikey method.
        $Global:PrismServerConnection = @{
            "BaseUrl" = "https://$($PrismCentralServer):$($PrismCentralServerPort)/api"
            "Authorization" = $null
            "AuthorizationType" = "ApiKey"
            "AccessToken" = $null
            "Cookie" = $null
            "DefaultHeaders" = $null
            "X-Ntnx-Api-Key" = $ApiKey.GetNetworkCredential().Password
            "ApiKeyPrefix" = $null
            "SkipCertificateCheck" = $false 
            "Proxy" = $null
        }
    }
}