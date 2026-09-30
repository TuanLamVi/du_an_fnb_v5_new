# BẢN ĐỒ NGUỒN SỰ THẬT (SOURCE OF TRUTH MAP)

Bảng dưới đây xác định rõ nguồn chính thức (Source of Truth) cho từng loại thông tin trong dự án F&B SMART V5.1:

| Loại thông tin / Lĩnh vực | Tài liệu nguồn chính thức | Cấp ưu tiên | Tài liệu phụ thuộc | Cách xử lý khi mâu thuẫn |
| :--- | :--- | :--- | :--- | :--- |
| **Quy chế & Quản trị** | `KIM_CHI_NAM.md`, `SOURCE_OF_TRUTH.md` | 1 (Cao nhất) | Tất cả tài liệu dự án | Dừng lại, tuân thủ tuyệt đối Luật Governance. Báo `MAU THUAN — CAN PO XAC NHAN`. |
| **Trạng thái & Quyết định** | `CURRENT_STATE.md`, `PO_DECISION_REGISTER.md` | 1 | Roadmap, Work Item History | Ưu tiên quyết định mới nhất của PO trong Register. |
| **Tổng quan & Mục tiêu** | `PRODUCT_CHARTER_V5.1.md`, `tong_quan_du_an.md` | 2 | PRD, Feature List | Tham chiếu Product Charter. |
| **Yêu cầu & Tính năng** | `CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` | 2 | UX/UI Spec, Test Spec | Căn cứ đặc tả master để đối chiếu. |
| **Nghiệp vụ & Luồng** | Các tài liệu Discovery (`POS`, `KDS`, `Menu`, `Payment`, v.v.) | 3 | Business Rules, State Machines | Tổng hợp từ các discovery được PO phê duyệt. |
| **Cơ sở dữ liệu** | `DATABASE_SCHEMA_V0.1.md`, `FIRESTORE_QUERY_COST_BUDGET_V0.1.md` | 2 | Data Contract, Models | Tuân thủ tuyệt đối cấu trúc schema đã thiết kế. |
| **Kiến trúc & Công nghệ** | `REFERENCE_ARCHITECTURE_LIBRARY_V5.1.md` | 2 | Architecture Spec | Chuẩn kiến trúc Clean Architecture / Flutter. |
| **Kiểm thử & Nghiệm thu** | `07_TEST_PO_ACCEPTANCE_SPECIFICATION.md` | 2 | Test Evidence, PO Acceptance | Tiêu chuẩn nghiệm thu chính thức của PO. |
