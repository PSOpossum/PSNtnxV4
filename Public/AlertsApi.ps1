<#
.SYNOPSIS

Get alert details

.DESCRIPTION

No description available.

.PARAMETER ExtId
UUID of the generated alert.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

GetAlertById200Response
#>
function Get-AlertById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Get-AlertById' | Write-Debug
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

        $LocalVarUri = '/monitoring/v4.1/serviceability/alerts/{extId}'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling getAlertById."
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
			-ReturnType "GetAlertById200Response" `
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

Get alert email configuration

.DESCRIPTION

No description available.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

GetAlertEmailConfiguration200Response
#>
function Get-AlertEmailConfiguration {
    [CmdletBinding()]
    Param (
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Get-AlertEmailConfiguration' | Write-Debug
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

        $LocalVarUri = '/monitoring/v4.1/serviceability/alerts/email-config'

        $LocalVarResult = Send-ApiRequest -Method 'GET' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "GetAlertEmailConfiguration200Response" `
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

List alerts

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

ListAlerts200Response
#>
function Invoke-ListAlerts {
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
        'Calling method: Invoke-ListAlerts' | Write-Debug
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

        $LocalVarUri = '/monitoring/v4.1/serviceability/alerts'

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
			-ReturnType "ListAlerts200Response" `
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

Acknowledge or resolve the alert

.DESCRIPTION

No description available.

.PARAMETER ExtId
Unique identifier of an alert that can be resolved or acknowledged.

.PARAMETER IfMatch
The If-Match request header makes the request conditional. When not provided the server will respond with an HTTP 428 (Precondition Required) response code indicating that the server requires the request to be conditional. The server will allow successful completion of PUT and PATCH operations, if the resource matches the ETag value returned to the response of a GET operation. If the conditional does not match, then an HTTP 412 (Precondition Failed) response 

.PARAMETER MonitoringV41ServiceabilityAlertActionSpec
An alert can be resolved or acknowledged using the following parameters.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

ManageAlert202Response
#>
function Invoke-ManageAlert {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${IfMatch},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${MonitoringV41ServiceabilityAlertActionSpec},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Invoke-ManageAlert' | Write-Debug
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

        $LocalVarUri = '/monitoring/v4.1/serviceability/alerts/{extId}/$actions/manage-alert'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling manageAlert."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        if (!$IfMatch) {
            throw "Error! The required parameter `IfMatch` missing when calling manageAlert."
        }
        $LocalVarHeaderParameters['If-Match'] = $IfMatch

        if (!$MonitoringV41ServiceabilityAlertActionSpec) {
            throw "Error! The required parameter `MonitoringV41ServiceabilityAlertActionSpec` missing when calling manageAlert."
        }

        $LocalVarBodyParameter = $MonitoringV41ServiceabilityAlertActionSpec | ConvertTo-Json -Depth 100

        $LocalVarResult = Send-ApiRequest -Method 'POST' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "ManageAlert202Response" `
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

Update alert email configuration

.DESCRIPTION

No description available.

.PARAMETER IfMatch
The If-Match request header makes the request conditional. When not provided, the server will respond with  an HTTP-428 (Precondition Required) response code indicating that the server requires the request to be conditional. The server will allow the successful completion of PUT and PATCH operations, if the resource matches the ETag value returned to the response of a GET operation. If the conditional does not match, then an HTTP-412 (Precondition Failed) response will be returned.

.PARAMETER MonitoringV41ServiceabilityAlertEmailConfiguration
Email configuration sent for the update.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

UpdateAlertEmailConfiguration200Response
#>
function Update-AlertEmailConfiguration {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${IfMatch},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${MonitoringV41ServiceabilityAlertEmailConfiguration},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Update-AlertEmailConfiguration' | Write-Debug
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

        $LocalVarUri = '/monitoring/v4.1/serviceability/alerts/email-config'

        if (!$IfMatch) {
            throw "Error! The required parameter `IfMatch` missing when calling updateAlertEmailConfiguration."
        }
        $LocalVarHeaderParameters['If-Match'] = $IfMatch

        if (!$MonitoringV41ServiceabilityAlertEmailConfiguration) {
            throw "Error! The required parameter `MonitoringV41ServiceabilityAlertEmailConfiguration` missing when calling updateAlertEmailConfiguration."
        }

        $LocalVarBodyParameter = $MonitoringV41ServiceabilityAlertEmailConfiguration | ConvertTo-Json -Depth 100

        $LocalVarResult = Send-ApiRequest -Method 'PUT' `
			-Uri $LocalVarUri `
			-Accepts $LocalVarAccepts `
			-ContentTypes $LocalVarContentTypes `
			-Body $LocalVarBodyParameter `
			-HeaderParameters $LocalVarHeaderParameters `
			-QueryParameters $LocalVarQueryParameters `
			-FormParameters $LocalVarFormParameters `
			-CookieParameters $LocalVarCookieParameters `
			-ReturnType "UpdateAlertEmailConfiguration200Response" `
			-IsBodyNullable $false

        if ($NoHttpInfo.IsPresent) {
            return $LocalVarResult["Response"]
        } else {
            return $LocalVarResult
        }
    }
}

