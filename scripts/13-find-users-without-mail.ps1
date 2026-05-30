Get-MgUser -All -Property DisplayName,Mail |
Where-Object {
    [string]::IsNullOrEmpty($_.Mail)
} |
Select DisplayName,Mail
