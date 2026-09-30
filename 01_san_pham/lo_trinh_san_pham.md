# LỘ TRÌNH SẢN PHẨM (PRODUCT ROADMAP) F&B SMART V5.1

## 1. Tổng quan lộ trình
Lộ trình phát triển sản phẩm F&B SMART V5.1 được định hướng theo chiến lược Clean Rebuild, chia thành các giai đoạn (Phases) từ nền tảng đến hoàn thiện nghiệp vụ bán hàng và vận hành.

## 2. Chi tiết các Giai đoạn (Phases)

### Phase 1 — Nền tảng kỹ thuật & Quản trị (Foundation & Governance)
- **Mục tiêu:** Thiết lập khung quản trị Governance, kiến trúc Clean Architecture nền tảng và cơ sở dữ liệu cơ bản.
- **Scope:** Auth, Store Setup, Database Schema, Core Architecture.
- **Trạng thái nguồn:** CONFIRMED (`CURRENT_STATE.md`).

### Phase 2 — Quick Setup & Thực đơn (Menu & Setup)
- **Mục tiêu:** Cho phép cửa hàng nhanh chóng khởi tạo dữ liệu ban đầu bằng Quick Setup và Quản lý thực đơn.
- **Scope:** Business Models, Menu Templates, Category, Product, Topping/Modifier.
- **Trạng thái nguồn:** CONFIRMED.

### Phase 3 — Vận hành POS & Quản lý bàn (POS & Table Management)
- **Mục tiêu:** Xây dựng lõi nghiệp vụ bán hàng POS và sơ đồ bàn khu vực.
- **Scope:** POS Ordering interface, Table mapping, Order creation flow.
- **Trạng thái nguồn:** CONFIRMED.

### Phase 4 — Nhà bếp & Thanh toán (KDS & Checkout)
- **Mục tiêu:** Đồng bộ đơn hàng xuống nhà bếp qua KDS và hoàn tất quy trình thanh toán.
- **Scope:** Kitchen Display System, Payment processing, Cash/Transfer/Card methods.
- **Trạng thái nguồn:** CONFIRMED.

### Phase 5 — Khách hàng, Công nợ & Ca làm việc (Customer, Debt & Shift)
- **Mục tiêu:** Hoàn thiện các nghiệp vụ hỗ trợ vận hành ca và quản lý khách hàng/công nợ.
- **Scope:** Shift management, Customer database, Debt tracking, Loyalty Lite.
- **Trạng thái nguồn:** CONFIRMED / DISCOVERY.

### Phase 6 — Báo cáo & Hoàn thiện hệ thống (Reporting & Master Baseline)
- **Mục tiêu:** Tổng hợp báo cáo kinh doanh, kiểm tra chéo toàn hệ thống và đạt chuẩn Master Baseline để thương mại hóa.
- **Scope:** Reports & Analytics, Documentation Audit, PO Acceptance.
- **Trạng thái nguồn:** CONFIRMED (Đang thực hiện quy trình chuẩn hóa hồ sơ).

## 3. Điểm cần PO quyết định (TBD / PO Decision Needed)
- Mức độ ưu tiên tích hợp sâu các tính năng Loyalty nâng cao (tích điểm đổi voucher tự động qua SMS/App thứ ba) sẽ được đưa vào roadmap bản V5.2 sau khi MVP V5.1 hoàn tất nghiệm thu.
