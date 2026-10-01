===== BÁO CÁO ĐẶC TẢ VÀ KẾ HOẠCH TRIỂN KHAI WI-SETUP-01 =====

WORK ITEM:
WI-SETUP-01 — Khởi tạo quán nhanh & Menu mẫu theo Mô hình kinh doanh (Quick Setup & Business Model Menu Templates)

TÀI LIỆU ĐÃ ĐỌC & ĐỐI CHIẾU:
- docs-123/QUICK_SETUP_MENU_TEMPLATE_DISCOVERY_V5.1.md
- docs-123/BUSINESS_MODELS_MENU_TEMPLATES_V5.1.md
- docs-123/DATABASE_SCHEMA_V0.1.md
- docs-123/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md
- firestore.rules (Phiên bản hiện tại)

PHẠM VI XÁC NHẬN (IN SCOPE):
1. UI Wizard "KHỞI TẠO QUÁN NHANH" chọn 1 trong 20 mô hình F&B Việt Nam.
2. System Menu Templates clone menu mẫu (~15 món có sizes, toppings, options) vào `/stores/{storeId}/categories` và `/stores/{storeId}/products`.
3. Tự động khởi tạo 1 Khu vực mặc định ("Khu vực 1") tại `/stores/{storeId}/zones/{zoneId}`.
4. Tự động khởi tạo đúng 10 bàn mặc định ("Bàn 01" → "Bàn 10") tại `/stores/{storeId}/tables/{tableId}` với `status = 'available'`.
5. Bổ sung Firestore Security Rules cho `categories`, `products`, `zones`, `tables` dưới `/stores/{storeId}`.

NGOÀI PHẠM VI (OUT OF SCOPE):
- Các mô hình giá phức tạp (Hải sản theo 100g, Buffet đầu người, Combo bundle, Tạp hóa retail) -> Đã giáng cấp xuống Post-MVP / Deferred.
- Chỉnh sửa Menu nâng cao (thêm/sửa/xóa sản phẩm thủ công) -> Thuộc WI-MENU-01.
- Mở bàn, gọi món, in bếp, thanh toán -> Thuộc WI-POS-01, WI-KDS-01, WI-PAY-01.

PHỤ THUỘC (DEPENDENCIES):
- WI-AUTH-01 (Đã hoàn thành, PO PASSED & LOCKED): Đã có Store `/stores/{storeId}` và Owner membership `role_owner` active.

CẤU TRÚC CODE DỰ KIẾN:
- Models: `CategoryModel`, `ProductModel`, `ZoneModel`, `TableModel`
- Data/Service: `SystemMenuTemplates`, `QuickSetupService` (Batch write Firestore)
- Views: `QuickSetupWizardDialog`
- Rules: Match rules cho `categories`, `products`, `zones`, `tables` trong `firestore.rules`

SOURCE / FIREBASE CHANGES:
NONE (Chưa viết code, chưa sửa source, chưa sửa rules, chưa đổi dữ liệu Firebase theo đúng chỉ đạo).

BLOCKERS / UNRESOLVED POINTS:
KHÔNG (Hồ sơ dự án đã đầy đủ căn cứ).

TRẠNG THÁI:
READY FOR PO REVIEW

==================================================
CHỜ PO XÁC NHẬN VÀ PHÊ DUYỆT BẮT ĐẦU KẾ HOẠCH BẰNG CODE
==================================================
