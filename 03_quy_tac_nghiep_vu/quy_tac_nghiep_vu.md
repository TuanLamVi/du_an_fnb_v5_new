# QUY TẮC NGHIỆP VỤ (BUSINESS RULES) F&B SMART V5.1

Tổng hợp các quy tắc nghiệp vụ (Business Rules) chính thức được xác nhận từ tài liệu nguồn và các báo cáo Discovery:

| Rule ID | Tên quy tắc | Mô tả chi tiết | Điều kiện & Kết quả | Actor / Phạm vi | Trạng thái | Nguồn tham chiếu |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **RULE-AUTH-01** | Xác thực nhân sự | Nhân viên/Quản lý phải đăng nhập đúng tài khoản được cấp quyền để truy cập hệ thống. | Nhập đúng thông tin → Đăng nhập thành công. Sai → Báo lỗi. | Tất cả Actor | CONFIRMED | `CLEAN_REBUILD_MASTER_SPECIFICATION` |
| **RULE-SETUP-01** | Quick Setup & Clone Menu | Chủ cửa hàng có thể thiết lập nhanh cửa hàng bằng cách chọn mô hình kinh doanh và sao chép mẫu thực đơn tương ứng. | Chọn template → Hệ thống tự động tạo danh mục và sản phẩm mẫu. | Owner | CONFIRMED | `QUICK_SETUP_MENU_TEMPLATE_DISCOVERY` |
| **RULE-POS-01** | Tạo và Gửi đơn hàng | Đơn hàng trên POS phải gắn liền với một bàn cụ thể (hoặc mang về) trước khi gửi xuống nhà bếp (KDS). | Chọn bàn + Thêm món + Nhấn Gửi bếp → Đơn chuyển sang trạng thái chờ chế biến. | Staff | CONFIRMED | `POS_ORDERING_DISCOVERY` |
| **RULE-TABLE-01** | Quản lý trạng thái bàn | Bàn tự động chuyển trạng thái từ Trống sang Đang phục vụ khi có đơn hàng mở, và chuyển sang Dọn dẹp/Trống khi thanh toán hoàn tất. | Thanh toán hoàn tất đơn hàng gắn với bàn → Bàn chuyển sang dọn dẹp. | System / Staff | CONFIRMED | `TABLE_MANAGEMENT_DISCOVERY` |
| **RULE-KDS-01** | Cập nhật trạng thái chế biến | Nhân viên bếp cập nhật trạng thái món ăn từ Mới sang Đang nấu và Hoàn thành trên màn hình KDS. | Chạm chuyển trạng thái món → Cập nhật realtime trên POS. | Kitchen | CONFIRMED | `KDS_KITCHEN_DISCOVERY` |
| **RULE-PAY-01** | Thanh toán đơn hàng | Đơn hàng chỉ được đóng (Closed/Paid) khi toàn bộ số tiền thanh toán khớp với tổng giá trị đơn hàng. | Xác nhận thanh toán đủ tiền → Đơn chuyển trạng thái Paid, in bill, giải phóng bàn. | Staff | CONFIRMED | `CHECKOUT_PAYMENT_DISCOVERY` |
| **RULE-SHIFT-01** | Quản lý ca làm việc | Nhân viên thu ngân phải mở ca và khai báo tiền mặt đầu ca trước khi thực hiện giao dịch bán hàng trên POS. | Mở ca thành công → Cho phép bán hàng. | Staff / Manager | CONFIRMED | `SHIFT_MANAGEMENT_DISCOVERY` |
| **RULE-CUST-01** | Ghi nhận công nợ khách hàng | Cho phép ghi nhận công nợ đối với khách hàng thân thiết/doanh nghiệp theo hạn mức được cấu hình. | Chọn hình thức ghi nợ → Cập nhật số dư công nợ của khách. | Manager / Staff | CONFIRMED | `CUSTOMER_LOYALTY_DISCOVERY` |
