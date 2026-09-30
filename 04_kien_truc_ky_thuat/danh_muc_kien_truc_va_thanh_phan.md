# DANH MỤC KIẾN TRÚC VÀ THÀNH PHẦN (ARCHITECTURE & COMPONENT CATALOG) F&B SMART V5.1

| Component ID | Tên thành phần | Loại | Trách nhiệm chính | Phụ thuộc | Domain | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **COMP-CORE-01** | Core Network & Firebase Client | Core Module | Cấu hình kết nối Firestore, Auth, Error handling chung. | Firebase SDK | Core | Reference Architecture |
| **COMP-FEAT-AUTH** | Auth Feature Module | Feature Module | Xử lý đăng nhập, quản lý phiên làm việc, phân quyền. | Core | Auth | Clean Rebuild Source |
| **COMP-FEAT-SETUP** | Quick Setup Feature Module | Feature Module | Khởi tạo cửa hàng và clone menu template. | Core, Menu | Setup | Quick Setup Discovery |
| **COMP-FEAT-MENU** | Menu Feature Module | Feature Module | Quản lý danh mục, sản phẩm, topping. | Core | Menu | Menu Discovery |
| **COMP-FEAT-POS** | POS Feature Module | Feature Module | Giao diện bán hàng, tạo giỏ hàng và gửi đơn. | Core, Menu, Table | POS | POS Discovery |
| **COMP-FEAT-TABLE** | Table Feature Module | Feature Module | Quản lý sơ đồ và trạng thái bàn khu vực. | Core | Table | Table Discovery |
| **COMP-FEAT-KDS** | KDS Feature Module | Feature Module | Hiển thị và cập nhật trạng thái chế biến thời gian thực. | Core | KDS | KDS Discovery |
| **COMP-FEAT-PAY** | Payment Feature Module | Feature Module | Xử lý thanh toán và in hóa đơn. | Core, POS | Payment | Checkout Discovery |
| **COMP-FEAT-SHIFT** | Shift Feature Module | Feature Module | Quản lý mở/đóng ca và kiểm kê tiền mặt. | Core | Shift | Shift Discovery |
| **COMP-FEAT-REP** | Reports Feature Module | Feature Module | Tổng hợp và hiển thị báo cáo doanh thu. | Core | Reports | Reports Discovery |
