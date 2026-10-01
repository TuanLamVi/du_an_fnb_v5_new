# NHẬT KÝ GIÁM SÁT (MONITORING JOURNAL) F&B SMART V5.1

- **2026-06-29:** Thiết lập hệ thống giám sát thi công (Prompt 20) và xây dựng Trung tâm điều hành 3 bên (Prompt 21). Mọi hoạt động tài liệu đều tuân thủ nguyên tắc Read-First và không sửa source code ứng dụng.
- **2026-10-01:**
  - **WI-DEBT-01 (Nợ & Thu nợ):** Sửa lỗi tính toán real-time phiếu Thu Nợ (`DebtRepaymentDialog`), kiểm thử unit tests pass (12/12), build APK (`C5C0D461BE2F808809E9F39A0A5F6C96A0BF1DC90179AF10F8616126BAAB8F98`), nghiệm thu `PO_VERIFIED / PROTECTED / LOCKED` bởi PO Tuấn.
  - **WI-STAFF-01 (Nhân sự & Phân quyền):** Hoàn tất Owner Approval, Staff Management, Short Invitation Code, Real-time session refresh, và UX Clarity (SCR-STAFF-01 & SCR-STAFF-03).
  - **PO Decision (Temporary Freeze):** PO Tuấn chính thức ra quyết định **TẠM KHÓA PHÂN QUYỀN CHI TIẾT NHÂN VIÊN** (Giữ nguyên Staff Management hiện tại, các Chức vụ hiện tại, không mở rộng phân quyền cho các module chưa xây dựng). Đã ghi nhận quyết định vào `14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_WI_STAFF_01_TEMPORARY_FREEZE.md`.
  - **3-Ben Governance Restoration:** Khôi phục và nâng cấp Trung tâm điều hành 3 bên, cập nhật báo cáo giám sát, danh mục bằng chứng và đồng bộ 100% hồ sơ lên GitHub `TuanLamVi/du_an_fnb_v5_new`.
