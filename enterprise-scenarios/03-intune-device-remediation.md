# Enterprise Scenario: Intune Device Remediation

## Business Scenario

A device becomes non-compliant.

Examples:

- Antivirus disabled
- Encryption missing
- Outdated operating system

---

## High-Level Workflow

```text
Intune
    ↓
Non-Compliant Device
    ↓
Automation
    ↓
Microsoft Graph
    ↓
Device Action
```

---

## Typical Remediation Actions

### 1. Retrieve Device Status

Graph API:

GET /deviceManagement/managedDevices

Required permission:

DeviceManagementManagedDevices.Read.All

---

### 2. Trigger Device Sync

Graph API:

POST /deviceManagement/managedDevices/{id}/syncDevice

---

### 3. Notify User

Examples:

- Email
- Teams notification

---

### 4. Escalate Persistent Issues

Examples:

- Create ServiceNow ticket
- Notify support team

---

### 5. Retire or Wipe Device

Graph API:

POST /deviceManagement/managedDevices/{id}/wipe

Required permission:

DeviceManagementManagedDevices.ReadWrite.All

---

## Business Benefits

- Faster remediation
- Improved compliance
- Reduced support effort
