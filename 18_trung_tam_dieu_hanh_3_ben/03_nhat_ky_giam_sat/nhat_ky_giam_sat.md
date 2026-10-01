# NHẬT KÝ GIÁM SÁT (MONITORING JOURNAL) F&B SMART V5.1

- **2026-06-29:** Thiết lập hệ thống giám sát thi công (Prompt 20) và xây dựng Trung tâm điều hành 3 bên (Prompt 21). Mọi hoạt động tài liệu đều tuân thủ nguyên tắc Read-First và không sửa source code ứng dụng.
- **2026-10-01:**
  - **WI-DEBT-01 (Nợ & Thu nợ):** Sửa lỗi tính toán real-time phiếu Thu Nợ (`DebtRepaymentDialog`), kiểm thử unit tests pass (12/12), build APK (`C5C0D461BE2F808809E9F39A0A5F6C96A0BF1DC90179AF10F8616126BAAB8F98`), nghiệm thu `PO_VERIFIED / PROTECTED / LOCKED` bởi PO Tuấn.
  - **WI-STAFF-01 (Nhân sự & Phân quyền):** Hoàn tất Architecture Freeze (Chốt Reject = DELETE & Permission Model = ROLE + INDIVIDUAL OVERRIDE), thực thi triển khai Owner Approval, Staff Management, Role & Permission Override UI/Repository/Rules, 15/15 unit tests pass, `flutter analyze` 0 issues, build debug APK SHA256 `8DD1DE7B826EA54E6AEC9ECB9B4C598E8C9C7B386F45198FFEC1E39470205F1F`, commit `447a947` pushed to GitHub `origin main`. Chuyển trạng thái sang `PENDING PO TEST`.
  - **3-Ben Governance Restoration:** Khôi phục và nâng cấp Trung tâm điều hành 3 bên, cập nhật báo cáo giám sát, danh mục bằng chứng và đồng bộ 100% hồ sơ lên GitHub `TuanLamVi/du_an_fnb_v5_new`.
