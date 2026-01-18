<#
.SYNOPSIS

Get audit details

.DESCRIPTION

No description available.

.PARAMETER ExtId
UUID of the generated audit.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

GetAuditById200Response
#>
function Get-AuditById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Get-AuditById' | Write-Debug
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

        $LocalVarUri = '/monitoring/v4.1/serviceability/audits/{extId}'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling getAuditById."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        $LocalVarResult = Send-ApiRequest -Method 'GET' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "GetAuditById200Response" `
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

List audits

.DESCRIPTION

No description available.

.PARAMETER Page
A URL query parameter that specifies the page number of the result set. It must be a positive integer between 0 and the maximum number of pages that are available for that resource. Any number out of this range might lead to no results. 

.PARAMETER Limit
A URL query parameter that specifies the total number of records returned in the result set.  Must be a positive integer between 1 and 100. Any number out of this range will lead to a validation error. If the limit is not provided, a default value of 50 records will be returned in the result set. 

.PARAMETER Filter
A URL query parameter that allows clients to filter a collection of resources. The expression specified with $filter is evaluated for each resource in the collection, and only items where the expression evaluates to true are included in the response. Expression specified with the $filter must conform to the [OData V4.01](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html) URL conventions. For example, filter '$filter=name eq 'karbon-ntnx-1.0' would filter the result on cluster name 'karbon-ntnx1.0', filter '$filter=startswith(name, 'C')' would filter on cluster name starting with 'C'.

.PARAMETER Orderby
A URL query parameter that allows clients to specify the sort criteria for the returned list of objects. Resources can be sorted in ascending order using asc or descending order using desc. If asc or desc are not specified, the resources will be sorted in ascending order by default. For example, '$orderby=templateName desc' would get all templates sorted by templateName in descending order.

.PARAMETER Select
A URL query parameter that allows clients to request a specific set of properties for each entity or complex type. Expression specified with the $select must conform to the [OData V4.01](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html) URL conventions. If a $select expression consists of a single select item that is an asterisk (i.e., *), then all properties on the matching resource will be returned.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

ListAudits200Response
#>
function Invoke-ListAudits {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${Page},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${Limit},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Filter},
        [Parameter(Position = 3, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Orderby},
        [Parameter(Position = 4, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Select},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Invoke-ListAudits' | Write-Debug
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

        $LocalVarUri = '/monitoring/v4.1/serviceability/audits'

        if ($Page) {
            $LocalVarQueryParameters['$page'] = $Page
        }

        if ($Limit) {
            $LocalVarQueryParameters['$limit'] = $Limit
        }

        if ($Filter) {
            $LocalVarQueryParameters['$filter'] = $Filter
        }

        if ($Orderby) {
            $LocalVarQueryParameters['$orderby'] = $Orderby
        }

        if ($Select) {
            $LocalVarQueryParameters['$select'] = $Select
        }

        $LocalVarResult = Send-ApiRequest -Method 'GET' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "ListAudits200Response" `
			-IsBodyNullable $false

        if ($NoHttpInfo.IsPresent) {
            return $LocalVarResult["Response"]
        } else {
            return $LocalVarResult
        }
    }
}

