<#
.SYNOPSIS
Finds users without registered MFA methods in Entra ID.

.DESCRIPTION
This script checks each enabled member user and lists users who do not have
a registered MFA-capable authentication method.

Important:
This checks registered authentication methods, not Conditional Access enforcement.

.REQUIRED PERMISSIONS
User.Read.All
UserAuthenticationMethod.Read.All

.REQUIRED MODULES
Microsoft.Graph.Users
Microsoft.Graph.Identity.SignIns
#>

$requiredScopes = @(
    "User.Read.All",
    "UserAuthenticationMethod.Read.All"
)

$currentScopes = (Get-MgContext).Scopes

foreach ($scope in $requiredScopes) {
    if ($scope -notin $currentScopes) {
        Write-Host "Missing required scope: $scope"
        Write-Host "Reconnect using:"
        Write-Host 'Connect-MgGraph -Scopes "User.Read.All","UserAuthenticationMethod.Read.All"'
        return
    }
}

$users = Get-MgUser -All -Property `
    Id,
    DisplayName,
    UserPrincipalName,
    AccountEnabled,
    UserType

$enabledMemberUsers = $users | Where-Object {
    $_.AccountEnabled -eq $true -and
    $_.UserType -eq "Member"
}

$results = foreach ($user in $enabledMemberUsers) {

    $methods = Get-MgUserAuthenticationMethod -UserId $user.Id

    $mfaMethods = $methods | Where-Object {
        $_.AdditionalProperties.'@odata.type' -match 'microsoftAuthenticatorAuthenticationMethod|phoneAuthenticationMethod|fido2AuthenticationMethod|windowsHelloForBusinessAuthenticationMethod|softwareOathAuthenticationMethod'
    }

    if (-not $mfaMethods) {
        [PSCustomObject]@{
            DisplayName       = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            UserType          = $user.UserType
            AccountEnabled    = $user.AccountEnabled
            MfaRegistered     = $false
        }
    }
}

$results |
Sort-Object UserPrincipalName |
Format-Table -AutoSize