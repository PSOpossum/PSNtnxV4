<#
.SYNOPSIS

Migrate VLAN subnets from VLAN basic to VLAN advanced

.DESCRIPTION

No description available.

.PARAMETER NTNXRequestId
A unique identifier that is associated with each request. The provided value must be opaque and preferably in Universal Unique Identifier (UUID) format. This identifier is also used as an idempotence token for safely retrying requests in case of network errors. All the supported Nutanix API clients add this auto-generated request identifier to each request. 

.PARAMETER NetworkingV41ConfigVlanSubnetMigrationSpec
Request body for subnet migrate operation.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

CreateBgpSession202Response
#>
function Move-Subnets {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${NTNXRequestId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${NetworkingV41ConfigVlanSubnetMigrationSpec},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Move-Subnets' | Write-Debug
		$PSBoundParameters | Out-DebugParameter | Write-Debug

        $LocalVarAccepts = @()
        $LocalVarContentTypes = @()
        $LocalVarQueryParameters = @{}
        $LocalVarHeaderParameters = @{}
        $LocalVarFormParameters = @{}
        $LocalVarCookieParameters = @{}
        $LocalVarBodyParameter = $null

        # HTTP header 'Accept' (if needed)
        $LocalVarAccepts = @('application/json')

        # HTTP header 'Content-Type'
        $LocalVarContentTypes = @('application/json')

        $LocalVarUri = '/networking/v4.1/config/$actions/migrate-subnets'

        if (!$NTNXRequestId) {
            throw "Error! The required parameter `NTNXRequestId` missing when calling migrateSubnets."
        }
        $LocalVarHeaderParameters['NTNX-Request-Id'] = $NTNXRequestId

        if (!$NetworkingV41ConfigVlanSubnetMigrationSpec) {
            throw "Error! The required parameter `NetworkingV41ConfigVlanSubnetMigrationSpec` missing when calling migrateSubnets."
        }

        $LocalVarBodyParameter = $NetworkingV41ConfigVlanSubnetMigrationSpec | ConvertTo-Json -Depth 100

        $LocalVarResult = Send-ApiRequest -Method 'POST' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "CreateBgpSession202Response" `
			-IsBodyNullable $false

        if ($NoHttpInfo.IsPresent) {
            return $LocalVarResult["Response"]
        } else {
            return $LocalVarResult
        }
    }
}

<#
.SYNOPSIS

Migrate vNICs from Acropolis to Atlas or vice-versa

.DESCRIPTION

No description available.

.PARAMETER ExtId
UUID of NIC to be migrated.

.PARAMETER NTNXRequestId
A unique identifier that is associated with each request. The provided value must be opaque and preferably in Universal Unique Identifier (UUID) format. This identifier is also used as an idempotence token for safely retrying requests in case of network errors. All the supported Nutanix API clients add this auto-generated request identifier to each request. 

.PARAMETER NetworkingV41ConfigVnicMigrationItemSpec
Request body for the vNIC migrate operation.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

CreateBgpSession202Response
#>
function Move-VnicById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${NTNXRequestId},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${NetworkingV41ConfigVnicMigrationItemSpec},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Move-VnicById' | Write-Debug
		$PSBoundParameters | Out-DebugParameter | Write-Debug

        $LocalVarAccepts = @()
        $LocalVarContentTypes = @()
        $LocalVarQueryParameters = @{}
        $LocalVarHeaderParameters = @{}
        $LocalVarFormParameters = @{}
        $LocalVarCookieParameters = @{}
        $LocalVarBodyParameter = $null

        # HTTP header 'Accept' (if needed)
        $LocalVarAccepts = @('application/json')

        # HTTP header 'Content-Type'
        $LocalVarContentTypes = @('application/json')

        $LocalVarUri = '/networking/v4.1/config/vnics/{extId}/$actions/migrate'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling migrateVnicById."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        if (!$NTNXRequestId) {
            throw "Error! The required parameter `NTNXRequestId` missing when calling migrateVnicById."
        }
        $LocalVarHeaderParameters['NTNX-Request-Id'] = $NTNXRequestId

        if (!$NetworkingV41ConfigVnicMigrationItemSpec) {
            throw "Error! The required parameter `NetworkingV41ConfigVnicMigrationItemSpec` missing when calling migrateVnicById."
        }

        $LocalVarBodyParameter = $NetworkingV41ConfigVnicMigrationItemSpec | ConvertTo-Json -Depth 100

        $LocalVarResult = Send-ApiRequest -Method 'POST' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "CreateBgpSession202Response" `
			-IsBodyNullable $false

        if ($NoHttpInfo.IsPresent) {
            return $LocalVarResult["Response"]
        } else {
            return $LocalVarResult
        }
    }
}

