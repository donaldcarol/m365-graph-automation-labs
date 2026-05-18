<#
.SYNOPSIS
Exports Entra ID users to a CSV file.

.REQUIRED PERMISSION
User.Read.All
#>

$outputPath = ".\examples\users-report.csv"

if (-not (Test-Path ".\examples")) {
    New-Item -Path ".\examples" -ItemType Directory | Out-Null
}

$users = Get-MgUser -All -Property `
    Id,
    DisplayName,
    UserPrincipalName,
    Mail,
    AccountEnabled,
    CreatedDateTime,
    Department,
    JobTitle,
    OfficeLocation

$users |
Select-Object `
    DisplayName,
    UserPrincipalName,
    Mail,
    AccountEnabled,
    Department,
    JobTitle,
    OfficeLocation,
    CreatedDateTime |
Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8

Write-Host "Users report exported to $outputPath"
