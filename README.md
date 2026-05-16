# Microsoft Graph PowerShell Admin Labs

Practical Microsoft Graph examples for Microsoft 365, Entra ID and Intune administration using PowerShell and modern authentication methods.

This repository demonstrates how Microsoft Graph can be used for cloud administration, reporting and automation while replacing legacy modules such as AzureAD and MSOnline.

---

## Objectives

This project aims to demonstrate:

- Microsoft Graph fundamentals
- Modern authentication methods
- Delegated vs Application permissions
- Microsoft Graph PowerShell SDK usage
- User and group administration
- Intune device management
- Reporting and CSV exports
- Automation scenarios
- Troubleshooting techniques

---

## Architecture Overview

```text
PowerShell Script / Application
                ↓
         Authentication
                ↓
            Entra ID
                ↓
          Access Token
                ↓
       Microsoft Graph API
                ↓
┌──────────────────────────────┐
│ Entra ID                     │
│ Intune                       │
│ Teams                        │
│ Exchange Online              │
│ SharePoint                   │
│ OneDrive                     │
└──────────────────────────────┘
```

---

## Repository Structure

```text
microsoft-graph-powershell-admin-labs/
│
├── README.md
│
├── docs/
│   ├── 01-what-is-microsoft-graph.md
│   ├── 02-authentication-models.md
│   ├── 03-delegated-vs-application-permissions.md
│   ├── 04-common-graph-permissions.md
│   ├── 05-graph-vs-azuread-msonline.md
│   └── 06-troubleshooting.md
│
├── scripts/
│   ├── 01-connect-interactive.ps1
│   ├── 02-get-users.ps1
│   ├── 03-get-groups.ps1
│   ├── 04-get-devices.ps1
│   ├── 05-get-intune-managed-devices.ps1
│   ├── 06-export-users-to-csv.ps1
│   └── 07-export-devices-to-csv.ps1
│
└── examples/
```

---

## Authentication Models Covered

| Method | Use case |
|----------|----------|
| Interactive Authentication | Administrator login |
| Device Authentication | Remote systems |
| Service Principal | Automation |
| Managed Identity | Azure resources |

---

## Example Usage

Connect interactively:

```powershell
Connect-MgGraph -Scopes "User.Read.All"
```

Get users:

```powershell
Get-MgUser
```

Get Intune devices:

```powershell
Get-MgDeviceManagementManagedDevice
```

Export users:

```powershell
Get-MgUser |
Select-Object DisplayName,Mail |
Export-Csv users.csv -NoTypeInformation
```

---

## Skills Demonstrated

- Microsoft Graph
- Entra ID
- OAuth 2.0
- OIDC
- PowerShell
- Intune
- Microsoft 365 administration
- Automation
- Identity and Access Management

---

## Future Improvements

Planned additions:

- Service Principal authentication
- Certificate-based authentication
- GitHub Actions with OIDC
- REST API examples
- Pagination handling
- Batch requests
- Error handling
- Production reporting examples

---

## References

Microsoft Graph documentation:

https://learn.microsoft.com/en-us/graph/
