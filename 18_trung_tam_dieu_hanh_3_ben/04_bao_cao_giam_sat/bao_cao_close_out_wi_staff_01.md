===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-STAFF-01 =====

WORK ITEM:
WI-STAFF-01 (Staff Management, Owner Approval & Lego Permission Control)

PROMPT / TASK:
- First Failure Forensic Round 2 Fixes (Store Code on Staff Management, Order Submit Table Write Permission, Real-Time Permission StreamBuilder) for WI-STAFF-01

PO DECISION:
PENDING PO TEST (Chờ Chủ quán Tuấn trực tiếp kiểm tra thực tế trên thiết bị).

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (17/17 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `8AD19285EC6CBC4D7ECBFF7DBC936C184EE53B74DFB193875B630F84D860F443`, Time: 10/1/2026 12:42:22 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `29a7f78` to `origin main`)

SUMMARY OF WORK COMPLETED & ROUND 2 FIXES:
1. **ISSUE-01 Fix (Store Code on Staff Management):** Cập nhật `StaffManagementView` hiển thị độc quyền `invitationCode` ngắn 6 ký tự in hoa (ví dụ: `KH7A29`) thay vì long `storeId`.
2. **ISSUE-02 Fix (Order Submit Table Write Permission):** Sửa lỗi Firestore Security Rules tại `match /tables/{tableId}` (`allow write: if isStoreActiveMember(storeId) || isStoreActiveOwner(storeId);`), cho phép nhân viên được phê duyệt (`role_staff`) cập nhật trạng thái bàn sang `occupied` khi thực hiện Submit Order thành công.
3. **ISSUE-03 Fix (Real-Time Permission StreamBuilder):** Bọc `DashboardPlaceholderView` bằng Firestore `.snapshots()` stream (`streamMembership`), giúp thay đổi phân quyền hoặc chức vụ của Owner có hiệu lực **ngay lập tức** trên phiên đang mở của nhân viên mà không cần khởi động lại ứng dụng (Đáp ứng tuyệt đối Decision 071-03).

EVIDENCE:
- Unit Tests: 17/17 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `29a7f78` (Pushed to GitHub `TuanLamVi/fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test Round 2.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
