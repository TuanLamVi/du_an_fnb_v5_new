# F&B SMART V5.1 — MASTER PROJECT DOCUMENTATION REPOSITORY

Repository chính thức chứa toàn bộ bộ hồ sơ dự án, kiến trúc, nghiệp vụ, kiểm thử, quản lý work item và trung tâm điều hành 3 bên của dự án F&B SMART V5.1.

## 1. Vai trò các bên (3-Party Operations Model)
- **Tuấn (PO / Chủ đầu tư):** Sở hữu dự án, phê duyệt baseline, quyết định cuối cùng và xác nhận nghiệm thu (`PO_VERIFIED`, `PROTECTED`, `LOCKED`).
- **Codex / Gemini (Thực thi kỹ thuật):** Đọc hồ sơ, thực hiện Work Item, cập nhật nhật ký, thu thập bằng chứng, test và báo cáo.
- **ChatGPT (Trợ lý PO / Điều phối & Giám sát):** Đọc hồ sơ, đối chiếu kế hoạch với thực tế, phát hiện sai lệch, đề xuất phương án và hỗ trợ PO.

## 2. Cấu trúc thư mục hồ sơ (00 → 18)
- `00_tong_quan_va_quan_ly/`: Danh mục tổng thể, Tổng quan dự án, Quy định, Bản đồ nguồn sự thật.
- `01_yeu_cau_san_pham/`: Tầm nhìn, Phạm vi, Danh sách tính năng, Roadmap sản phẩm.
- `02_ux_ui_va_man_hinh/`: Sơ đồ điều hướng, Danh mục màn hình, Đặc tả UX/UI, User flows, Quy chuẩn.
- `03_quy_tac_nghiep_vu_va_trang_thai/`: Quy tắc nghiệp vụ, State machines, Chuyển trạng thái, Quy tắc dữ liệu.
- `04_kien_truc_va_ky_thuat/`: Kiến trúc tổng thể, Kiến trúc ứng dụng, Đặc tả kỹ thuật, Data flows.
- `05_co_so_du_lieu_va_du_lieu/`: Sơ đồ CSDL, Data Catalog, Data Contracts, Query rules, Canonical paths.
- `06_bao_mat_va_phan_quyen/`: Mô hình bảo mật, Role & Permission catalog, Permission matrix, Auth rules.
- `07_kiem_thu_nghiem_thu/`: Chiến lược kiểm thử, Test cases, PO acceptance criteria, Process.
- `08_phat_hanh_va_van_hanh/`: Quy trình build/release, Quản lý môi trường, Checklist, Operations, Incident.
- `09_truy_xuat_tinh_nang/`: Feature & Requirement Traceability Matrix, E2E maps, Gaps, Coverage.
- `10_work_item/`: Work Item Catalog, Implementation plan, Dependency map, DoD, Roadmap.
- `11_quan_ly_tai_lieu/`: Quản lý tài liệu và kiểm soát thay đổi.
- `12_ke_hoach_va_tien_do/`: Bảng theo dõi tiến độ Work Items.
- `13_nhat_ky_thuc_thi/`: Nhật ký dự án (Project Journal).
- `14_rui_ro_loi_thay_doi_quyet_dinh/`: Risk Register, Decision Register (DEC-01), Conflicts.
- `15_bang_chung_va_bao_cao/`: Danh mục bằng chứng và báo cáo giám sát.
- `16_huong_dan_su_dung/`: Tài liệu hướng dẫn sử dụng.
- `17_baseline/`: Master Baseline Index, System blueprint, Traceability chain, Baseline status.
- `18_trung_tam_dieu_hanh_3_ben/`: Trung tâm điều hành 3 bên (Luật vận hành, Bảng điều hành, Nhật ký giám sát, Báo cáo, Bằng chứng, Quy trình GitHub).

## 3. Cách đọc hồ sơ & Quy tắc cập nhật
- Mọi tài liệu phải được đọc theo cơ chế Read-First.
- Không tự ý thay đổi Baseline khi chưa có Change Request được PO phê duyệt.
- Mọi thay đổi code hoặc hồ sơ phải tuân thủ nghiêm ngặt quy trình kiểm soát qua 6 Gates và First Failure Stop.

## 4. Nguồn hồ sơ
- Thư mục làm việc local: `C:\Users\Admin\Desktop\Android\ho so du an fnb`
- Repository GitHub: `https://github.com/TuanLamVi/du_an_fnb_v5_new` (branch `main`)
