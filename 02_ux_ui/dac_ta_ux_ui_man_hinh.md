# ĐẶC TẢ UX/UI MÀN HÌNH (SCREEN UX/UI SPECIFICATION) F&B SMART V5.1

## 1. Màn hình Đăng nhập (`SCR-AUTH-01`)
- **Mục tiêu người dùng:** Nhập thông tin tài khoản và mật khẩu để xác thực quyền truy cập vào hệ thống.
- **Thành phần chính:** Ô nhập Tên đăng nhập (Username), Ô nhập Mật khẩu (Password), Nút "Đăng nhập" (Login Button), Logo ứng dụng.
- **Hành động người dùng:** Nhập liệu và chạm nút Đăng nhập.
- **Navigation:** Chuyển hướng đến POS (`SCR-POS-01`), KDS (`SCR-KDS-01`) hoặc Store Setup (`SCR-STORE-01`) tùy theo phân quyền.
- **Nguồn:** `MASTER_UX_UI_BLUEPRINT_V5.1.md`.

## 2. Màn hình POS Bán hàng (`SCR-POS-01`)
- **Mục tiêu người dùng:** Thực hiện thao tác chọn bàn, gọi món nhanh chóng cho khách hàng.
- **Thành phần chính:** Khu vực danh mục sản phẩm (Category Grid), Danh sách sản phẩm theo danh mục (Product Grid), Giỏ hàng/Đơn hàng tạm tính (Order Summary Panel), Nút gửi bếp (Send to Kitchen), Nút thanh toán (Checkout).
- **Hành động người dùng:** Chạm chọn bàn, chọn món ăn, điều chỉnh số lượng, thêm ghi chú, gửi đơn.
- **Navigation:** Mở màn hình chọn bàn (`SCR-TABLE-01`), màn hình thanh toán (`SCR-PAY-01`).
- **Nguồn:** `POS_ORDERING_DISCOVERY_V5.1.md`.

## 3. Màn hình Quản lý Bàn (`SCR-TABLE-01`)
- **Mục tiêu người dùng:** Theo dõi trực quan trạng thái các bàn (Trống, Đang phục vụ, Đã đặt) và thực hiện chuyển/gộp bàn.
- **Thành phần chính:** Lưới hiển thị sơ đồ bàn theo khu vực (Floor Plan), Chú thích trạng thái bàn (Legend), Nút mở bàn / đặt bàn.
- **Hành động người dùng:** Chạm vào bàn để mở đơn hoặc chuyển bàn.
- **Navigation:** Quay lại màn hình POS (`SCR-POS-01`) với bàn đã chọn.
- **Nguồn:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`.

## 4. Màn hình Nhà bếp KDS (`SCR-KDS-01`)
- **Mục tiêu người dùng:** Tiếp nhận đơn hàng từ các bàn/mang về theo thời gian thực và cập nhật tiến độ chế biến.
- **Thành phần chính:** Thẻ đơn hàng (Order Cards) phân theo trạng thái (Mới, Đang nấu, Hoàn thành), Bộ lọc theo khu vực/thời gian, Nút chuyển trạng thái món/đơn.
- **Hành động người dùng:** Chạm nút cập nhật trạng thái món ăn từ "Mới" sang "Đang nấu" và "Hoàn thành".
- **Nguồn:** `KDS_KITCHEN_DISCOVERY_V5.1.md`.

## 5. Màn hình Thanh toán Checkout (`SCR-PAY-01`)
- **Mục tiêu người dùng:** Hoàn tất giao dịch thu tiền, tính tiền thừa và in hóa đơn.
- **Thành phần chính:** Tổng tiền cần thanh toán, Các phương thức thanh toán (Tiền mặt, Chuyển khoản, Thẻ), Ô nhập số tiền khách đưa, Hiển thị tiền thối lại, Nút xác nhận thanh toán & In bill.
- **Hành động người dùng:** Chọn phương thức thanh toán, nhập tiền khách đưa, xác nhận thanh toán.
- **Nguồn:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`.
