# MÔ HÌNH BẢO MẬT (SECURITY MODEL) F&B SMART V5.1

## 1. Tổng quan mô hình bảo mật
Mô hình bảo mật của F&B SMART V5.1 được xây dựng dựa trên nguyên tắc phân quyền theo vai trò (Role-Based Access Control - RBAC) kết hợp với mô hình phân quyền module dạng LEGO (`STAFF_LEGO_PERMISSION_DISCOVERY_V5.1.md`) và cơ chế cô lập dữ liệu đa khách hàng (Tenant / Store Isolation).

## 2. Các tầng bảo vệ (Security Layers)
- **Authentication Layer (Xác thực):** Xác thực định danh người dùng thông qua Firebase Authentication.
- **Authorization Layer (Phân quyền):** Kiểm soát quyền truy cập tài nguyên (Resources) và thao tác (Actions) dựa trên Role và Permission của nhân sự trong cửa hàng.
- **Data Isolation Layer (Cô lập dữ liệu):** Mọi truy vấn Cloud Firestore đều bị giới hạn bởi `storeId` (Tenant Scope), ngăn chặn truy cập chéo giữa các cửa hàng khác nhau.
- **Client & Backend Boundary:** Quy tắc bảo mật Firebase Security Rules bảo vệ dữ liệu ở tầng server.
