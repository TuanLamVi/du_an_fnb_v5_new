# CHIẾN LƯỢC KIỂM THỬ (TEST STRATEGY) F&B SMART V5.1

## 1. Mục tiêu kiểm thử
Đảm bảo toàn bộ các tính năng, luồng nghiệp vụ, giao diện UX/UI và cấu trúc dữ liệu của F&B SMART V5.1 hoạt động chính xác, ổn định, tuân thủ tuyệt đối các đặc tả đã được phê duyệt trước khi trình PO nghiệm thu chính thức (`PO_VERIFIED`).

## 2. Phạm vi kiểm thử (Test Scope)
- **Functional Testing:** Kiểm tra tính năng hoạt động đúng theo Business Rules và PRD.
- **Integration Testing:** Kiểm tra sự tương tác giữa các tầng (Presentation ⇄ Domain ⇄ Data ⇄ Firebase).
- **State Transition Testing:** Kiểm tra các chuyển đổi trạng thái của Đơn hàng, Bàn, KDS, Ca làm việc.
- **Security & Permission Testing:** Kiểm tra phân quyền RBAC và LEGO permissions.
- **PO Acceptance Testing:** Nghiệm thu trực tiếp các luồng nghiệp vụ do PO (Tuấn) thực hiện.

## 3. Các trạng thái kiểm thử & Nghiệm thu (Strict Separation)
Phân biệt rõ ràng giữa các trạng thái kỹ thuật và trạng thái kinh doanh:
- Technical PASS / Build PASS / Test PASS (Xác nhận kỹ thuật từ hệ thống test / Codex).
- PO Test / PO_VERIFIED (Nghiệm thu chính thức từ PO).
- PROTECTED / LOCKED (Trạng thái bảo vệ và khóa mã nguồn/hồ sơ sau khi pass).
