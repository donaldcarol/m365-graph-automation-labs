<#
.SYNOPSIS
Finds disabled Entra ID users.

.REQUIRED PERMISSION
User.Read.All
#>

$users = Get-MgUser -All -Property `
    DisplayName,
    UserPrincipalName,
    AccountEnabled

$disabledUsers = $users | Where-Object {
    $_.AccountEnabled -eq $false
}

$disabledUsers |
Select-Object `
    DisplayName,
    UserPrincipalName,
    AccountEnabled |
Format-Table -AutoSize
