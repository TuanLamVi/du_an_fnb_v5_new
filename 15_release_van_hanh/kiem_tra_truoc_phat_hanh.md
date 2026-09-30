# KIỂM TRA TRƯỚC PHÁT HÀNH (RELEASE CHECKLIST) F&B SMART V5.1

Danh mục kiểm tra trước khi phát hành phiên bản (Release Gate):

| Check ID | Hạng mục kiểm tra | Điều kiện PASS | Evidence | Nguồn |
| :--- | :--- | :--- | :--- | :--- |
| **CHK-DOC-01** | Hồ sơ dự án | Hoàn tất bộ hồ sơ chuẩn tại `ho so du an fnb` | Master Baseline | `08_RELEASE_SPEC` |
| **CHK-BUILD-01** | Build Artifact | Flutter build release thành công không lỗi | APK Build Log | `BUILD_BASELINE` |
| **CHK-TEST-01** | Kiểm thử hồi quy | Không phát hiện lỗi regression ở vùng bảo vệ | Test Report | `TEST_EVIDENCE` |
| **CHK-PO-01** | Nghiệm thu PO | PO xác nhận `PO_VERIFIED` | Bảng nghiệm thu | `PO_ACCEPTANCE` |
