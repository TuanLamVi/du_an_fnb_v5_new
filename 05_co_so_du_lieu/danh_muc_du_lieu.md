# DANH MỤC DỮ LIỆU (DATA CATALOG) F&B SMART V5.1

Danh mục các entity chính được tổng hợp từ `DATABASE_SCHEMA_V0.1.md`:

| Entity ID | Tên Entity | Collection / Path | Mục đích | Tenant Scope | Quan hệ | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **ENT-STORE** | Store | `/stores/{storeId}` | Lưu thông tin cơ bản của cửa hàng/chi nhánh | Global / Tenant Root | Root Entity | `DATABASE_SCHEMA` |
| **ENT-TABLE** | Table | `/stores/{storeId}/tables/{tableId}` | Quản lý bàn và khu vực | `storeId` | Thuộc Store | `TABLE_MANAGEMENT_DISCOVERY` |
| **ENT-CAT** | Category | `/stores/{storeId}/categories/{categoryId}` | Quản lý danh mục thực đơn | `storeId` | Thuộc Store | `BUSINESS_MODELS_MENU` |
| **ENT-PROD** | Product | `/stores/{storeId}/products/{productId}` | Quản lý sản phẩm, giá, topping | `storeId` | Thuộc Category | `BUSINESS_MODELS_MENU` |
| **ENT-ORD** | Order | `/stores/{storeId}/orders/{orderId}` | Lưu thông tin đơn hàng và thanh toán | `storeId` | Chứa Order Lines | `POS_ORDERING_DISCOVERY` |
| **ENT-ITEM** | Order Line | `/stores/{storeId}/orders/{orderId}/items/{itemId}` | Lưu danh sách món trong đơn hàng | `storeId` | Thuộc Order | `POS_ORDERING_DISCOVERY` |
| **ENT-SHIFT** | Shift | `/stores/{storeId}/shifts/{shiftId}` | Quản lý mở/đóng ca làm việc | `storeId` | Thuộc Store | `SHIFT_MANAGEMENT_DISCOVERY` |
| **ENT-CUST** | Customer | `/stores/{storeId}/customers/{customerId}` | Quản lý khách hàng và điểm tích lũy | `storeId` | Thuộc Store | `CUSTOMER_LOYALTY_DISCOVERY` |
