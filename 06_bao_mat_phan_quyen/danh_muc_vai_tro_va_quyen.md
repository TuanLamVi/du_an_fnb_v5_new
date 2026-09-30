# DANH MỤC VAI TRÒ VÀ QUYỀN (ROLE & PERMISSION CATALOG) F&B SMART V5.1

Tổng hợp các vai trò (Roles) và quyền hạn (Permissions) từ tài liệu `06_SECURITY_PERMISSION_SPECIFICATION.md` và `STAFF_LEGO_PERMISSION_DISCOVERY_V5.1.md`:

## 1. Danh mục Vai trò (Roles)
| Role ID | Tên vai trò | Actor chính | Mô tả | Phạm vi dữ liệu | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **ROLE-OWNER** | Chủ đầu tư / Quản trị viên | Owner | Toàn quyền cấu hình cửa hàng, xem báo cáo, quản lý nhân sự và thiết lập hệ thống. | Toàn bộ chi nhánh / Store | `PRODUCT_CHARTER` |
| **ROLE-MANAGER** | Quản lý cửa hàng | Manager | Quản lý ca làm việc, thực đơn, khách hàng, xử lý ngoại lệ và công nợ. | Cửa hàng được phân công | `EMPLOYEE_ONBOARDING` |
| **ROLE-STAFF** | Nhân viên thu ngân / phục vụ | Staff | Thao tác bán hàng trên POS, quản lý bàn, tạo đơn hàng và thanh toán. | Cửa hàng được phân công | `POS_ORDERING_DISCOVERY` |
| **ROLE-KITCHEN** | Nhân viên bếp | Kitchen | Theo dõi đơn hàng trên màn hình KDS và cập nhật trạng thái chế biến món. | Cửa hàng được phân công | `KDS_KITCHEN_DISCOVERY` |

## 2. Danh mục Quyền (Permissions - LEGO Model)
| Permission ID | Tên quyền | Mô tả | Resource liên quan | Nguồn |
| :--- | :--- | :--- | :--- | :--- |
| **PERM-STORE-CFG** | Cấu hình cửa hàng | Thay đổi thông tin và cài đặt cơ bản của cửa hàng. | Store | `STAFF_LEGO_PERMISSION` |
| **PERM-MENU-MGT** | Quản lý thực đơn | Thêm, sửa, xóa danh mục, sản phẩm, topping. | Menu / Products | `STAFF_LEGO_PERMISSION` |
| **PERM-POS-SALE** | Thao tác bán hàng POS | Tạo đơn, chọn bàn, gửi đơn hàng. | Order / Table | `POS_ORDERING_DISCOVERY` |
| **PERM-PAY-EXEC** | Thực hiện thanh toán | Nhận tiền, xử lý thanh toán và in hóa đơn. | Payment / Order | `CHECKOUT_PAYMENT` |
| **PERM-SHIFT-MGT** | Quản lý ca làm việc | Mở ca, chốt ca, kiểm đếm tiền mặt. | Shift | `SHIFT_MANAGEMENT` |
| **PERM-REP-VIEW** | Xem báo cáo doanh thu | Truy cập dữ liệu doanh thu và thống kê kinh doanh. | Reports | `REPORTS_ANALYTICS` |
