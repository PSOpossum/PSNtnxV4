<#
.SYNOPSIS

Clear the value in packet and byte counters of all Routing Policies in the chosen VPC or particular routing policy

.DESCRIPTION

No description available.

.PARAMETER NetworkingV41StatsRoutingPolicyClearCountersSpec
VPC UUID to reset all routing policy counters to zero.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

ClearRoutingPolicyCounters202Response
#>
function Clear-RoutingPolicyCounters {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${NetworkingV41StatsRoutingPolicyClearCountersSpec},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Clear-RoutingPolicyCounters' | Write-Debug
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

        $LocalVarUri = '/networking/v4.1/stats/routing-policies/$actions/clear'

        if (!$NetworkingV41StatsRoutingPolicyClearCountersSpec) {
            throw "Error! The required parameter `NetworkingV41StatsRoutingPolicyClearCountersSpec` missing when calling clearRoutingPolicyCounters."
        }

        $LocalVarBodyParameter = $NetworkingV41StatsRoutingPolicyClearCountersSpec | ConvertTo-Json -Depth 100

        $LocalVarResult = Send-ApiRequest -Method 'POST' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "ClearRoutingPolicyCounters202Response" `
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

Create a Routing Policy

.DESCRIPTION

No description available.

.PARAMETER NTNXRequestId
A unique identifier that is associated with each request. The provided value must be opaque and preferably in Universal Unique Identifier (UUID) format. This identifier is also used as an idempotence token for safely retrying requests in case of network errors. All the supported Nutanix API clients add this auto-generated request identifier to each request. 

.PARAMETER NetworkingV41ConfigRoutingPolicy
Schema to configure a routing policy.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

CreateBgpSession202Response
#>
function New-RoutingPolicy {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${NTNXRequestId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${NetworkingV41ConfigRoutingPolicy},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: New-RoutingPolicy' | Write-Debug
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

        $LocalVarUri = '/networking/v4.1/config/routing-policies'

        if (!$NTNXRequestId) {
            throw "Error! The required parameter `NTNXRequestId` missing when calling createRoutingPolicy."
        }
        $LocalVarHeaderParameters['NTNX-Request-Id'] = $NTNXRequestId

        if (!$NetworkingV41ConfigRoutingPolicy) {
            throw "Error! The required parameter `NetworkingV41ConfigRoutingPolicy` missing when calling createRoutingPolicy."
        }

        $LocalVarBodyParameter = $NetworkingV41ConfigRoutingPolicy | ConvertTo-Json -Depth 100

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

Delete the Routing Policy corresponding to the extId

.DESCRIPTION

No description available.

.PARAMETER ExtId
ExtId of the Routing Policy.

.PARAMETER NTNXRequestId
A unique identifier that is associated with each request. The provided value must be opaque and preferably in Universal Unique Identifier (UUID) format. This identifier is also used as an idempotence token for safely retrying requests in case of network errors. All the supported Nutanix API clients add this auto-generated request identifier to each request. 

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

CreateBgpSession202Response
#>
function Invoke-DeleteRoutingPolicyById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${NTNXRequestId},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Invoke-DeleteRoutingPolicyById' | Write-Debug
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

        $LocalVarUri = '/networking/v4.1/config/routing-policies/{extId}'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling deleteRoutingPolicyById."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        if (!$NTNXRequestId) {
            throw "Error! The required parameter `NTNXRequestId` missing when calling deleteRoutingPolicyById."
        }
        $LocalVarHeaderParameters['NTNX-Request-Id'] = $NTNXRequestId

        $LocalVarResult = Send-ApiRequest -Method 'DELETE' `
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

Get a single Routing Policy corresponding to the extId

.DESCRIPTION

No description available.

.PARAMETER ExtId
ExtId of the Routing Policy.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

GetRoutingPolicyById200Response
#>
function Get-RoutingPolicyById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Get-RoutingPolicyById' | Write-Debug
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

        $LocalVarUri = '/networking/v4.1/config/routing-policies/{extId}'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling getRoutingPolicyById."
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
			-ReturnType "GetRoutingPolicyById200Response" `
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

Get a list of Routing Policies

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

.PARAMETER Expand
A URL query parameter that allows clients to request related resources when a resource that satisfies a particular request is retrieved. Each expanded item is evaluated relative to the entity containing the property being expanded. Other query options can be applied to an expanded property by appending a semicolon-separated list of query options, enclosed in parentheses, to the property name. Permissible system query options are $filter, $select and $orderby.

.PARAMETER Select
A URL query parameter that allows clients to request a specific set of properties for each entity or complex type. Expression specified with the $select must conform to the [OData V4.01](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html) URL conventions. If a $select expression consists of a single select item that is an asterisk (i.e., *), then all properties on the matching resource will be returned.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

ListRoutingPolicies200Response
#>
function Invoke-ListRoutingPolicies {
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
        ${Expand},
        [Parameter(Position = 5, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Select},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Invoke-ListRoutingPolicies' | Write-Debug
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

        $LocalVarUri = '/networking/v4.1/config/routing-policies'

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

        if ($Expand) {
            $LocalVarQueryParameters['$expand'] = $Expand
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
			-ReturnType "ListRoutingPolicies200Response" `
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

Update the Routing Policy corresponding to the extId

.DESCRIPTION

No description available.

.PARAMETER ExtId
ExtId of the Routing Policy.

.PARAMETER IfMatch
The If-Match request header makes the request conditional. When not provided, the server will respond with  an HTTP-428 (Precondition Required) response code indicating that the server requires the request to be conditional. The server will allow the successful completion of PUT and PATCH operations, if the resource matches the ETag value returned to the response of a GET operation. If the conditional does not match, then an HTTP-412 (Precondition Failed) response will be returned.

.PARAMETER NTNXRequestId
A unique identifier that is associated with each request. The provided value must be opaque and preferably in Universal Unique Identifier (UUID) format. This identifier is also used as an idempotence token for safely retrying requests in case of network errors. All the supported Nutanix API clients add this auto-generated request identifier to each request. 

.PARAMETER NetworkingV41ConfigRoutingPolicy
Schema to configure a routing policy.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

CreateBgpSession202Response
#>
function Update-RoutingPolicyById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${IfMatch},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${NTNXRequestId},
        [Parameter(Position = 3, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${NetworkingV41ConfigRoutingPolicy},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Update-RoutingPolicyById' | Write-Debug
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

        $LocalVarUri = '/networking/v4.1/config/routing-policies/{extId}'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling updateRoutingPolicyById."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        if (!$IfMatch) {
            throw "Error! The required parameter `IfMatch` missing when calling updateRoutingPolicyById."
        }
        $LocalVarHeaderParameters['If-Match'] = $IfMatch

        if (!$NTNXRequestId) {
            throw "Error! The required parameter `NTNXRequestId` missing when calling updateRoutingPolicyById."
        }
        $LocalVarHeaderParameters['NTNX-Request-Id'] = $NTNXRequestId

        if (!$NetworkingV41ConfigRoutingPolicy) {
            throw "Error! The required parameter `NetworkingV41ConfigRoutingPolicy` missing when calling updateRoutingPolicyById."
        }

        $LocalVarBodyParameter = $NetworkingV41ConfigRoutingPolicy | ConvertTo-Json -Depth 100

        $LocalVarResult = Send-ApiRequest -Method 'PUT' `
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

