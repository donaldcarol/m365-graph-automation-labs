# Service Principals and Certificates

Service Principals allow applications and automation to authenticate to Microsoft services without requiring a user account.

They are commonly used with Microsoft Graph for unattended automation.

---

## What is a Service Principal?

A Service Principal is an identity created for an application inside Entra ID.

Unlike users:

- does not have a password
- does not require MFA
- used by applications and automation
- can receive permissions

---

## Authentication Flow

```text
PowerShell Script
        ↓
Service Principal
        ↓
Certificate
        ↓
Entra ID
        ↓
Access Token
        ↓
Microsoft Graph
```

---

## Components Required

| Component | Purpose |
|---|---|
| App Registration | Defines the application |
| Service Principal | Identity of the application |
| Certificate | Authentication mechanism |
| Permissions | Define access |
| Access Token | Used for Graph access |

---

## Creating a Self-Signed Certificate

Example:

```powershell
$cert = New-SelfSignedCertificate `
-Subject "CN=GraphAutomation" `
-CertStoreLocation "Cert:\CurrentUser\My"
```

Display certificate:

```powershell
Get-ChildItem Cert:\CurrentUser\My
```

Example output:

```text
Subject                 Thumbprint
-------                 ----------
CN=GraphAutomation      A7F5B2D8E91C...
```

---

## Upload Certificate to App Registration

Steps:

```text
Entra ID
   ↓
App registrations
   ↓
Your Application
   ↓
Certificates & secrets
   ↓
Certificates
   ↓
Upload certificate
```

---

## Grant Graph Permissions

Examples:

- User.Read.All
- Group.Read.All
- DeviceManagementManagedDevices.Read.All

Administrator grants consent:

```text
API Permissions
     ↓
Grant admin consent
```

---

## Connect using Certificate Authentication

Example:

```powershell
Connect-MgGraph `
-ClientId "<ApplicationID>" `
-TenantId "<TenantID>" `
-CertificateThumbprint "<Thumbprint>"
```

---

## Client Secret vs Certificate

| Feature | Client Secret | Certificate |
|---|---:|---:|
| Security | Lower | Higher |
| Expiration | Short | Longer |
| Rotation | Manual | Easier |
| Recommended | No | Yes |

---

## Managed Identity Comparison

| Method | Recommended Use |
|---|---|
| Client Secret | Small labs |
| Certificate | Enterprise automation |
| Managed Identity | Azure resources |

---

## Real-world Example

Nightly automation:

```text
Scheduled Task
       ↓
PowerShell Script
       ↓
Certificate Authentication
       ↓
Microsoft Graph
       ↓
Export Intune Device Report
       ↓
Send Email
```

---

## Key Takeaways

- Service Principals are application identities
- Certificates are preferred over secrets
- Application permissions support automation
- Managed Identity is preferred inside Azure
