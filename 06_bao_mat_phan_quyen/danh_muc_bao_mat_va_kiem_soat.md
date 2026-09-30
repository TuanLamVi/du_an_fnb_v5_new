# DANH MỤC BẢO MẬT VÀ KIỂM SOÁT (SECURITY CONTROLS CATALOG) F&B SMART V5.1

Catalog tổng hợp các biện pháp kiểm soát bảo mật:

| Control ID | Biện pháp kiểm soát | Mục đích | Tầng bảo vệ | Resource áp dụng | Trạng thái | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **CTRL-AUTH-01** | Firebase Auth Verification | Xác thực định danh tài khoản | Authentication | Global / User | CONFIRMED | Master Spec |
| **CTRL-TENANT-01** | Store ID Isolation | Cô lập dữ liệu giữa các chi nhánh | Data Layer | All Collections | CONFIRMED | Database Schema |
| **CTRL-RBAC-01** | Role-Based Access Control | Phân quyền theo vai trò người dùng | Authorization | UI & Features | CONFIRMED | Security Spec |
| **CTRL-LEGO-02** | Modular Permission Flags | Tùy chỉnh quyền chi tiết theo mô hình LEGO | Authorization | Operations | CONFIRMED | Staff Lego Discovery |
