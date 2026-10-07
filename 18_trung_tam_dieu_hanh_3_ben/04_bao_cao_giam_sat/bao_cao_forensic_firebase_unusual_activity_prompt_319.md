# BÁO CÁO FORENSIC GOVERNANCE: FIREBASE ANTI-ABUSE & UNUSUAL ACTIVITY

- **Work Item liên quan**: `WI-AUTH-01` (Phân hệ Xác thực & Firebase Auth)
- **Prompt liên quan**: PROMPT-319
- **Lĩnh vực**: Phân tích Kỹ thuật Firebase Anti-Abuse / SMS Rate Limiting & Test Phone Configuration
- **Trạng thái**: `RECORDED (FORENSIC EVIDENCE)`

---

## 1. PHÂN TÍCH FORENSIC KỸ THUẬT

- **Hiện tượng**: Firebase báo lỗi *"We have detected unusual activity from your device. Please try again later"* khi thực hiện test gửi OTP nhiều lần liên tiếp.
- **Kết quả kiểm tra Code App**:
  - Nút gửi OTP đã có cờ `_isLoading` vô hiệu hóa thao tác click trùng lặp.
  - Ứng dụng KHÔNG tự động gửi nhiều request ngầm hay bị lặp vòng vô tận.
- **Nguyên nhân kỹ thuật**:
  - Đây là cơ chế bảo vệ chống gian lận/spam (Anti-Abuse Throttle & Device Reputation) tự động của Firebase Authentication khi nhận quá nhiều request OTP từ cùng một IP/thiết bị trong thời gian ngắn.
- **Hướng xử lý chuẩn hóa**:
  - Cấu hình danh sách **Test Phone Numbers** trong Firebase Console (Phone Authentication -> Phone numbers for testing) để thực hiện test nội bộ không tốn SMS quota và không kích hoạt Anti-Abuse Block.
  - Đối với thiết bị bị block tạm thời: chờ cooldown hoặc đổi địa chỉ IP/mạng kết nối để tiếp tục kiểm thử.

## 2. GHI NHẬN GOVERNANCE

- Báo cáo này ghi nhận kết quả điều tra kỹ thuật xác nhận ứng dụng không có lỗi code gửi trùng request.
- Kết quả được lưu giữ trong hồ sơ kỹ thuật `WI-AUTH-01` của dự án F&B SMART V5.1.
