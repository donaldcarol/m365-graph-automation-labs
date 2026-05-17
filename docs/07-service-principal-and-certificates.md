# Microsoft Graph vs AzureAD vs MSOnline

Microsoft has historically provided several PowerShell modules for Microsoft 365 and Azure administration.

Older modules such as MSOnline and AzureAD are being replaced by Microsoft Graph.

---

## Evolution of Microsoft Administration

```text
MSOnline
    ↓

AzureAD
    ↓

Microsoft Graph
```

---

## MSOnline Module

MSOnline was one of the earliest modules used for Microsoft cloud administration.

Example:

```powershell
Connect-MsolService

Get-MsolUser
```

Typical capabilities:

- User administration
- Licensing
- Basic directory management

Limitations:

- Legacy authentication
- Limited functionality
- Separate APIs
- No modern Graph capabilities

---

## AzureAD Module

AzureAD improved cloud administration capabilities.

Example:

```powershell
Connect-AzureAD

Get-AzureADUser
```

Typical capabilities:

- Users
- Groups
- Applications
- Service principals

Limitations:

- Partial API coverage
- Different command syntax
- Not aligned with newer Microsoft services

---

## Microsoft Graph PowerShell SDK

Microsoft Graph provides a unified API and modern PowerShell module.

Example:

```powershell
Connect-MgGraph

Get-MgUser
```

Capabilities:

- Entra ID
- Intune
- Teams
- Exchange Online
- SharePoint
- OneDrive
- Security services
- Reports

Advantages:

- Modern authentication
- Unified API
- Broader service coverage
- Better automation support

---

## Command Comparison

| Task | MSOnline | AzureAD | Graph |
|---|---:|---:|---:|
| Connect | Connect-MsolService | Connect-AzureAD | Connect-MgGraph |
| Get users | Get-MsolUser | Get-AzureADUser | Get-MgUser |
| Get groups | Get-MsolGroup | Get-AzureADGroup | Get-MgGroup |
| Get devices | Limited | Get-AzureADDevice | Get-MgDevice |
| Intune support | No | Limited | Full |
| Teams support | No | Limited | Yes |
| Modern auth | Limited | Partial | Yes |

---

## Authentication Comparison

MSOnline:

```powershell
Connect-MsolService
```

AzureAD:

```powershell
Connect-AzureAD
```

Graph:

```powershell
Connect-MgGraph -Scopes "User.Read.All"
```

Graph authentication supports:

- OAuth 2.0
- OIDC
- Service Principals
- Certificates
- Managed Identity

---

## Real-world Example

Legacy approach:

```text
Script
   ↓
AzureAD module
   ↓
Users only
```

Modern approach:

```text
Script
   ↓
Microsoft Graph
   ↓
Users
Groups
Devices
Intune
Reports
Teams
```

---

## Migration Considerations

When moving from AzureAD or MSOnline:

- Cmdlet names change
- Authentication changes
- Permissions become scope-based
- Graph may return different properties
- Some scripts require redesign

Example:

Old:

```powershell
Get-AzureADUser
```

New:

```powershell
Get-MgUser
```

---

## Key Takeaways

- MSOnline is legacy
- AzureAD is being replaced
- Microsoft Graph is Microsoft's strategic direction
- Graph offers broader service integration
- Modern automation should use Graph whenever possible
