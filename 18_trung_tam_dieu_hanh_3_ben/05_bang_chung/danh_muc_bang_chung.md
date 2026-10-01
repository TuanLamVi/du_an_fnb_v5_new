# DANH MỤC BẰNG CHỨNG (EVIDENCE CATALOG) F&B SMART V5.1

## 1. WI-DEBT-01 Evidence (Customer Debt & Repayment)
- **Unit Tests:** 12/12 passed (`flutter test`).
- **Static Analysis:** `flutter analyze` 0 issues.
- **Git Commit:** `74cfe559cc374de8ee3952cfdc601e6a54f5aea9`
- **Build APK:** `build\app\outputs\flutter-apk\app-debug.apk` (SHA256: `C5C0D461BE2F808809E9F39A0A5F6C96A0BF1DC90179AF10F8616126BAAB8F98`).
- **Device Verification:** Installed & Launched on Samsung Galaxy M51 (`RF8NC11QQVM`) & Note 8 (`988e50385a3931435330`).
- **PO Verification:** `PO_VERIFIED / PROTECTED / LOCKED` (PO Tuấn).

## 2. WI-STAFF-01 Evidence (Staff Management & Lego Permission)
- **Architecture Freeze:** Approved by PO Tuấn (Reject = DELETE, Permission Model = ROLE + INDIVIDUAL OVERRIDE).
- **Source Files:**
  - `lib/features/auth/models/permission_catalog.dart`
  - `lib/features/auth/models/member_model.dart`
  - `lib/features/auth/data/member_repository.dart`
  - `lib/features/auth/views/owner_approval_view.dart`
  - `lib/features/auth/views/staff_management_view.dart`
  - `lib/features/auth/views/staff_detail_permission_view.dart`
  - `lib/features/auth/views/dashboard_placeholder_view.dart`
  - `test/wi_staff_01_test.dart`
- **Unit Tests:** 15/15 passed (`flutter test`).
- **Static Analysis:** `flutter analyze` 0 issues found.
- **Git Commit & Remote Push:** `447a9479cc374de8ee3952cfdc601e6a54f5aea9` (Pushed to GitHub `TuanLamVi/fnb-smart-v5` main).
- **Build APK:** `build\app\outputs\flutter-apk\app-debug.apk` (SHA256: `8DD1DE7B826EA54E6AEC9ECB9B4C598E8C9C7B386F45198FFEC1E39470205F1F`, Time: 10/1/2026 11:14:11 AM).
- **Device Verification:** Installed & Launched on Samsung Galaxy M51 (`RF8NC11QQVM`) & Note 8 (`988e50385a3931435330`).
- **PO Verification Status:** `PENDING PO TEST`.
