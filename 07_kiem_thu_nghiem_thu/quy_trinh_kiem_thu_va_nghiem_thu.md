# QUY TRÌNH KIỂM THỬ VÀ NGHIỆM THU (TEST & ACCEPTANCE PROCESS) F&B SMART V5.1

Quy trình chuẩn kiểm soát chất lượng dự án:

```text
Requirement
    ↓
Test Cases
    ↓
Implementation / Build
    ↓
Technical Test PASS
    ↓
Evidence Submitted
    ↓
PO Acceptance Test
    ↓
PO_VERIFIED (Chính thức)
    ↓
PROTECTED (Bảo vệ)
    ↓
LOCKED (Khóa vĩnh viễn)
```

## Các nguyên tắc bắt buộc
- **First Failure Stop:** Khi gặp lỗi test hoặc regression, dừng ngay lập tức, ghi nhận vào Regression Log, không tiếp tục triển khai các hạng mục khác.
- **Tách biệt PASS và VERIFIED:** Kỹ thuật PASS không đồng nghĩa với PO_VERIFIED. Chỉ PO mới có quyền xác nhận `PO_VERIFIED`.
