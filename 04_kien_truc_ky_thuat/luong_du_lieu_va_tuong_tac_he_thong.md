# LUỒNG DỮ LIỆU VÀ TƯƠNG TÁC HỆ THÔNG (DATA FLOWS & SYSTEM INTERACTIONS) F&B SMART V5.1

## 1. Luồng Xác thực (Authentication Flow)
- **Source:** Màn hình đăng nhập (`SCR-AUTH-01`).
- **Input:** Username, Password.
- **Processing:** `AuthRepository` gọi Firebase Auth xác thực thông tin.
- **Data Affected:** Lưu session token và user role tại local state.
- **Output:** Điều hướng màn hình tương ứng với role (POS / KDS / Setup).

## 2. Luồng Bán hàng POS & Gửi Bếp (POS & KDS Data Flow)
- **Source:** Màn hình POS (`SCR-POS-01`).
- **Input:** Chọn bàn, chọn món, số lượng, topping.
- **Processing:** UseCase tạo `OrderEntity`, Repository đẩy bản ghi order lên Cloud Firestore gắn với `storeId`.
- **Data Affected:** Collection `orders` và `order_items` trên Firestore cập nhật trạng thái `Submitted`.
- **Output:** KDS Client lắng nghe stream Firestore realtime, tự động hiển thị đơn hàng mới trên màn hình bếp.

## 3. Luồng Thanh toán (Payment & Checkout Data Flow)
- **Source:** Màn hình thanh toán (`SCR-PAY-01`).
- **Input:** Phương thức thanh toán, số tiền khách đưa.
- **Processing:** Cập nhật trạng thái `Order` thành `Paid`, giải phóng trạng thái bàn thành `Cleaning`, ghi nhận doanh thu vào `Shift` hiện tại.
- **Data Affected:** Cập nhật `orders`, `tables`, và `shifts` collections trên Firestore.
- **Output:** In hóa đơn, hoàn tất giao dịch.
