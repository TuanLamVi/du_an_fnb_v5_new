# TẦM NHÌN VÀ MỤC TIÊU SẢN PHẨM F&B SMART V5.1

## 1. Product Vision (Tầm nhìn sản phẩm)
F&B SMART định hướng trở thành hệ thống quản lý và vận hành thông minh, tối ưu hóa toàn diện quy trình cho các hộ kinh doanh và doanh nghiệp ngành dịch vụ ăn uống (F&B) từ quy mô nhỏ đến chuỗi cửa hàng, đảm bảo tính chính xác, nhanh chóng và dễ sử dụng.

## 2. Mục tiêu sản phẩm (Product Goals)
- **Tự động hóa vận hành:** Giảm thiểu thao tác thủ công trong việc gọi món, chuyển bếp (KDS), tính toán thanh toán và quản lý bàn.
- **Minh bạch tài chính & kho:** Kiểm soát chặt chẽ doanh thu, ca làm việc, công nợ và lịch sử giao dịch.
- **Nâng cao trải nghiệm khách hàng:** Tích hợp quản lý khách hàng thân thiết, tích điểm và khuyến mại linh hoạt.
- **Chuẩn hóa kiến trúc (Clean Rebuild):** Đảm bảo mã nguồn sạch, dễ bảo trì, dễ mở rộng và tuân thủ tuyệt đối quy trình quản trị (Governance).

## 3. Đối tượng sử dụng (Actors)
- **Owner (Chủ đầu tư / Quản trị viên cấp cao):** Quản lý toàn bộ cấu hình hệ thống, xem báo cáo doanh thu, quản lý cửa hàng và phân quyền.
- **Manager (Quản lý cửa hàng):** Giám sát ca làm việc, xử lý ngoại lệ, quản lý thực đơn, khách hàng và công nợ.
- **Staff (Nhân viên thu ngân / phục vụ):** Thao tác bán hàng trên POS, nhận đơn, quản lý bàn, thu tiền.
- **Kitchen (Nhân viên bếp / pha chế):** Theo dõi đơn hàng thời gian thực qua Màn hình bếp (KDS), cập nhật trạng thái chế biến.

## 4. Bối cảnh sử dụng (Context of Use)
- Môi trường nhà hàng, quán cafe, trà sữa, quán ăn nhanh hoạt động liên tục với tần suất cao.
- Hỗ trợ thiết bị máy POS di động/cố định, tablet, và màn hình hiển thị nhà bếp.

## 5. Giá trị sản phẩm (Value Proposition)
- Thiết lập nhanh chóng (Quick Setup) dựa trên các mô hình kinh doanh F&B có sẵn (Business Models & Menu Templates).
- Giảm tỷ lệ sai sót đơn hàng giữa phục vụ và nhà bếp.
- Báo cáo thời gian thực giúp chủ đầu tư đưa ra quyết định kinh doanh kịp thời.

## 6. Phạm vi sản phẩm (Product Scope)
- Được xác định trong tài liệu `PRODUCT_CHARTER_V5.1.md` và `CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`.
- Bao gồm các phân hệ cốt lõi: Authentication, Store Management, Quick Setup, Menu Management, POS Ordering, Table Management, KDS, Payment, Customer/Debt, Loyalty, Shift Management, Reports.

## 7. Phạm vi chưa xác định / Out of Scope (Hiện tại)
- Tích hợp sâu với các hệ thống ERP ngoại vi phức tạp ngoài phạm vi MVP V5.1.
- Các tính năng nâng cao chưa có nguồn xác nhận rõ ràng được đánh dấu là `TBD`.

## 8. Nguyên tắc sản phẩm (Product Principles)
- **Nguồn sự thật rõ ràng:** Mọi tính năng phải có nguồn từ tài liệu Discovery và Product Master.
- **Kiểm soát chặt chẽ qua Work Item & Governance:** Không tự ý triển khai code ngoài kế hoạch.
