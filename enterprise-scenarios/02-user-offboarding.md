# Enterprise Scenario: User Offboarding

## Business Scenario

An employee leaves the organization.

The objective is to immediately revoke access while preserving business data.

---

## High-Level Workflow

```text
HR System
     ↓
Termination Event
     ↓
Automation Platform
     ↓
Microsoft Graph
     ↓
Entra ID
Microsoft 365
Teams
Groups
```

---

## Typical Offboarding Tasks

### 1. Disable User Account

Graph API:

PATCH /users/{id}

Required permission:

User.ReadWrite.All

---

### 2. Revoke Active Sessions

Graph API:

POST /users/{id}/revokeSignInSessions

Purpose:

- Force reauthentication
- Invalidate refresh tokens

---

### 3. Remove Group Memberships

Examples:

- VPN Users
- Finance Users
- HR Users

Required permission:

Group.ReadWrite.All

---

### 4. Remove Licenses

Examples:

- Microsoft 365 E3
- Power BI Pro
- Visio

---

### 5. Transfer Business Data

Examples:

- Mailbox delegation
- OneDrive ownership transfer
- Teams ownership transfer

---

## Required Graph Permissions

| Permission | Purpose |
|------------|----------|
| User.ReadWrite.All | Disable accounts |
| Group.ReadWrite.All | Remove memberships |
| Directory.ReadWrite.All | Directory changes |

---

## Security Benefits

- Immediate access removal
- Reduced insider risk
- Better compliance
- Automated audit trail
