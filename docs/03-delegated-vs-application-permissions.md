# Delegated vs Application Permissions



Microsoft Graph supports two permission models:



- Delegated permissions

- Application permissions



The authentication model determines how the application accesses Microsoft resources.



---



## Delegated Permissions



Delegated permissions are used when a signed-in user is present.



The application acts on behalf of the authenticated user.



```text

User

  ↓

Application

  ↓

Graph API

  ↓

Resource

```



Examples:



- User.Read

- Mail.Read

- Group.Read.All



PowerShell example:



```powershell

Connect-MgGraph -Scopes "User.Read"

```



Advantages:



- Supports MFA

- Uses existing user permissions

- Easier for testing



Limitations:



- Requires user interaction

- Cannot run fully unattended



---



## Application Permissions



Application permissions are used when no user is signed in.



The application acts independently.



```text

Application

     ↓

Service Principal

     ↓

Graph API

     ↓

Resource

```



Examples:



- User.Read.All

- Directory.Read.All

- DeviceManagementManagedDevices.Read.All



PowerShell example:



```powershell

Connect-MgGraph `

-ClientId "<ClientID>" `

-TenantId "<TenantID>" `

-CertificateThumbprint "<Thumbprint>"

```



Advantages:



- Fully automated

- Suitable for background services



Limitations:



- Usually requires admin consent

- Higher security risk if over-permissioned



---



## Permission comparison



| Feature | Delegated | Application |

|-----------|------------|-------------|

| User required | Yes | No |

| Supports MFA | Yes | No |

| Automation | Limited | Yes |

| Background services | No | Yes |

| Admin consent required | Sometimes | Usually |



---



## Real-world examples



Delegated:



Administrator exports users manually.



Application:



Nightly automation checks all Intune devices and generates reports.

