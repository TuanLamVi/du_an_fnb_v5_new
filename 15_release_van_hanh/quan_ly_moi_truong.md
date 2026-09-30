# QUẢN LÝ MÔI TRƯỜNG (ENVIRONMENT MANAGEMENT) F&B SMART V5.1

## 1. Các môi trường hoạt động
- **Development (Phát triển):** Môi trường local trên máy developer, kết nối với Firebase Emulator hoặc Firebase Test project.
- **Staging (Thử nghiệm):** Môi trường kiểm thử nội bộ, chạy thử nghiệm các tính năng mới trước khi release chính thức.
- **Production (Sản xuất):** Môi trường chính thức phục vụ các cửa hàng F&B thực tế, kết nối Firebase Production project với các quy tắc bảo mật nghiêm ngặt.

## 2. Configuration & Secrets
- Các file cấu hình Firebase (`google-services.json`) được quản lý bảo mật theo từng môi trường tương ứng.
