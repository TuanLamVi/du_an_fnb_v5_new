# MA TRẬN PHÂN QUYỀN (PERMISSION MATRIX) F&B SMART V5.1

Ma trận phân quyền chi tiết cho các tài nguyên (Resources) trong hệ thống:

| Resource | Action | ROLE-OWNER | ROLE-MANAGER | ROLE-STAFF | ROLE-KITCHEN | Scope | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Store** | Read/Update | Allow | Allow (Read) | Deny | Deny | Store ID | `06_SECURITY_PERMISSION` |
| **Employee** | CRUD | Allow | Allow (Limited) | Deny | Deny | Store ID | `STAFF_LEGO_PERMISSION` |
| **Table** | Read/Update | Allow | Allow | Allow | Deny | Store ID | `TABLE_MANAGEMENT` |
| **Menu / Product** | CRUD | Allow | Allow | Deny | Deny | Store ID | `BUSINESS_MODELS_MENU` |
| **Order** | CRUD | Allow | Allow | Allow | Deny (Read/Update Status) | Store ID | `POS_ORDERING` |
| **KDS** | Read/Update | Allow | Allow | Deny | Allow | Store ID | `KDS_KITCHEN` |
| **Payment** | Execute | Allow | Allow | Allow | Deny | Store ID | `CHECKOUT_PAYMENT` |
| **Shift** | Open/Close | Allow | Allow | Allow | Deny | Store ID | `SHIFT_MANAGEMENT` |
| **Reports** | Read | Allow | Allow (Shift reports) | Deny | Deny | Store ID | `REPORTS_ANALYTICS` |
