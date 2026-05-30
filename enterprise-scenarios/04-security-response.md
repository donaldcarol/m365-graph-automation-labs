# Enterprise Scenario: Security Incident Response

## Business Scenario

A suspicious sign-in or compromised account is detected.

The objective is to contain the threat automatically.

---

## High-Level Workflow

```text
Defender
    ↓
Security Alert
    ↓
Automation
    ↓
Microsoft Graph
    ↓
Containment Actions
```

---

## Typical Actions

### 1. Disable User

Graph API:

PATCH /users/{id}

---

### 2. Revoke Sessions

Graph API:

POST /users/{id}/revokeSignInSessions

---

### 3. Remove Privileged Access

Examples:

- Global Administrator
- Intune Administrator
- Exchange Administrator

---

### 4. Notify Security Team

Examples:

- Email
- Teams
- SIEM

---

### 5. Generate Investigation Report

Contents:

- User information
- Devices
- Group memberships
- Recent sign-ins

---

## Required Permissions

| Permission | Purpose |
|------------|----------|
| User.ReadWrite.All | Disable account |
| Directory.Read.All | Investigation |
| Group.ReadWrite.All | Remove access |

---

## Business Benefits

- Faster containment
- Reduced attack impact
- Improved security posture
