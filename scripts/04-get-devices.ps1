<#
.SYNOPSIS
Gets Entra ID registered/joined devices using Microsoft Graph.

.REQUIRED PERMISSION
Device.Read.All
#>

$devices = Get-MgDevice -All -Property `
    Id, DisplayName, OperatingSystem, OperatingSystemVersion, TrustType, AccountEnabled, ApproximateLastSignInDateTime

$devices |
Select-Object `
    DisplayName,
    OperatingSystem,
    OperatingSystemVersion,
    TrustType,
    AccountEnabled,
    ApproximateLastSignInDateTime
