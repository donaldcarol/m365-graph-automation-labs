# 04-security-find-guest-users.ps1
<#
.SYNOPSIS
Finds guest users in Entra ID.

.REQUIRED PERMISSION
User.Read.All
#>

$guestUsers = Get-MgUser -All -Property `
    DisplayName,
    UserPrincipalName,
    Mail,
    UserType,
    AccountEnabled,
    CreatedDateTime |
Where-Object {
    $_.UserType -eq "Guest"
}

$outputPath = ".\examples\guest-users-report.csv"

$guestUsers |
Select-Object DisplayName,UserPrincipalName,Mail,UserType,AccountEnabled,CreatedDateTime |
Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8