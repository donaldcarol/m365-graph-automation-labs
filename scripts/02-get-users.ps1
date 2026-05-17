<#
.SYNOPSIS
Gets Entra ID users using Microsoft Graph.

.REQUIRED PERMISSION
User.Read.All
#>

$users = Get-MgUser -All -Property `
    Id, DisplayName, UserPrincipalName, Mail, AccountEnabled, CreatedDateTime

$users |
Select-Object `
    DisplayName,
    UserPrincipalName,
    Mail,
    AccountEnabled,
    CreatedDateTime
