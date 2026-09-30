# HỢP ĐỒNG DỮ LIỆU (DATA CONTRACTS) F&B SMART V5.1

Mô tả chi tiết cấu trúc trường (Fields) cho các Entity cốt lõi:

## 1. Entity: Order (`/stores/{storeId}/orders/{orderId}`)
- `orderId` (String, Required): Định danh duy nhất đơn hàng.
- `storeId` (String, Required): Định danh cửa hàng (Tenant scope).
- `tableId` (String, Optional): Định danh bàn phục vụ (nếu ăn tại bàn).
- `status` (String, Required): Trạng thái đơn hàng (`Draft`, `Submitted`, `Preparing`, `Completed`, `Paid`, `Cancelled`).
- `totalAmount` (Number, Required): Tổng tiền đơn hàng (`>= 0`).
- `paymentStatus` (String, Required): Trạng thái thanh toán (`Pending`, `Success`).
- `createdAt` (Timestamp, Required): Thời gian tạo đơn.
- `updatedAt` (Timestamp, Required): Thời gian cập nhật gần nhất.

## 2. Entity: Product (`/stores/{storeId}/products/{productId}`)
- `productId` (String, Required): Định danh sản phẩm.
- `storeId` (String, Required): Định danh cửa hàng.
- `categoryId` (String, Required): Định danh danh mục sản phẩm.
- `name` (String, Required): Tên sản phẩm.
- `price` (Number, Required): Giá bán (`>= 0`).
- `isAvailable` (Boolean, Required): Trạng thái còn hàng / tạm ngưng.
