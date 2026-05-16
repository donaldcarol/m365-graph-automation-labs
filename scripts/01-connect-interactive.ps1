# scripts/01-connect-interactive.ps1

Install-Module Microsoft.Graph -Scope CurrentUser

Import-Module Microsoft.Graph

Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "Device.Read.All"

Get-MgContext

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

Get-MgDeviceManagementManagedDevice |
Select-Object DeviceName, OperatingSystem, ComplianceState, ManagementAgent