# Enterprise Scenario: User Onboarding

## Business Scenario

A new employee joins the company.

The HR system becomes the authoritative source and triggers an automated onboarding workflow.

The objective is to provision all required resources without manual administrator intervention.

---

## High-Level Workflow

```text
HR System
     ↓
New Employee Record
     ↓
Automation Platform
     ↓
Microsoft Graph
     ↓
Entra ID
Microsoft 365
Teams
Groups
Licenses
```

---

## Typical Onboarding Tasks

### 1. Create User

Graph API:

POST /users

Required permission:

User.ReadWrite.All

---

### 2. Assign Usage Location

Required for licensing.

Example:

Romania

United Kingdom

Germany

---

### 3. Assign Licenses

Examples:

Microsoft 365 E3

Microsoft 365 E5

Business Premium

Graph API:

POST /users/{id}/assignLicense

Required permission:

Directory.ReadWrite.All

---

### 4. Add User to Security Groups

Examples:

VPN Users

Finance Users

HR Users

Required permission:

Group.ReadWrite.All

---

### 5. Add User to Teams

Examples:

Finance Team

Operations Team

IT Team

---

### 6. Notify Manager

Automation sends email:

Account created
License assigned
Access ready

---

## Required Graph Permissions

| Permission | Purpose |
|------------|----------|
| User.ReadWrite.All | Create users |
| Group.ReadWrite.All | Group membership |
| Directory.ReadWrite.All | Directory changes |

---

## Security Considerations

Apply least privilege.

Use Service Principal or Managed Identity.

Avoid Client Secrets.

Prefer Certificate Authentication.

---

## Business Benefits

- Faster onboarding
- Fewer errors
- Consistent provisioning
- Better compliance
- Reduced administrative effort
