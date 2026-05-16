# Authentication Models in Microsoft Graph

Microsoft Graph uses modern authentication through Entra ID and OAuth 2.0.

Authentication methods vary depending on whether a user is interacting directly with the service or an application/script is running automatically.

---

## Authentication Flow Overview

```text
PowerShell / Application
        ↓
Authentication request
        ↓
Entra ID
        ↓
Access Token
        ↓
Microsoft Graph API
        ↓
Microsoft 365 / Intune / Teams / SharePoint
```

---

## 1. Interactive User Authentication

Used when an administrator signs in manually.

Typical use cases:

- Interactive administration
- Testing scripts
- Learning and lab environments
- Manual reporting

Example:

```powershell
Connect-MgGraph -Scopes "User.Read.All","Group.Read.All"
```

A browser window opens and the administrator authenticates.

Advantages:

- Easy to use
- MFA supported
- Good for troubleshooting

Limitations:

- Requires user interaction
- Not suitable for scheduled tasks

---

## 2. Device Code Authentication

Used when browser authentication is difficult or unavailable.

Example:

```powershell
Connect-MgGraph -UseDeviceAuthentication
```

Process:

1. PowerShell displays a code
2. User opens a browser
3. User enters the code
4. Authentication completes

Typical use cases:

- Servers without GUI
- SSH sessions
- Remote systems

---

## 3. Application Authentication (Service Principal)

Used for automation without user interaction.

Example:

```powershell
Connect-MgGraph `
-ClientId "<ApplicationID>" `
-TenantId "<TenantID>" `
-CertificateThumbprint "<Thumbprint>"
```

Typical use cases:

- Scheduled scripts
- Automation
- CI/CD
- Background services

Advantages:

- Fully automated
- No user required

Limitations:

- Requires application permissions
- Requires certificate or secret management

---

## 4. Managed Identity Authentication

Used when Azure resources authenticate automatically.

Example:

```powershell
Connect-MgGraph -Identity
```

Typical use cases:

- Azure VM
- Azure Function
- Automation Account

Advantages:

- No credentials stored
- No secret rotation

Limitations:

- Azure resources only

---

## Delegated vs Application Permissions

Delegated permissions:

- User signs in
- Application acts as the user

Examples:

- User.Read
- Group.Read.All

Application permissions:

- No user signs in
- Application acts independently

Examples:

- User.Read.All
- Directory.Read.All
- DeviceManagementManagedDevices.Read.All

---

## Recommendation

Development / labs:

Interactive authentication

Production automation:

Managed Identity or Service Principal with certificate authentication

Avoid using client secrets whenever possible.
