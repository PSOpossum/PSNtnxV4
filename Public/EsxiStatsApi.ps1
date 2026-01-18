<#
.SYNOPSIS

Get the stats for the specified VM disk

.DESCRIPTION

No description available.

.PARAMETER VmExtId
This field specifies the VM external ID when retrieving the stats for a given VM Disk.

.PARAMETER ExtId
This field specifies the VM external ID when retrieving the stats for a given VM Disk.

.PARAMETER StartTime
The start time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, start time of 2022-04-23T01:23:45.678+09:00 would consider all stats starting at 1:23:45.678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER EndTime
The end time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, end time of 2022-04-23T013:23:45.678+09:00 would consider all stats till 13:23:45 .678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER SamplingInterval
The sampling interval in seconds at which statistical data should be collected. For example, if you want performance statistics every 30 seconds, then provide the value as 30. 

.PARAMETER StatType
No description available.

.PARAMETER Select
A URL query parameter that allows clients to request a specific set of properties for each entity or complex type. Expression specified with the $select must conform to the [OData V4.01](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html) URL conventions. If a $select expression consists of a single select item that is an asterisk (i.e., *), then all properties on the matching resource will be returned.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

GetEsxiDiskStatsById200Response
#>
function Get-EsxiDiskStatsById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${VmExtId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${StartTime},
        [Parameter(Position = 3, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${EndTime},
        [Parameter(Position = 4, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${SamplingInterval},
        [Parameter(Position = 5, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${StatType},
        [Parameter(Position = 6, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Select},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Get-EsxiDiskStatsById' | Write-Debug
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

        $LocalVarUri = '/vmm/v4.1/esxi/stats/vms/{vmExtId}/disks/{extId}'
        if (!$VmExtId) {
            throw "Error! The required parameter `VmExtId` missing when calling getEsxiDiskStatsById."
        }
        $LocalVarUri = $LocalVarUri.replace('{vmExtId}', [System.Web.HTTPUtility]::UrlEncode($VmExtId))
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling getEsxiDiskStatsById."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        if (!$StartTime) {
            throw "Error! The required parameter `StartTime` missing when calling getEsxiDiskStatsById."
        }
        $LocalVarQueryParameters['$startTime'] = $StartTime

        if (!$EndTime) {
            throw "Error! The required parameter `EndTime` missing when calling getEsxiDiskStatsById."
        }
        $LocalVarQueryParameters['$endTime'] = $EndTime

        if ($SamplingInterval) {
            $LocalVarQueryParameters['$samplingInterval'] = $SamplingInterval
        }

        if ($StatType) {
            $LocalVarQueryParameters['$statType'] = $StatType
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
			-ReturnType "GetEsxiDiskStatsById200Response" `
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

Get the stats for the specified VM NIC

.DESCRIPTION

No description available.

.PARAMETER VmExtId
This field specifies the VM external ID when retrieving the stats for a given VM NIC.

.PARAMETER ExtId
This field specifies the external ID of the VM NIC when retrieving stats for a given VM NIC.

.PARAMETER StartTime
The start time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, start time of 2022-04-23T01:23:45.678+09:00 would consider all stats starting at 1:23:45.678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER EndTime
The end time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, end time of 2022-04-23T013:23:45.678+09:00 would consider all stats till 13:23:45 .678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER SamplingInterval
The sampling interval in seconds at which statistical data should be collected. For example, if you want performance statistics every 30 seconds, then provide the value as 30. 

.PARAMETER StatType
No description available.

.PARAMETER Select
A URL query parameter that allows clients to request a specific set of properties for each entity or complex type. Expression specified with the $select must conform to the [OData V4.01](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html) URL conventions. If a $select expression consists of a single select item that is an asterisk (i.e., *), then all properties on the matching resource will be returned.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

GetEsxiNicStatsById200Response
#>
function Get-EsxiNicStatsById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${VmExtId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${StartTime},
        [Parameter(Position = 3, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${EndTime},
        [Parameter(Position = 4, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${SamplingInterval},
        [Parameter(Position = 5, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${StatType},
        [Parameter(Position = 6, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Select},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Get-EsxiNicStatsById' | Write-Debug
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

        $LocalVarUri = '/vmm/v4.1/esxi/stats/vms/{vmExtId}/nics/{extId}'
        if (!$VmExtId) {
            throw "Error! The required parameter `VmExtId` missing when calling getEsxiNicStatsById."
        }
        $LocalVarUri = $LocalVarUri.replace('{vmExtId}', [System.Web.HTTPUtility]::UrlEncode($VmExtId))
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling getEsxiNicStatsById."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        if (!$StartTime) {
            throw "Error! The required parameter `StartTime` missing when calling getEsxiNicStatsById."
        }
        $LocalVarQueryParameters['$startTime'] = $StartTime

        if (!$EndTime) {
            throw "Error! The required parameter `EndTime` missing when calling getEsxiNicStatsById."
        }
        $LocalVarQueryParameters['$endTime'] = $EndTime

        if ($SamplingInterval) {
            $LocalVarQueryParameters['$samplingInterval'] = $SamplingInterval
        }

        if ($StatType) {
            $LocalVarQueryParameters['$statType'] = $StatType
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
			-ReturnType "GetEsxiNicStatsById200Response" `
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

Get VM stats for a given VM

.DESCRIPTION

No description available.

.PARAMETER ExtId
Retrieve statistics for the VM with the specified external ID.

.PARAMETER StartTime
The start time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, start time of 2022-04-23T01:23:45.678+09:00 would consider all stats starting at 1:23:45.678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER EndTime
The end time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, end time of 2022-04-23T013:23:45.678+09:00 would consider all stats till 13:23:45 .678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER SamplingInterval
The sampling interval in seconds at which statistical data should be collected. For example, if you want performance statistics every 30 seconds, then provide the value as 30. 

.PARAMETER StatType
No description available.

.PARAMETER Select
A URL query parameter that allows clients to request a specific set of properties for each entity or complex type. Expression specified with the $select must conform to the [OData V4.01](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html) URL conventions. If a $select expression consists of a single select item that is an asterisk (i.e., *), then all properties on the matching resource will be returned.

.PARAMETER NoHttpInfo

A switch that'll return just the Response, instead of a hash table with the Response, StatusCode and Headers. Don't enable this switch unless you're doing something advanced, as the prism central v4 api requires the EType to be the current and valid type in order to modify objects. The EType is returned in the Headers.

.OUTPUTS

GetEsxiVmStatsById200Response
#>
function Get-EsxiVmStatsById {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${ExtId},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${StartTime},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${EndTime},
        [Parameter(Position = 3, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${SamplingInterval},
        [Parameter(Position = 4, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${StatType},
        [Parameter(Position = 5, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Select},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Get-EsxiVmStatsById' | Write-Debug
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

        $LocalVarUri = '/vmm/v4.1/esxi/stats/vms/{extId}'
        if (!$ExtId) {
            throw "Error! The required parameter `ExtId` missing when calling getEsxiVmStatsById."
        }
        $LocalVarUri = $LocalVarUri.replace('{extId}', [System.Web.HTTPUtility]::UrlEncode($ExtId))

        if (!$StartTime) {
            throw "Error! The required parameter `StartTime` missing when calling getEsxiVmStatsById."
        }
        $LocalVarQueryParameters['$startTime'] = $StartTime

        if (!$EndTime) {
            throw "Error! The required parameter `EndTime` missing when calling getEsxiVmStatsById."
        }
        $LocalVarQueryParameters['$endTime'] = $EndTime

        if ($SamplingInterval) {
            $LocalVarQueryParameters['$samplingInterval'] = $SamplingInterval
        }

        if ($StatType) {
            $LocalVarQueryParameters['$statType'] = $StatType
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
			-ReturnType "GetEsxiVmStatsById200Response" `
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

List VM stats for all VMs

.DESCRIPTION

No description available.

.PARAMETER StartTime
The start time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, start time of 2022-04-23T01:23:45.678+09:00 would consider all stats starting at 1:23:45.678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER EndTime
The end time of the period for which stats should be reported. The value should be in extended ISO-8601 format. For example, end time of 2022-04-23T013:23:45.678+09:00 would consider all stats till 13:23:45 .678 on the 23rd of April 2022. Details around ISO-8601 format can be found at https://www.iso.org/standard/70907.html 

.PARAMETER SamplingInterval
The sampling interval in seconds at which statistical data should be collected. For example, if you want performance statistics every 30 seconds, then provide the value as 30. 

.PARAMETER StatType
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

ListEsxiVmStats200Response
#>
function Invoke-ListEsxiVmStats {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${StartTime},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.DateTime]
        ${EndTime},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${SamplingInterval},
        [Parameter(Position = 3, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [PSCustomObject]
        ${StatType},
        [Parameter(Position = 4, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${Page},
        [Parameter(Position = 5, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${Limit},
        [Parameter(Position = 6, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Filter},
        [Parameter(Position = 7, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Orderby},
        [Parameter(Position = 8, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${Select},
        [Switch]
        $NoHttpInfo
    )

    Process {
        'Calling method: Invoke-ListEsxiVmStats' | Write-Debug
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

        $LocalVarUri = '/vmm/v4.1/esxi/stats/vms'

        if (!$StartTime) {
            throw "Error! The required parameter `StartTime` missing when calling listEsxiVmStats."
        }
        $LocalVarQueryParameters['$startTime'] = $StartTime

        if (!$EndTime) {
            throw "Error! The required parameter `EndTime` missing when calling listEsxiVmStats."
        }
        $LocalVarQueryParameters['$endTime'] = $EndTime

        if ($SamplingInterval) {
            $LocalVarQueryParameters['$samplingInterval'] = $SamplingInterval
        }

        if ($StatType) {
            $LocalVarQueryParameters['$statType'] = $StatType
        }

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
			-ReturnType "ListEsxiVmStats200Response" `
			-IsBodyNullable $false

        if ($NoHttpInfo.IsPresent) {
            return $LocalVarResult["Response"]
        } else {
            return $LocalVarResult
        }
    }
}

