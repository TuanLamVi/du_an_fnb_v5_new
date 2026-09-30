# QUY TẮC DỮ LIỆU VÀ NGHIỆP VỤ (DATA & BUSINESS RULES) F&B SMART V5.1

Các quy tắc kinh doanh có tác động trực tiếp đến cấu trúc dữ liệu và tính nhất quán của hệ thống:

1. **Tenant / Store Scope (Phạm vi cửa hàng):**
   - Mọi dữ liệu giao dịch (Order, Table, Shift, Customer, Report) bắt buộc phải gắn với `storeId` cụ thể để đảm bảo phân tách dữ liệu giữa các cơ sở/chi nhánh.

2. **Order Ownership & Quantity (Quyền sở hữu và Số lượng đơn hàng):**
   - Số lượng sản phẩm (`quantity`) trong đơn hàng phải là số nguyên dương (`> 0`).
   - Giá tiền (`price`, `totalAmount`) không được âm (`>= 0`).

3. **Data Consistency (Tính nhất quán dữ liệu thanh toán):**
   - Khi đơn hàng chuyển sang trạng thái `Paid`, tổng doanh thu phải được ghi nhận vào báo cáo ca làm việc (`Shift`) hiện tại của thu ngân.

4. **Audit Information & Timestamp:**
   - Mọi bản ghi đơn hàng, thanh toán và thay đổi trạng thái đều phải lưu lại thời gian (`createdAt`, `updatedAt`) và định danh người thực hiện (`actorId` / `staffId`).
