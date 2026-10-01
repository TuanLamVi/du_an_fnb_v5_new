===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-STAFF-01 =====

WORK ITEM:
WI-STAFF-01 (Staff Management, Owner Approval & Lego Permission Control)

PROMPT / TASK:
- Architecture Freeze, Implementation & Store ID Invitation Flow Fix for WI-STAFF-01

PO DECISION:
PENDING PO TEST (Chờ Chủ quán Tuấn trực tiếp kiểm tra thực tế trên thiết bị).

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (15/15 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `5DEF5CFCA4DF28F09E30EEF35C692E727F08BC131DDDCDCE3FCA8500BEFA9CE4`, Time: 10/1/2026 11:36:25 AM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `19335c2` to `origin main`)

SUMMARY OF WORK COMPLETED & FIXES:
1. **Store ID Display & Copy Button:** Bổ sung Card hiển thị Mã quán (Store ID) và Nút "SAO CHÉP MÃ" nổi bật trên Dashboard (`DashboardPlaceholderView`) và màn hình Quản lý Nhân sự (`StaffManagementView`), cho phép Chủ quán sao chép và gửi mã quán cho Nhân viên gia nhập.
2. **Owner Approval (SCR-STAFF-02):** Cho phép Chủ quán xem danh sách yêu cầu gia nhập `pending`, thực hiện Phê duyệt (`active`) hoặc Từ chối (`delete()`).
3. **Staff Management (SCR-STAFF-01):** Danh sách nhân sự cửa hàng, lọc trạng thái, bật/tắt active/inactive, và xóa thành viên.
4. **Role & Individual Permission Override (SCR-STAFF-03):** Hỗ trợ chức vụ (`role_owner`, `role_manager`, `role_staff`, `role_kitchen`) kết hợp `permissionsOverride` (`Map<String, bool>`) tính toán quyền cuối cùng hiệu lực ngay lập tức (`effective immediately`).
5. **Security & Isolation:** Đảm bảo tenant isolation, store-scoped permission checks và quyền tối cao của Owner.

EVIDENCE:
- Unit Tests: 15/15 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `19335c2` (Pushed to GitHub `TuanLamVi/fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
