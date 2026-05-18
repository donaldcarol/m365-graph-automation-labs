<#
.SYNOPSIS
Exports Intune managed devices to a CSV file.

.REQUIRED PERMISSION
DeviceManagementManagedDevices.Read.All
#>

$outputPath = ".\examples\intune-devices-report.csv"

if (-not (Test-Path ".\examples")) {
    New-Item -Path ".\examples" -ItemType Directory | Out-Null
}

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
    LastSyncDateTime |
Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8

Write-Host "Intune devices report exported to $outputPath"
