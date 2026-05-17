# Common Microsoft Graph Permissions

Microsoft Graph permissions define what an application or script is allowed to do.

Permissions are requested during authentication and are included in the access token issued by Entra ID.

---

## Permission Types

Microsoft Graph supports two main permission types:

| Type | Description | Example |
|---|---|---|
| Delegated | A signed-in user is present | Admin runs a PowerShell script |
| Application | No signed-in user is present | Automation runs as a Service Principal |

---

## Common User Permissions

| Permission | Type | Purpose |
|---|---|---|
| User.Read | Delegated | Read the signed-in user's profile |
| User.Read.All | Delegated / Application | Read all users |
| User.ReadWrite.All | Delegated / Application | Read and modify users |

Example:

```powershell
Connect-MgGraph -Scopes "User.Read.All"

Get-MgUser
```

---

## Common Group Permissions

| Permission | Type | Purpose |
|---|---|---|
| Group.Read.All | Delegated / Application | Read groups and memberships |
| Group.ReadWrite.All | Delegated / Application | Create and modify groups |
| Directory.Read.All | Delegated / Application | Read directory data |

Example:

```powershell
Connect-MgGraph -Scopes "Group.Read.All"

Get-MgGroup
```

---

## Common Device Permissions

| Permission | Type | Purpose |
|---|---|---|
| Device.Read.All | Delegated / Application | Read Entra registered/joined devices |
| Device.ReadWrite.All | Delegated / Application | Read and modify device objects |
| Directory.Read.All | Delegated / Application | Read directory-wide device information |

Example:

```powershell
Connect-MgGraph -Scopes "Device.Read.All"

Get-MgDevice
```

---

## Common Intune Permissions

| Permission | Type | Purpose |
|---|---|---|
| DeviceManagementManagedDevices.Read.All | Delegated / Application | Read Intune managed devices |
| DeviceManagementManagedDevices.ReadWrite.All | Delegated / Application | Read and modify Intune managed devices |
| DeviceManagementConfiguration.Read.All | Delegated / Application | Read Intune configuration policies |
| DeviceManagementConfiguration.ReadWrite.All | Delegated / Application | Create and modify Intune configuration policies |
| DeviceManagementApps.Read.All | Delegated / Application | Read Intune applications |
| DeviceManagementApps.ReadWrite.All | Delegated / Application | Create and modify Intune applications |

Example:

```powershell
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

Get-MgDeviceManagementManagedDevice
```

---

## Common Mail Permissions

| Permission | Type | Purpose |
|---|---|---|
| Mail.Read | Delegated / Application | Read mail |
| Mail.Send | Delegated / Application | Send mail |
| Mail.ReadWrite | Delegated / Application | Read and modify mail |

Example:

```powershell
Connect-MgGraph -Scopes "Mail.Read"

Get-MgUserMessage -UserId "user@contoso.com"
```

---

## Common Files and SharePoint Permissions

| Permission | Type | Purpose |
|---|---|---|
| Files.Read.All | Delegated / Application | Read files across OneDrive and SharePoint |
| Files.ReadWrite.All | Delegated / Application | Read and modify files |
| Sites.Read.All | Delegated / Application | Read SharePoint sites |
| Sites.ReadWrite.All | Delegated / Application | Read and modify SharePoint sites |

---

## Common Reports Permissions

| Permission | Type | Purpose |
|---|---|---|
| Reports.Read.All | Delegated / Application | Read Microsoft 365 usage reports |

Example use cases:

- M365 usage reports
- Teams usage reports
- OneDrive activity reports
- SharePoint activity reports

---

## Least Privilege Principle

Always request only the permissions required by the task.

Bad example:

```powershell
Connect-MgGraph -Scopes "Directory.ReadWrite.All"
```

For a simple user export, this is too powerful.

Better example:

```powershell
Connect-MgGraph -Scopes "User.Read.All"
```

---

## Admin Consent

Some permissions require administrator consent.

Examples:

- User.Read.All
- Group.Read.All
- Directory.Read.All
- DeviceManagementManagedDevices.Read.All
- Mail.Read
- Files.Read.All

In enterprise environments, admin consent is usually controlled by identity or security administrators.

---

## Practical Permission Mapping

| Scenario | Recommended permission |
|---|---|
| Export users | User.Read.All |
| Export groups | Group.Read.All |
| Export Entra devices | Device.Read.All |
| Export Intune devices | DeviceManagementManagedDevices.Read.All |
| Read Intune policies | DeviceManagementConfiguration.Read.All |
| Read Intune apps | DeviceManagementApps.Read.All |
| Send notification email | Mail.Send |
| Read usage reports | Reports.Read.All |

---

## Key Takeaways

- Permissions control what Microsoft Graph can access.
- Delegated permissions require a signed-in user.
- Application permissions are used for automation.
- Some permissions require admin consent.
- Use least privilege whenever possible.
- Avoid broad permissions unless they are really needed.
