===== BÁO CÁO READ-FIRST PHÂN TÍCH PHẠM VI PAYOS & ĐIỀU KIỆN CLOSE-OUT WI-PAY-01 (PROMPT-045) =====

1. BẢN BÁO CÁO TRẢ LỜI 4 CÂU HỎI TRỌNG TÂM

CÂU 1: PayOS hiện tại là gì?
-> SIMULATION (Trên Flutter client app `fnb-smart-v5`, lựa chọn phương thức `payos_qr` hiện đang đóng vai trò mô phỏng giao dịch chuyển khoản trên giao diện client, chưa gọi API payOS live hoặc nhận webhook callback thực tế từ server).

CÂU 2: WI-PAY-01 hiện tại có ĐỦ ĐIỀU KIỆN CLOSE-OUT không?
-> ĐỦ ĐIỀU KIỆN CLOSE-OUT (Đối với phạm vi client-side POS bao gồm: Checkout, Thanh toán tiền mặt, Quản lý ca Open/Close Shift, Bật/Tắt Shift Policy, Thu/Rút tiền két Cash In/Out, Báo cáo Tổng kết ca, và Chuẩn hóa hiển thị tiền Việt Nam, WI-PAY-01 đã hoàn thành 100% yêu cầu kỹ thuật và đã được PO test PASS trực tiếp trên thiết bị M51 và Note 8).

CÂU 3: Phần payOS live thực tế nằm ở đâu?
-> Theo `PAYMENT_PROVIDER_PAYOS_SPEC.md` §2, payOS API keys & webhook secrets là thông tin bảo mật tuyệt đối không được để trên client app (Flutter APK). Toàn bộ việc gọi API payOS (`/v2/payment-requests`) và xác thực HMAC webhook là trách nhiệm thuộc về backend Cloud Functions (`functions/src/payment/payment_canonical.ts`). Khi có Cloud Functions & payOS credentials chính thức (`/stores/{storeId}/paymentAccounts/{accountId}`), client chỉ gọi backend callable để nhận QR URL và lắng nghe trạng thái.

CÂU 4: Work Item tiếp theo chính xác là gì?
-> Theo Roadmap Master Specification V5.1 §18, sau khi hoàn thành chuỗi giao dịch cốt lõi (Auth → Setup → Table/POS → KDS → Payment/Shift), Work Item tiếp theo là:
   **WI-REPORT-01 / WI-ANALYTICS-01: Today's Summary & Reports (Tổng quan hôm nay, Báo cáo Doanh thu & Két tiền)**
   (Hoặc nếu PO yêu cầu triển khai backend payOS live riêng: **WI-PAYOS-01: Real payOS Cloud Function & Webhook Integration**).

2. TÀI LIỆU CĂN CỨ
- `docs-123/PAYMENT_PROVIDER_PAYOS_SPEC.md` §2 & §3
- `docs-123/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` §15 & §26
- `docs-123/DATABASE_SCHEMA_V0.1.md` §4.1
