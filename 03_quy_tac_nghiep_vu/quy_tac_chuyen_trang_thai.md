# QUY TẮC CHUYỂN TRẠNG THÁI (STATE TRANSITION RULES) F&B SMART V5.1

Chi tiết các chuyển tiếp quan trọng trong chuỗi vận hành `Table → Order → KDS → Payment → Table`:

| Transition ID | Domain | From State | Action / Event | Condition | To State | Side Effects / Kết quả | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TR-ORD-01** | Order | Draft | Gửi đơn (Send to Kitchen) | Giỏ hàng không trống, đã gắn bàn | Submitted | Tạo bản ghi order item gửi xuống KDS | `POS_ORDERING_DISCOVERY` |
| **TR-TAB-01** | Table | Available | Mở đơn gọi món | Chọn bàn trống trên sơ đồ | Occupied | Đổi màu bàn trên UI sang trạng thái có khách | `TABLE_MANAGEMENT_DISCOVERY` |
| **TR-KDS-01** | KDS | New | Bếp bắt đầu nấu | Nhân viên bếp chạm "Bắt đầu" | Cooking | Cập nhật thời gian bắt đầu chế biến | `KDS_KITCHEN_DISCOVERY` |
| **TR-KDS-02** | KDS | Cooking | Bếp hoàn thành món | Nhân viên bếp chạm "Hoàn thành" | Ready | Báo tín hiệu sẵn sàng phục vụ ra POS | `KDS_KITCHEN_DISCOVERY` |
| **TR-PAY-01** | Payment | Pending | Xác nhận thanh toán | Khách trả đủ tiền / Chuyển khoản thành công | Success | Đóng đơn hàng, in bill, chuyển bàn sang Cleaning | `CHECKOUT_PAYMENT_DISCOVERY` |
