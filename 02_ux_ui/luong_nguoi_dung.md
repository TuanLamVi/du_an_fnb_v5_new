# LUỒNG NGƯỜI DÙNG (USER FLOWS) F&B SMART V5.1

## 1. Luồng Đăng nhập (`FLOW-AUTH-01`)
- **Actor:** Tất cả người dùng
- **Entry:** Khởi chạy app (`SCR-AUTH-01`)
- **Các bước:**
  1. Người dùng nhập Username và Password hợp lệ.
  2. Nhấn nút "Đăng nhập".
  3. Hệ thống xác thực và điều hướng tới màn hình tương ứng với vai trò (POS cho Staff, KDS cho Kitchen, Store Setup cho Owner).
- **Nguồn:** `MASTER_UX_UI_BLUEPRINT`.

## 2. Luồng Bán hàng POS & Gửi Bếp (`FLOW-POS-01`)
- **Actor:** Staff / Cashier
- **Entry:** Màn hình POS (`SCR-POS-01`)
- **Các bước:**
  1. Chọn bàn từ sơ đồ bàn (`SCR-TABLE-01`).
  2. Chọn danh mục và chọn sản phẩm thêm vào giỏ hàng (`SCR-MENU-01`).
  3. Thêm tùy chọn/topping hoặc ghi chú món nếu cần.
  4. Kiểm tra đơn hàng và nhấn "Gửi bếp" (Send to Kitchen).
  5. Đơn hàng đồng thời được truyền xuống màn hình KDS (`SCR-KDS-01`).
- **Nguồn:** `POS_ORDERING_DISCOVERY` & `KDS_KITCHEN_DISCOVERY`.

## 3. Luồng Thanh toán đơn hàng (`FLOW-PAY-01`)
- **Actor:** Staff / Cashier
- **Entry:** Đơn hàng đang phục vụ trên POS (`SCR-POS-01`)
- **Các bước:**
  1. Nhấn nút "Thanh toán" để mở màn hình Checkout (`SCR-PAY-01`).
  2. Hệ thống hiển thị tổng tiền cần thanh toán.
  3. Chọn phương thức thanh toán (Tiền mặt / Chuyển khoản / Thẻ).
  4. Nhập số tiền khách đưa (đối với tiền mặt).
  5. Xác nhận thanh toán thành công → In hóa đơn → Giải phóng bàn về trạng thái trống/dọn dẹp.
- **Nguồn:** `CHECKOUT_PAYMENT_DISCOVERY`.

## 4. Luồng Chế biến tại Nhà bếp KDS (`FLOW-KDS-01`)
- **Actor:** Kitchen Staff
- **Entry:** Màn hình KDS (`SCR-KDS-01`)
- **Các bước:**
  1. Đơn hàng mới hiển thị tự động trên KDS với trạng thái "Mới / Đang chờ".
  2. Nhân viên bếp nhấn "Bắt đầu nấu" → Chuyển trạng thái sang "Đang nấu".
  3. Khi hoàn tất chế biến, nhân viên bếp nhấn "Hoàn thành" → Thông báo sẵn sàng phục vụ hiển thị trên POS.
- **Nguồn:** `KDS_KITCHEN_DISCOVERY`.
