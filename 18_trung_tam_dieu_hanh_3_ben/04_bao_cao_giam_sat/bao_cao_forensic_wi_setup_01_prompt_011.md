===== BÁO CÁO FORENSIC SỰ CỐ PO TEST WI-SETUP-01 (PROMPT-011) =====

1. FACT TỪ SOURCE CODE HIỆN TẠI
- `system_menu_templates.dart`: Hiện tại chỉ chứa 4 mô hình (`coffee_shop`, `noodle_shop`, `milk_tea`, `rice_shop`). Thiếu 16 mô hình F&B.
- `quick_setup_wizard_dialog.dart`: State quản lý 1 mô hình `String _selectedModelId = 'coffee_shop'` với UI chọn đơn (single-selection).
- `member_model.dart`: Hàm `toJson()` ghi trường `'role': role` (không có trường `roleId`).
- `firestore.rules`: Hàm `isStoreActiveOwner(storeId)` kiểm tra `get(.../members/$(uid)).data.roleId == 'role_owner'` (yêu cầu trường `roleId`).

2. REQUIREMENT TỪ HỒ SƠ DỰ ÁN
- `QUICK_SETUP_MENU_TEMPLATE_DISCOVERY_V5.1.md` Part B: Quy định đầy đủ 20 Mô hình kinh doanh F&B Việt Nam.
- `QUICK_SETUP_MENU_TEMPLATE_DISCOVERY_V5.1.md` Part A & C: Cho phép chọn nhiều mô hình cùng lúc (Multi-selection, ví dụ: Cà phê + Trà sữa + Ăn vặt). Khi chọn nhiều mô hình, hệ thống sẽ clone và gộp danh mục/sản phẩm của tất cả mô hình đã chọn vào không gian dữ liệu riêng của cửa hàng (`/stores/{storeId}/categories` & `/stores/{storeId}/products`).
- `DATABASE_SCHEMA_V0.1.md`: Quy định tài liệu Store có `createdBy`, tài liệu Member có `role` / `roleId` và `status = 'active'`.

3. GAP HIỆN TẠI
- Thiếu 16 mô hình kinh doanh F&B trong template.
- UI Wizard hiện tại là chọn đơn (Radio/Single-select) thay vì chọn nhiều (Multi-select Checkbox/FilterChips).
- Bất nhất field name giữa `MemberModel` (`'role'`) và `firestore.rules` (`'roleId'`).

4. RUNTIME ERROR THỰC TẾ
Khi bấm "KHỞI TẠO BẮT ĐẦU BÁN HÀNG", quá trình khởi tạo dừng và nổ lỗi:
`[cloud_firestore/permission-denied] The caller does not have permission to execute the specified operation`

5. ROOT CAUSE CỦA LỖI KHỞI TẠO
- Khi `QuickSetupService.runQuickSetup` thực hiện batch write các đường dẫn `/categories`, `/products`, `/zones`, `/tables` dưới `/stores/{storeId}`, Firestore Security Rules kiểm tra `allow write: if isStoreActiveOwner(storeId)`.
- Hàm `isStoreActiveOwner(storeId)` trong `firestore.rules` truy vấn document `/stores/{storeId}/members/{uid}` và kiểm tra điều kiện:
  `get(/databases/$(database)/documents/stores/$(storeId)/members/$(request.auth.uid)).data.roleId == 'role_owner'`
- Do `MemberModel.toJson()` chỉ serialize trường `'role': 'role_owner'` mà KHÔNG có trường `'roleId'`, giá trị `data.roleId` bị `null`, khiến điều kiện `isStoreActiveOwner` đánh giá thành `false` và Firestore từ chối toàn bộ batch write với lỗi `permission-denied`.

6. RULES EVIDENCE
- `firestore.rules` dòng 16: `get(/databases/$(database)/documents/stores/$(storeId)/members/$(request.auth.uid)).data.roleId == 'role_owner'`.
- `member_model.dart` dòng 14: `'role': role` (thiếu `roleId`).

7. THIẾT KẾ CẦN SỬA (SURGICAL FIX PROPOSED):
- Fix 1 (MemberModel & Payload): Bổ sung cả `'role': role` và `'roleId': role` trong `MemberModel.toJson()` và `MemberModel.fromJson()`.
- Fix 2 (Firestore Rules helper): Cập nhật `isStoreActiveOwner(storeId)` trong `firestore.rules` để chấp nhận cả `data.roleId == 'role_owner'` và `data.role == 'role_owner'`, cũng như kiểm tra cả `data.createdBy` và `data.ownerUid`.
- Fix 3 (20 Mô hình F&B): Bổ sung đầy đủ 20 mô hình F&B trong `system_menu_templates.dart`.
- Fix 4 (Multi-select UI & Service): Cập nhật `QuickSetupWizardDialog` sang chọn nhiều mô hình (`Set<String> _selectedModelIds`) và cập nhật `QuickSetupService.runQuickSetup` nhận `List<String> modelIds` để clone gộp menu của các mô hình đã chọn.

8. FORENSIC STATUS
FORENSIC STATUS: READY FOR SURGICAL FIX
