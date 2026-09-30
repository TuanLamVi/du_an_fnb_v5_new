# QUY TẮC XÁC THỰC VÀ TRUY CẬP (AUTHENTICATION & ACCESS RULES) F&B SMART V5.1

## 1. Quy tắc Xác thực (Authentication Rules)
- Mọi người dùng phải đăng nhập bằng tài khoản được khởi tạo hợp lệ thông qua Firebase Authentication.
- Phiên đăng nhập (Session) được duy trì tự động trên thiết bị cho đến khi người dùng chủ động Đăng xuất (Logout) hoặc token hết hiệu lực.

## 2. Quy tắc Phân quyền (Authorization & Tenant Rules)
- Sau khi xác thực thành công, hệ thống đọc thông tin profile nhân sự (bao gồm `role` và `storeId`) từ Cloud Firestore.
- Mọi thao tác đọc/ghi dữ liệu đều bắt buộc kiểm tra `storeId` trùng khớp với cơ sở hiện tại mà nhân viên đang làm việc.
- Các hành động nhạy cảm (như hủy đơn hàng đã thanh toán, sửa giá sản phẩm, cấu hình cửa hàng) yêu cầu quyền hạn cao (Owner / Manager).
