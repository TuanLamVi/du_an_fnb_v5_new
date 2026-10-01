===== BÁO CÁO RÀ SOÁT WI-AUTH-01 =====

WORK ITEM:
WI-AUTH-01 — Phân hệ Xác thực & Onboarding

HỒ SƠ ĐÃ RÀ SOÁT:
- docs-123/EMPLOYEE_ONBOARDING_V1.md
- docs-123/ONBOARDING_FLOW_V1.md
- docs-123/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md

PHẠM VI XÁC THỰC:
- Phone Auth (Real Phone OTP, chuẩn hóa E.164).
- One App Dual Entry Flows (Owner vs Employee).
- Owner: Create store + Owner membership (`status = active`).
- Employee: Enter store ID/code -> Join request (`status = pending`).

BẢNG PHẠM VI CODE:
Đã xác định 10 thành phần cụ thể (Repositories, Views, Routing, Services).

THỨ TỰ TRIỂN KHAI:
1. AuthRepository & Phone Auth Service
2. Login & OTP Views
3. Role Selection View
4. Owner Onboarding & Store Repository
5. Staff Join & Member Repository

NGOÀI PHẠM VI (EXCLUDED):
- POS, Payment, KDS, Shift, Reports.
- Quick Setup cấu hình menu sâu (thuộc WI-SETUP-01).

FIREBASE PROJECT:
- `fnb-smart` (Staging, không tạo project mới).

TRẠNG THÁI HIỆN TẠI:
CHƯA CODE — KHÔNG SỬA SOURCE — KHÔNG BUILD

KẾT LUẬN & ĐẦU RA:
- Kế hoạch thực hiện đã cập nhật đầy đủ tại `09_ke_hoach_thuc_thi/ke_hoach_trien_khai_wi_auth_01.md`.

PROMPT-002 — HOÀN THÀNH — CHỜ PO
