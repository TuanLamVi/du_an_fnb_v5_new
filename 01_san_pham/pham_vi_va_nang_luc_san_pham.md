# PHẠM VI VÀ NĂNG LỰC SẢN PHẨM F&B SMART V5.1

## 1. Product Capability Map (Bản đồ năng lực sản phẩm)
Hệ thống F&B SMART V5.1 bao gồm các nhóm năng lực chính được tổng hợp từ các tài liệu discovery và master specification:

| STT | Nhóm năng lực | Mô tả năng lực cốt lõi | Trạng thái nguồn |
| :--- | :--- | :--- | :--- |
| 1 | **Authentication & Store** | Đăng nhập, quản lý phiên làm việc, thiết lập cửa hàng đa chi nhánh/cơ sở. | CONFIRMED |
| 2 | **Quick Setup & Menu** | Thiết lập nhanh, clone menu template theo mô hình kinh doanh, quản lý danh mục, sản phẩm, topping, option. | CONFIRMED |
| 3 | **POS Ordering** | Màn hình bán hàng trực quan, chọn bàn, thêm món, ghi chú, áp dụng giảm giá/khuyến mại. | CONFIRMED |
| 4 | **Table Management** | Quản lý sơ đồ bàn, trạng thái bàn (Trống, Đang phục vụ, Đang dọn dẹp, Đặt trước). | CONFIRMED |
| 5 | **KDS (Kitchen Display System)** | Hiển thị đơn hàng thời gian thực cho nhà bếp, chuyển trạng thái (Mới, Đang nấu, Hoàn thành). | CONFIRMED |
| 6 | **Payment & Checkout** | Xử lý thanh toán đa hình thức (Tiền mặt, Chuyển khoản, Thẻ, Ví điện tử), in hóa đơn. | CONFIRMED |
| 7 | **Customer & Debt** | Quản lý thông tin khách hàng, ghi nhận và theo dõi công nợ khách hàng. | CONFIRMED |
| 8 | **Loyalty (Tích điểm)** | Chương trình khách hàng thân thiết, tích điểm đổi quà/ưu đãi. | DISCOVERY / LITE |
| 9 | **Shift Management** | Quản lý ca làm việc (Mở ca, Đóng ca, Kiểm tiền đầu/cuối ca). | CONFIRMED |
| 10 | **Reports & Analytics** | Thống kê doanh thu, mặt hàng bán chạy, báo cáo ca và báo cáo tài chính cơ bản. | CONFIRMED |
| 11 | **Staff & Permissions** | Phân quyền nhân sự theo mô hình LEGO permissions. | CONFIRMED |

## 2. Chi tiết các chức năng đã được xác nhận (Confirmed Capabilities)
- Dựa trên `CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` và các báo cáo Discovery.
- Các chức năng POS, Menu, KDS, Table, Payment đã có khung thiết kế và mã nguồn nền tảng trong Clean Rebuild.

## 3. Các chức năng Discovery & TBD
- **Loyalty Lite:** Đã có tài liệu discovery tích điểm cơ bản, một số tính năng mở rộng sâu hơn đang ở trạng thái `TBD`.
- **Debt Management:** Đã xác định luồng ghi nhận công nợ, cần PO xác nhận thêm giới hạn hạn mức tín dụng cửa hàng (`TBD`).

## 4. Out of Scope
- Các tính năng đặt món trực tuyến từ xa qua web public cho khách hàng ngoài cửa hàng (chưa nằm trong phạm vi MVP V5.1 hiện tại).
