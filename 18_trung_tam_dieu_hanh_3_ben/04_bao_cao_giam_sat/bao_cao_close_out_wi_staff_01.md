===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-STAFF-01 =====

WORK ITEM:
WI-STAFF-01 (Staff Management, Owner Approval & Lego Permission Control)

PROMPT / TASK:
- Architecture Freeze, Implementation & Short Store Invitation Code Fix (6-8 Chars) for WI-STAFF-01

PO DECISION:
PENDING PO TEST (Chờ Chủ quán Tuấn trực tiếp kiểm tra thực tế trên thiết bị).

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (16/16 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `E4435E41DEB788020FAF1C924F2AB14D171AFB6170F790655994E92D5BB5ACD9`, Time: 10/1/2026 11:54:41 AM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `2fe710d` to `origin main`)

SUMMARY OF WORK COMPLETED & FIXES:
1. **Short Store Invitation Code (6-8 Chars):** Thiết lập sinh tự động và lưu `invitationCode` ngắn 6 ký tự in hoa (ví dụ: `KH7A29`) cho từng Store. Mã ngắn hiển thị nổi bật trên Dashboard (`DashboardPlaceholderView`) và Quản lý nhân sự (`StaffManagementView`) kèm nút "SAO CHÉP MÃ" cho Chủ quán gửi cho nhân viên.
2. **Short Code Store Lookup:** Cập nhật `StoreRepository.getStoreByCodeOrId()` và `StaffJoinView` cho phép Nhân viên nhập mã ngắn 6-8 ký tự (hoặc Store ID cũ) để tự động tra cứu chính xác cửa hàng và gửi yêu cầu gia nhập (`status: 'pending'`).
3. **Owner Approval (SCR-STAFF-02):** Cho phép Chủ quán xem danh sách yêu cầu gia nhập `pending`, thực hiện Phê duyệt (`active`) hoặc Từ chối (`delete()`).
4. **Staff Management (SCR-STAFF-01):** Danh sách nhân sự cửa hàng, lọc trạng thái, bật/tắt active/inactive, và xóa thành viên.
5. **Role & Individual Permission Override (SCR-STAFF-03):** Hỗ trợ chức vụ (`role_owner`, `role_manager`, `role_staff`, `role_kitchen`) kết hợp `permissionsOverride` (`Map<String, bool>`) tính toán quyền cuối cùng hiệu lực ngay lập tức (`effective immediately`).
6. **Security & Isolation:** Đảm bảo tenant isolation, store-scoped permission checks và quyền tối cao của Owner.

EVIDENCE:
- Unit Tests: 16/16 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `2fe710d` (Pushed to GitHub `TuanLamVi/fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
