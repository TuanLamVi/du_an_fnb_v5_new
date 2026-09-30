# SƠ ĐỒ ĐIỀU HƯỚNG ỨNG DỤNG (APPLICATION NAVIGATION MAP) F&B SMART V5.1

## 1. Tổng quan cấu trúc điều hướng
Hệ thống F&B SMART V5.1 được tổ chức theo cấu trúc phân tầng, phân quyền rõ ràng giữa các Actor (Owner, Manager, Staff, Kitchen) nhằm đảm bảo thao tác nhanh chóng, chính xác trong môi trường vận hành F&B thực tế.

## 2. Luồng điều hướng tổng thể (Navigation Flow)
```text
[Splash / App Launch]
       ↓
[Đăng nhập / Authentication] (SCR-AUTH-01)
       │
       ├─► [Quản trị cửa hàng / Store Management] (SCR-STORE-01) [Dành cho Owner]
       │         │
       │         ├─► [Quick Setup & Menu Template] (SCR-SETUP-01)
       │         └─► [Cấu hình chung / Settings]
       │
       ├─► [Màn hình Bán hàng / POS] (SCR-POS-01) [Dành cho Staff / Manager]
       │         │
       │         ├─► [Quản lý Bàn / Table Management] (SCR-TABLE-01)
       │         ├─► [Chọn Món & Thêm Topping] (SCR-MENU-SEL-01)
       │         └─► [Thanh toán & Checkout] (SCR-PAY-01)
       │
       ├─► [Màn hình Nhà bếp / KDS] (SCR-KDS-01) [Dành cho Kitchen]
       │
       └─► [Quản lý Ca, Khách hàng & Báo cáo] (SCR-MGR-01) [Dành cho Manager / Owner]
                 ├─► [Quản lý Ca làm việc / Shift] (SCR-SHIFT-01)
                 ├─► [Khách hàng & Công nợ / Customer & Debt] (SCR-CUST-01)
                 └─► [Báo cáo & Thống kê / Reports] (SCR-REP-01)
```

## 3. Entry Points chính
- **Đăng nhập (`SCR-AUTH-01`):** Điểm khởi đầu sau khi khởi chạy ứng dụng đối với người dùng chưa xác thực phiên làm việc.
- **POS / Bán hàng (`SCR-POS-01`):** Điểm đến chính sau khi đăng nhập thành công đối với nhân viên thu ngân/phục vụ.
- **KDS (`SCR-KDS-01`):** Điểm đến chính đối với tài khoản phân quyền nhân viên bếp.
- **Store Setup (`SCR-STORE-01`):** Điểm đến cấu hình ban đầu dành cho Chủ đầu tư (Owner).
