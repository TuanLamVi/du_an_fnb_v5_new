# SƠ ĐỒ CƠ SỞ DỮ LIỆU VÀ KIẾN TRÚC DỮ LIỆU F&B SMART V5.1

## 1. Tổng quan cơ sở dữ liệu
Hệ thống sử dụng Cloud Firestore (NoSQL) làm cơ sở dữ liệu chính, được thiết kế theo mô hình multi-tenant tập trung phân nhánh theo từng cửa hàng (`storeId`).

## 2. Tenant / Store Scope & Canonical Paths
Mọi tài nguyên cốt lõi của hệ thống đều tuân thủ đường dẫn chuẩn (Canonical Paths) bắt đầu từ gốc cửa hàng:
- Cửa hàng (Store): `/stores/{storeId}`
- Bàn (Tables): `/stores/{storeId}/tables/{tableId}`
- Thực đơn (Menu Categories & Products): `/stores/{storeId}/categories/{categoryId}`, `/stores/{storeId}/products/{productId}`
- Đơn hàng (Orders): `/stores/{storeId}/orders/{orderId}`
- Chi tiết món trong đơn (Order Lines): `/stores/{storeId}/orders/{orderId}/items/{itemId}`
- Ca làm việc (Shifts): `/stores/{storeId}/shifts/{shiftId}`
- Khách hàng (Customers): `/stores/{storeId}/customers/{customerId}`

## 3. Quan hệ dữ liệu (Data Relationships)
- **Parent-Child:** Các collection con như `items` nằm bên trong document `orders`, đảm bảo tính toàn vẹn khi truy vấn giao dịch đơn hàng.
- **Foreign Key / Reference ID:** Tham chiếu qua `storeId`, `categoryId`, `productId`, `tableId`, `staffId` giúp liên kết các domain với nhau mà vẫn giữ hiệu suất truy vấn cao của NoSQL.
