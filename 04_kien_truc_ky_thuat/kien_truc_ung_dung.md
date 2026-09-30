# KIẾN TRÚC ỨNG DỤNG (APPLICATION ARCHITECTURE) F&B SMART V5.1

## 1. Cấu trúc Package & Module (Feature-based Clean Architecture)
Ứng dụng tuân thủ mô hình Clean Architecture kết hợp Modular / Feature-based structure tại thư mục `clean_rebuild_v5/`:

```text
clean_rebuild_v5/lib/
  ├── core/               # Các thành phần dùng chung (Theme, Network, Base classes, Utils)
  ├── features/           # Các phân hệ tính năng độc lập (Feature-based)
  │     ├── auth/         # Phân hệ Đăng nhập & Xác thực
  │     ├── store/        # Quản lý cửa hàng & Quick Setup
  │     ├── menu/         # Quản lý thực đơn & danh mục
  │     ├── pos/          # Màn hình bán hàng & giỏ hàng
  │     ├── table/        # Quản lý bàn & khu vực
  │     ├── kds/          # Màn hình nhà bếp
  │     ├── payment/      # Thanh toán & Checkout
  │     ├── customer/     # Khách hàng & Công nợ
  │     ├── shift/        # Quản lý ca làm việc
  │     └── reports/      # Báo cáo thống kê
  └── app.dart            # Điểm khởi chạy ứng dụng
```

## 2. Phân tầng bên trong mỗi Feature
Mỗi Feature được chia thành 3 tầng chuẩn (Clean Architecture):
- **Presentation Layer:** UI Widgets, Screens, và State Management (Bloc / Cubit / Provider theo chuẩn source).
- **Domain Layer:** Entities, Use Cases (Chứa logic nghiệp vụ thuần túy không phụ thuộc framework).
- **Data Layer:** Models, Data Sources (Firestore / Local), và Repository Implementations.

## 3. Dependency Direction
- Phụ thuộc hướng vào trong (Inbound dependency): Presentation → Domain ← Data. Tầng Domain hoàn toàn độc lập.
