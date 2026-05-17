<#
.SYNOPSIS
Gets Entra ID groups using Microsoft Graph.

.REQUIRED PERMISSION
Group.Read.All
#>

$groups = Get-MgGroup -All -Property `
    Id, DisplayName, Mail, MailEnabled, SecurityEnabled, GroupTypes, CreatedDateTime

$groups |
Select-Object `
    DisplayName,
    Mail,
    MailEnabled,
    SecurityEnabled,
    GroupTypes,
    CreatedDateTime
