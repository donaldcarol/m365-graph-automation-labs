<#
.SYNOPSIS
Displays current Microsoft Graph connection information.
#>

$context = Get-MgContext

Write-Host ""
Write-Host "===== GRAPH SESSION ====="
Write-Host ""

$context | Format-List

Write-Host ""
Write-Host "===== SCOPES ====="
Write-Host ""

$context.Scopes | Sort-Object
