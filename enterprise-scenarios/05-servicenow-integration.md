# Enterprise Scenario: ServiceNow Integration

## Business Scenario

A user requests access through ServiceNow.

The request is approved and fulfilled automatically.

---

## High-Level Workflow

```text
Employee
     ↓
ServiceNow Request
     ↓
Manager Approval
     ↓
Automation
     ↓
Microsoft Graph
     ↓
Access Provisioning
```

---

## Example Request

Request:

Add user to VPN access group.

---

## Automation Steps

### 1. Validate Approval

Check:

- Request approved
- Correct manager

---

### 2. Locate User

Graph API:

GET /users

Required permission:

User.Read.All

---

### 3. Add User to Group

Graph API:

POST /groups/{id}/members/$ref

Required permission:

Group.ReadWrite.All

---

### 4. Notify Requester

Examples:

- Email
- Teams notification

---

### 5. Close Ticket

Status:

Completed

---

## Required Permissions

| Permission | Purpose |
|------------|----------|
| User.Read.All | Find user |
| Group.ReadWrite.All | Modify groups |

---

## Business Benefits

- Faster fulfillment
- Reduced manual effort
- Consistent access management
- Improved auditability
