<#
    .DESCRIPTION
    Removes the variable containing the data for connecting to the Nutanix Prism Central v4 API server.

    .NOTES
    Author: PSOpossum
#>
function Disconnect-PrismServer {
    [CmdletBinding()]
    param ()

    $Global:PrismServerConnection = @()
}