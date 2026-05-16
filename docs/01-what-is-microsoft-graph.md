# What is Microsoft Graph?

Microsoft Graph is Microsoft's unified API platform used to access and manage cloud services and data across the Microsoft ecosystem.

Instead of connecting separately to different Microsoft services, applications and scripts can communicate through a single endpoint.

Official endpoint:

```text
https://graph.microsoft.com
```

---

## Why Microsoft Graph exists

Without Microsoft Graph:

```text
Application
    ↓
Exchange API
SharePoint API
Azure AD API
Teams API
Intune API
```

Multiple APIs:

- different authentication methods
- different endpoints
- different permissions
- different SDKs

---

With Microsoft Graph:

```text
Application / PowerShell / Script
                    ↓
            Microsoft Graph
                    ↓
 ┌─────────────────────────────────┐
 │ Entra ID                        │
 │ Intune                          │
 │ Exchange Online                 │
 │ Teams                           │
 │ SharePoint                      │
 │ OneDrive                        │
 │ Outlook                         │
 │ Security services               │
 └─────────────────────────────────┘
```

One API:

- single authentication model
- centralized permissions
- common SDK
- simplified automation

---

## Common administration examples

### Get users from Entra ID

```http
GET https://graph.microsoft.com/v1.0/users
```

---

### Get groups

```http
GET https://graph.microsoft.com/v1.0/groups
```

---

### Get Intune managed devices

```http
GET https://graph.microsoft.com/v1.0/deviceManagement/managedDevices
```

---

### Get Teams information

```http
GET https://graph.microsoft.com/v1.0/teams
```

---

## Microsoft Graph and PowerShell

Microsoft provides a PowerShell SDK that communicates with Graph.

Example:

```powershell
Connect-MgGraph

Get-MgUser

Get-MgGroup
```

PowerShell commands send Graph API requests in the background.

---

## Graph API versions

Microsoft Graph has two endpoints:

### v1.0

Stable production version

```text
https://graph.microsoft.com/v1.0
```

Recommended for:

- production scripts
- automation
- enterprise environments

---

### beta

Preview version containing newer features

```text
https://graph.microsoft.com/beta
```

Recommended for:

- testing
- labs
- features not yet available in v1.0

Warning:

Beta features can change without notice.

---

## Legacy vs Modern administration

| Legacy | Modern |
|----------|----------|
| MSOnline | Microsoft Graph |
| AzureAD module | Microsoft Graph |
| Multiple APIs | Unified API |
| Separate authentication methods | OAuth / Entra ID |

---

## Key takeaways

- Microsoft Graph is the central API for Microsoft cloud services
- Uses Entra ID and OAuth authentication
- Provides one endpoint for multiple Microsoft services
- Supports PowerShell, REST API and SDKs
- Replaces older administration modules
