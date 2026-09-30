# MA TRẬN TRUY XUẤT TÍNH NĂNG (FEATURE TRACEABILITY MATRIX) F&B SMART V5.1

Ma trận liên kết xuyên suốt từ Tính năng đến các tầng kiến trúc, nghiệp vụ và kiểm thử:

| Feature ID | Requirement | Screen ID | Business Rule | State | Data Entity | Architecture | Security | Test ID | Work Item | Status | Source |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **FEAT-AUTH-01** | REQ-AUTH-01 | SCR-AUTH-01 | RULE-AUTH-01 | Auth State | ENT-USER | COMP-FEAT-AUTH | CTRL-AUTH-01 | TC-AUTH-01 | WI-AUTH-01 | TRACEABLE | `09_FEATURE_TRACEABILITY` |
| **FEAT-SETUP-01** | REQ-SETUP-01 | SCR-SETUP-01 | RULE-SETUP-01 | Setup State | ENT-STORE | COMP-FEAT-SETUP | CTRL-TENANT-01 | TC-SETUP-01 | WI-SETUP-01 | TRACEABLE | `QUICK_SETUP_DISCOVERY` |
| **FEAT-POS-01** | REQ-POS-01 | SCR-POS-01 | RULE-POS-01 | Order State | ENT-ORD, ENT-ITEM | COMP-FEAT-POS | CTRL-RBAC-01 | TC-POS-01 | WI-POS-01 | TRACEABLE | `POS_ORDERING_DISCOVERY` |
| **FEAT-KDS-01** | REQ-KDS-01 | SCR-KDS-01 | RULE-KDS-01 | KDS State | ENT-ORD | COMP-FEAT-KDS | CTRL-RBAC-01 | TC-KDS-01 | WI-KDS-01 | TRACEABLE | `KDS_KITCHEN_DISCOVERY` |
| **FEAT-PAY-01** | REQ-PAY-01 | SCR-PAY-01 | RULE-PAY-01 | Payment State | ENT-ORD | COMP-FEAT-PAY | CTRL-RBAC-01 | TC-PAY-01 | WI-PAY-01 | TRACEABLE | `CHECKOUT_PAYMENT` |
