<#
.SYNOPSIS
Connects interactively to Microsoft Graph.

.DESCRIPTION
This script uses delegated permissions and interactive authentication.
It is intended for labs, testing and manual administration.
#>

# Install Microsoft Graph module if missing
$requiredModules = @(
    "Microsoft.Graph.Authentication",
    "Microsoft.Graph.Users",
    "Microsoft.Graph.Groups",
    "Microsoft.Graph.Identity.DirectoryManagement",
    "Microsoft.Graph.DeviceManagement"
)

foreach ($module in $requiredModules) {
    if (-not (Get-Module $module -ListAvailable)) {
        Install-Module $module -Scope CurrentUser -Force -AllowClobber
    }
}

Import-Module Microsoft.Graph.Authentication

# Connect with common read-only scopes
Connect-MgGraph -Scopes `
    "User.Read.All", `
    "Group.Read.All", `
    "Device.Read.All", `
    "DeviceManagementManagedDevices.Read.All" `
    -NoWelcome

# Display current Graph context
Get-MgContext
