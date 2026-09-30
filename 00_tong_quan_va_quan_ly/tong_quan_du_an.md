# TỔNG QUAN DỰ ÁN F&B SMART V5.1

## 1. Giới thiệu chung
F&B SMART là hệ thống quản lý và vận hành toàn diện dành cho các mô hình kinh doanh F&B (Nhà hàng, Quán cafe, Trà sữa, Fast food, v.v.), hỗ trợ từ quản lý cửa hàng, thiết lập nhanh (Quick Setup), thực đơn (Menu), bán hàng (POS), quản lý bàn (Table Management), nhà bếp (KDS), thanh toán (Payment), khách hàng (Customer), công nợ (Debt), tích điểm (Loyalty), ca làm việc (Shift) đến báo cáo phân tích (Reports).

## 2. Phiên bản và Mô hình
- Phiên bản: V5.1 (Clean Rebuild Model).
- Mô hình phát triển: Tách biệt hoàn toàn giữa hồ sơ chuẩn quy định sản phẩm và mã nguồn thực thi trên cơ sở tuân thủ tuyệt đối Governance (`KIM CHỈ NAM`).

## 3. Mục tiêu dự án
- Cung cấp giải pháp phần mềm F&B chuẩn hóa, tối ưu hiệu suất hoạt động cửa hàng.
- Xây dựng bộ hồ sơ kỹ thuật và nghiệp vụ khép kín từ yêu cầu sản phẩm đến mã nguồn, kiểm thử và nghiệm thu bởi PO.

## 4. Phạm vi Clean Rebuild
- Xây dựng lại ứng dụng di động / đa nền tảng theo kiến trúc sạch (Clean Architecture / Feature-based structure) tại thư mục `clean_rebuild_v5/`.
- Áp dụng các tiêu chuẩn bảo vệ vùng mã nguồn (Protection Map), kiểm soát hồi quy (Regression Log) và quy trình Work Item nghiêm ngặt.

## 5. Đối tượng sử dụng
- Owner (Chủ đầu tư): Quản lý tổng quan, doanh thu, báo cáo, thiết lập cửa hàng.
- Manager (Quản lý): Giám sát ca làm việc, thực đơn, khách hàng, xử lý ngoại lệ.
- Staff (Nhân viên thu ngân / phục vụ): Thao tác bán hàng trên POS, quản lý bàn, thanh toán.
- Kitchen (Nhân viên bếp): Tiếp nhận và xử lý đơn hàng thời gian thực qua KDS.
