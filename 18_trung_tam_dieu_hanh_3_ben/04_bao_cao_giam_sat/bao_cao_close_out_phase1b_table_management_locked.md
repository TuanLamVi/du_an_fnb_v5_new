===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — PHASE 1B TABLE MANAGEMENT LOCKED =====

WORK ITEM:
Phase 1B — Table Management (Quản lý Bàn)

PO DECISION:
PO_VERIFIED (Xác nhận bởi Tuấn — PO / Chủ đầu tư)

STATUS:
* IMPLEMENTED: YES (PASS)
* TECHNICAL TESTS: YES (165/165 tests PASS, wi_table_management_test.dart 10/10 PASS)
* STATIC ANALYSIS: YES (0 errors)
* BUILT: YES (Debug APK SHA256: 1503A7CD144F3340FB3F452865C11BCFB317479C4BD5105BD53EB182AF19E994)
* DEVICE TEST: YES (Installed & Launched PASS on Samsung Galaxy M51 & Note 8)
* PO TEST: PASS (Thêm bàn PASS, Sửa tên bàn PASS, Đổi khu vực PASS, Đổi thứ tự PASS, Xóa bàn trống PASS, Delete Guard PASS, Table Map cập nhật PASS, Regression PASS)
* PROTECTED: YES
* LOCKED: YES

PROTECTION SCOPE:
1. Table CRUD in TableRepository (`createTable`, `updateTable`, `deleteTable`).
2. Delete Safety Guard (`state == available` & `currentOrderId == null`).
3. Table Management View (`lib/features/setup/views/table_management_view.dart`).
4. Dashboard Navigation (`DashboardPlaceholderView` Tier 3 Quản lý & Hành chính).
5. Permission Enforcement (`PERM-STORE-CFG` for Owner & Manager; Staff blocked).
6. Real-time Table Map synchronization & Historical Data Integrity.

AUTHORIZATION:
Tuấn — PO / Chủ đầu tư (PROMPT-103)

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
