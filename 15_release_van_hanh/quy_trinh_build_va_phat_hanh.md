# QUY TRÌNH BUILD VÀ PHÁT HÀNH (BUILD & RELEASE PROCESS) F&B SMART V5.1

## 1. Các trạng thái kiểm định phát hành (Strict State Separation)
Quy trình phát hành tuân thủ nghiêm ngặt việc tách biệt các trạng thái:
- **Build PASS:** Biên soạn mã nguồn thành công, không lỗi cú pháp hoặc gradle build error.
- **Test PASS:** Vượt qua bộ kiểm thử kỹ thuật (Unit / Integration tests).
- **Release Qualified:** Đạt đủ điều kiện cấu hình và kiểm tra trước phát hành.
- **PO_VERIFIED:** Được PO (Tuấn) trực tiếp nghiệm thu trên thiết bị.
- **Production Ready / Deployed:** Sẵn sàng hoặc đã phát hành lên môi trường sản xuất.

## 2. Các bước trong quy trình
1. **Source Preparation:** Đồng bộ mã nguồn sạch từ nhánh main đã qua protection map.
2. **Build Artifact:** Thực hiện build APK / release artifact (`flutter build apk --release`).
3. **Validation & Testing:** Chạy kiểm tra hồi quy (Regression test).
4. **PO Acceptance:** Trình PO nghiệm thu (`PO_VERIFIED`).
5. **Release Approval & Deploy:** Phê duyệt phát hành phiên bản chính thức.
