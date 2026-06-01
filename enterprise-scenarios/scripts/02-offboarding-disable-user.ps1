# 02-offboarding-disable-user.ps1

<#
.SYNOPSIS
Disables a user account in Entra ID.

.REQUIRED PERMISSION
User.ReadWrite.All

.WARNING
This script modifies a real user account.
Use carefully.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$UserPrincipalName,

    [switch]$Execute
)

$user = Get-MgUser -UserId $UserPrincipalName -Property Id,DisplayName,UserPrincipalName,AccountEnabled

Write-Host "User found:"
$user | Select-Object DisplayName,UserPrincipalName,AccountEnabled

if (-not $Execute) {
    Write-Host "DRY RUN: user would be disabled. Use -Execute to apply the change."
    return
}

Update-MgUser -UserId $user.Id -AccountEnabled:$false

Write-Host "User disabled successfully."