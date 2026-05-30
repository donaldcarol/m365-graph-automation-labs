<#
.SYNOPSIS
Exports Entra ID groups to CSV.

.REQUIRED PERMISSION
Group.Read.All
#>

$outputPath = ".\examples\groups-report.csv"

if (-not (Test-Path ".\examples")) {
    New-Item -Path ".\examples" -ItemType Directory | Out-Null
}

$groups = Get-MgGroup -All -Property `
    DisplayName,
    Mail,
    MailEnabled,
    SecurityEnabled,
    CreatedDateTime

$groups |
Select-Object `
    DisplayName,
    Mail,
    MailEnabled,
    SecurityEnabled,
    CreatedDateTime |
Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8

Write-Host "Groups report exported to $outputPath"
