<#
.SYNOPSIS
Connects interactively to Microsoft Graph.

.DESCRIPTION
This script uses delegated permissions and interactive authentication.
It is intended for labs, testing and manual administration.
#>

# Install Microsoft Graph module if missing
if (-not (Get-Module Microsoft.Graph -ListAvailable)) {
    Install-Module Microsoft.Graph -Scope CurrentUser -Force
}

Import-Module Microsoft.Graph

# Connect with common read-only scopes
Connect-MgGraph -Scopes `
    "User.Read.All", `
    "Group.Read.All", `
    "Device.Read.All"

# Display current Graph context
Get-MgContext
