<#
.SYNOPSIS
Exports Entra ID devices to CSV.

.REQUIRED PERMISSION
Device.Read.All
#>

$outputPath = ".\examples\entra-devices-report.csv"

if (-not (Test-Path ".\examples")) {
    New-Item -Path ".\examples" -ItemType Directory | Out-Null
}

$devices = Get-MgDevice -All -Property `
    DisplayName,
    OperatingSystem,
    OperatingSystemVersion,
    TrustType,
    AccountEnabled,
    ApproximateLastSignInDateTime

$devices |
Select-Object `
    DisplayName,
    OperatingSystem,
    OperatingSystemVersion,
    TrustType,
    AccountEnabled,
    ApproximateLastSignInDateTime |
Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8

Write-Host "Devices report exported to $outputPath"
