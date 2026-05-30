Get-MgUser -All -Property DisplayName,UserPrincipalName,UserType |
Where-Object {
    $_.UserType -eq "Guest"
} |
Select DisplayName,UserPrincipalName
