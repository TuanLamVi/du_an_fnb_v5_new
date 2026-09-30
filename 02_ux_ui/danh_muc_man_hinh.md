# DANH MỤC MÀN HÌNH (SCREEN REGISTRY) F&B SMART V5.1

Dưới đây là danh sách màn hình được tổng hợp và chuẩn hóa từ `MASTER_UX_UI_BLUEPRINT_V5.1.md` và các tài liệu Discovery:

| Screen ID | Tên màn hình | Mục đích | Actor chính | Entry Point | Điều hướng đến | Trạng thái | Nguồn tham chiếu |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **SCR-AUTH-01** | Màn hình Đăng nhập | Xác thực tài khoản người dùng | Tất cả Actor | App Launch | POS / Store / KDS | CONFIRMED | `MASTER_UX_UI_BLUEPRINT` |
| **SCR-STORE-01** | Cấu hình Cửa hàng | Quản lý thông tin và chi nhánh | Owner | Sau đăng nhập | Quick Setup / Main | CONFIRMED | `PRODUCT_CHARTER` |
| **SCR-SETUP-01** | Quick Setup & Template | Chọn mô hình và clone menu | Owner | Store Setup | POS Main | CONFIRMED | `QUICK_SETUP_DISCOVERY` |
| **SCR-POS-01** | POS Bán hàng chính | Giao diện chọn bàn, gọi món, tạo đơn | Staff / Manager | Sau đăng nhập | Table / Payment / Menu | CONFIRMED | `POS_ORDERING_DISCOVERY` |
| **SCR-TABLE-01** | Quản lý Sơ đồ Bàn | Xem trạng thái bàn, chuyển/gộp bàn | Staff | POS Screen | POS Order flow | CONFIRMED | `TABLE_MANAGEMENT_DISCOVERY` |
| **SCR-MENU-01** | Chọn món & Tùy chọn | Chọn danh mục, sản phẩm, topping | Staff | POS Screen | POS Order | CONFIRMED | `BUSINESS_MODELS_MENU` |
| **SCR-KDS-01** | Màn hình Bếp (KDS) | Theo dõi và cập nhật trạng thái chế biến | Kitchen | Sau đăng nhập | Chi tiết đơn bếp | CONFIRMED | `KDS_KITCHEN_DISCOVERY` |
| **SCR-PAY-01** | Thanh toán & Checkout | Tính tiền, chọn hình thức thanh toán, in bill | Staff | POS / Order | In hóa đơn / POS | CONFIRMED | `CHECKOUT_PAYMENT_DISCOVERY` |
| **SCR-CUST-01** | Khách hàng & Công nợ | Tra cứu khách hàng, ghi nhận công nợ | Manager / Staff | Main Menu | Chi tiết khách hàng | CONFIRMED | `CUSTOMER_LOYALTY_DISCOVERY` |
| **SCR-SHIFT-01** | Quản lý Ca làm việc | Mở ca, chốt ca, kiểm đếm tiền mặt | Manager / Staff | Main Menu | Báo cáo ca | CONFIRMED | `SHIFT_MANAGEMENT_DISCOVERY` |
| **SCR-REP-01** | Báo cáo Doanh thu | Xem biểu đồ và số liệu doanh thu | Owner / Manager | Main Menu | Chi tiết báo cáo | CONFIRMED | `REPORTS_ANALYTICS_DISCOVERY` |
