<#
.SYNOPSIS
Gets Intune managed devices using Microsoft Graph.

.REQUIRED PERMISSION
DeviceManagementManagedDevices.Read.All
#>

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$devices = Get-MgDeviceManagementManagedDevice -All -Property `
    Id,
    DeviceName,
    UserPrincipalName,
    OperatingSystem,
    OsVersion,
    ComplianceState,
    ManagementAgent,
    EnrolledDateTime,
    LastSyncDateTime

$devices |
Select-Object `
    DeviceName,
    UserPrincipalName,
    OperatingSystem,
    OsVersion,
    ComplianceState,
    ManagementAgent,
    EnrolledDateTime,
    LastSyncDateTime
