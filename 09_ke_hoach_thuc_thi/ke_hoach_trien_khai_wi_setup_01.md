# KẾ HOẠCH TRIỂN KHAI WI-SETUP-01

## 1. WI-SETUP-01
Khởi tạo quán nhanh & Menu mẫu theo Mô hình kinh doanh (Quick Setup Wizard & Business Model Menu Templates).

## 2. Mục tiêu
- Tự động kích hoạt Popup "KHỞI TẠO QUÁN NHANH" (Quick Setup Wizard) khi Chủ quán vừa tạo Store mới hoặc Store chưa có Menu/Bàn.
- Hỗ trợ lựa chọn 1 trong 20 Mô hình kinh doanh F&B Việt Nam (Quán Cà phê, Trà sữa, Bún/Phở, Cơm văn phòng, Quán nhậu, BBQ, etc.).
- Clone độc lập hệ thống Menu mẫu (~15 sản phẩm mẫu với kích thước `sizes`, topping `toppings` và tùy chọn `options`) vào không gian dữ liệu riêng của cửa hàng (`/stores/{storeId}/categories` & `/stores/{storeId}/products`).
- Tự động khởi tạo 1 Khu vực mặc định ("Khu vực 1") tại `/stores/{storeId}/zones/{zoneId}`.
- Tự động khởi tạo chính xác 10 bàn mặc định ("Bàn 01" → "Bàn 10") tại `/stores/{storeId}/tables/{tableId}` với `status = 'available'`.
- Bán hàng ngay tức thì trên POS sau khi hoàn tất Quick Setup ("Sẵn sàng bán hàng").

## 3. Phạm vi (In Scope)
- `QuickSetupWizardDialog`: UI chọn 1 trong 20 mô hình F&B.
- `SystemMenuTemplates`: Repository/Data chứa danh mục & sản phẩm mẫu cho các mô hình (đặc biệt chuẩn hóa 2 mô hình Cà phê và Bún/Phở).
- `QuickSetupService`: Logic batch write tạo Categories, Products, Zones ("Khu vực 1") và 10 Tables ("Bàn 01" -> "Bàn 10") trên Firestore.
- Firestore Security Rules: Cập nhật match rules cho `categories`, `products`, `zones`, `tables` dưới `/stores/{storeId}`.

## 4. Ngoài phạm vi (Out of Scope)
- Các mô hình giá đặc biệt phức tạp (Hải sản tính theo 100g, Buffet theo đầu người, Combo bundle phức tạp, Tạp hóa barcode) -> Giáng cấp xuống Discovery / Deferred Post-MVP theo DECISION-066-03.
- Giao diện chỉnh sửa Menu nâng cao (thêm/sửa/xóa sản phẩm thủ công) -> Thuộc phân hệ Quản lý Menu (WI-MENU-01).
- Mở bàn, gọi món, in bếp, thanh toán -> Thuộc WI-POS-01, WI-KDS-01, WI-PAY-01.

## 5. Nguồn yêu cầu
- `docs-123/QUICK_SETUP_MENU_TEMPLATE_DISCOVERY_V5.1.md`
- `docs-123/BUSINESS_MODELS_MENU_TEMPLATES_V5.1.md`
- `docs-123/DATABASE_SCHEMA_V0.1.md`
- `docs-123/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`

## 6. Phụ thuộc (Dependencies)
- WI-AUTH-01 (Đã hoàn thành và LOCKED): Store `/stores/{storeId}` và Owner membership `role_owner` active đã được tạo sẵn.

## 7. Các thành phần cần tạo & sửa

| STT | Thành phần | Tạo mới / Sửa | Nguồn yêu cầu | Mục đích |
| --- | ---------- | ------------- | ------------- | -------- |
| 1 | `CategoryModel` & `ProductModel` | Tạo mới | DATABASE_SCHEMA_V0.1 | Data models cho danh mục và sản phẩm mẫu |
| 2 | `ZoneModel` & `TableModel` | Tạo mới | DATABASE_SCHEMA_V0.1 | Data models cho khu vực và bàn ăn |
| 3 | `SystemMenuTemplates` | Tạo mới | BUSINESS_MODELS_MENU_TEMPLATES_V5.1 | Blueprint chứa danh mục & sản phẩm mẫu của 20 mô hình |
| 4 | `QuickSetupService` | Tạo mới | QUICK_SETUP_MENU_TEMPLATE_DISCOVERY_V5.1 | Service thực hiện Batch Write clone Menu, Zone 1, 10 Bàn vào Firestore |
| 5 | `QuickSetupWizardDialog` | Tạo mới | QUICK_SETUP_MENU_TEMPLATE_DISCOVERY_V5.1 | Dialog UI chọn mô hình kinh doanh & bấm "Khởi tạo" |
| 6 | `DashboardPlaceholderView` | Sửa | QUICK_SETUP_MENU_TEMPLATE_DISCOVERY_V5.1 | Tự động kiểm tra & bật Quick Setup Wizard nếu Store chưa có dữ liệu |
| 7 | `firestore.rules` | Sửa | DATABASE_SCHEMA_V0.1 | Thêm match rules cho `categories`, `products`, `zones`, `tables` |

## 8. Thứ tự thực hiện dự kiến
1. Cập nhật `firestore.rules` cho `categories`, `products`, `zones`, `tables`.
2. Định nghĩa `CategoryModel`, `ProductModel`, `ZoneModel`, `TableModel`.
3. Định nghĩa `SystemMenuTemplates` cho 20 mô hình F&B.
4. Xây dựng `QuickSetupService` (Batch Write Firestore).
5. Xây dựng `QuickSetupWizardDialog` UI.
6. Tích hợp trích xuất Quick Setup Wizard trên Dashboard.
7. Chạy test, analyze & build debug APK.

## 9. Tiêu chí nghiệm thu PO
- Bấm chọn 1 mô hình kinh doanh → Khởi tạo thành công menu mẫu, 1 khu vực và đúng 10 bàn.
- Firestore ghi đúng đường dẫn `/stores/{storeId}/categories`, `/products`, `/zones`, `/tables`.
- Không bị nổ lỗi `permission-denied`.
