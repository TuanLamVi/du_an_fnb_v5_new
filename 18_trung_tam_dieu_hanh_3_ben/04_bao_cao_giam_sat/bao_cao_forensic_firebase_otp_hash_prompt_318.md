# BÁO CÁO FORENSIC GOVERNANCE: FIREBASE OTP & CERTIFICATE HASH ALIGNMENT

- **Work Item liên quan**: `WI-AUTH-01` (Phân hệ Xác thực & Firebase Auth)
- **Prompt liên quan**: PROMPT-318
- **Lĩnh vực**: Cấu hình Firebase Authentication / Android App Signing SHA-256 Certificate Hash
- **Trạng thái**: `RECORDED (FORENSIC EVIDENCE)`

---

## 1. NỘI DUNG VẤN ĐỀ & KẾT QUẢ XỬ LÝ

- **Hiện tượng**: Đăng nhập bằng số điện thoại OTP SMS gặp vấn đề không gửi được SMS hoặc không xác thực được do lệch Certificate Hash giữa app Android local và Firebase Console.
- **Nguyên nhân**: Mã Fingerprint SHA-256 / App Signing Certificate của build môi trường phát triển chưa được khai báo đầy đủ trong Firebase Console Project.
- **Kết quả xử lý**:
  - Kiểm tra và lấy mã SHA-1/SHA-256 từ tệp Gradle Android keystore (`android/app/google-services.json`).
  - Bổ sung SHA-256 Certificate Hash trong Firebase Console cho ứng dụng Android.
  - Cập nhật tệp `google-services.json` trên ứng dụng `fnb-smart-v5`.
  - Kiểm tra thực tế: Tính năng gửi mã OTP SMS và đăng nhập thành công.

## 2. GHI NHẬN GOVERNANCE

- Công việc mang tính chất hiệu chỉnh cấu hình hạ tầng Firebase Auth, không thay đổi luồng logic nghiệp vụ ứng dụng.
- Kết quả xử lý được ghi nhận vào hồ sơ kỹ thuật `WI-AUTH-01` phục vụ truy xuất.
