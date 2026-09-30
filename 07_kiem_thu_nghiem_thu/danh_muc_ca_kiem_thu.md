# DANH MỤC CA KIỂM THỬ (TEST CASE CATALOG) F&B SMART V5.1

Danh mục các ca kiểm thử chính được tổng hợp từ `07_TEST_PO_ACCEPTANCE_SPECIFICATION.md`:

| Test ID | Feature / Requirement | Mục tiêu kiểm thử | Preconditions | Steps | Expected Result | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TC-AUTH-01** | FEAT-AUTH-01 | Kiểm tra đăng nhập với thông tin hợp lệ | App đã cài đặt, có tài khoản trên Firestore/Auth | 1. Nhập user/pass đúng <br>2. Nhấn Đăng nhập | Đăng nhập thành công, chuyển hướng theo role | `07_TEST_SPEC` |
| **TC-POS-01** | FEAT-POS-01 | Kiểm tra thêm món vào giỏ hàng POS | Đã đăng nhập vai trò Staff | 1. Chọn bàn trống <br>2. Chọn sản phẩm từ menu | Sản phẩm hiển thị trong giỏ hàng tạm tính | `POS_ORDERING_DISCOVERY` |
| **TC-KDS-01** | FEAT-KDS-01 | Kiểm tra hiển thị đơn trên KDS | Đã gửi đơn từ POS | 1. Đăng nhập KDS <br>2. Kiểm tra danh sách đơn | Đơn hàng xuất hiện ở trạng thái Mới | `KDS_KITCHEN_DISCOVERY` |
| **TC-PAY-01** | FEAT-PAY-01 | Kiểm tra thanh toán đơn hàng | Đơn hàng đang phục vụ | 1. Nhấn thanh toán <br>2. Chọn tiền mặt, xác nhận | Đơn chuyển sang Paid, in bill, bàn chuyển Cleaning | `CHECKOUT_PAYMENT` |
