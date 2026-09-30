# QUY CHUẨN UX/UI (UX/UI STANDARDS & GUIDELINES) F&B SMART V5.1

## 1. Nguyên tắc bố cục & Thiết kế
- **Đơn giản, trực quan:** Ưu tiên các nút bấm lớn (touch-friendly), phù hợp cho thao tác nhanh trên màn hình cảm ứng POS và Tablet tại cửa hàng F&B.
- **Phân cấp thông tin rõ ràng:** Sử dụng màu sắc tương phản để phân biệt trạng thái đơn hàng, trạng thái bàn (Trống - Xanh, Đang phục vụ - Cam/Đỏ, Đặt trước - Vàng).

## 2. Trạng thái UI tiêu chuẩn (UI States)
- **Loading State:** Hiển thị progress indicator hoặc skeleton loader khi tải dữ liệu từ cơ sở dữ liệu / Firestore.
- **Empty State:** Hiển thị thông báo hướng dẫn trực quan khi danh sách trống (ví dụ: "Chưa có món nào trong giỏ hàng", "Không có bàn nào đang phục vụ").
- **Error State:** Hiển thị thông báo lỗi rõ ràng kèm nút "Thử lại" (Retry) khi xảy ra sự cố mạng hoặc lỗi xử lý giao dịch.
- **Permission State:** Ẩn hoặc vô hiệu hóa (disabled) các tính năng mà tài khoản người dùng không có quyền truy cập theo phân quyền LEGO permissions.

## 3. Quy chuẩn đặt tên (Naming Conventions)
- ID màn hình: Bắt đầu bằng tiền tố `SCR-` (Ví dụ: `SCR-POS-01`).
- ID luồng: Bắt đầu bằng tiền tố `FLOW-` (Ví dụ: `FLOW-POS-01`).
- Thành phần giao diện tuân theo chuẩn Material Design 3 (M3) thống nhất trong ứng dụng.
