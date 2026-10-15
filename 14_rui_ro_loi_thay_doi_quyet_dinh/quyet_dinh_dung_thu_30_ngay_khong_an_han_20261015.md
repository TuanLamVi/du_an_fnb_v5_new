# QUYẾT ĐỊNH PO — KHÁM PHÁ TỰ DO VÀ DÙNG THỬ ĐÚNG 30 NGÀY, KHÔNG ÂN HẠN

- **Decision ID:** `DEC-2026-TRIAL-LIFECYCLE-30D-NO-GRACE-01`
- **Ngày quyết định:** 2026-10-15 (giờ Việt Nam, UTC+07:00)
- **Người quyết định:** Tuấn — Chủ đầu tư / Product Owner (PO)
- **Trạng thái:** `PO APPROVED — CURRENT BUSINESS RULE`
- **Work Item:** `WI-PREPAID-EMPLOYEE-BILLING-01`
- **Change Request:** `CR-PREPAID-BILLING-02`
- **Phạm vi:** Chính sách vòng đời dùng thử / prepaid billing; không thay thế Baseline V5.1 đã khóa.

## 1. Quyết định cốt lõi

Khách hàng được khám phá F&B SMART mà không bị đồng hồ dùng thử gây áp lực. Thời hạn dùng thử chỉ bắt đầu khi cửa hàng đạt ngưỡng hóa đơn hợp lệ đã thanh toán thứ 100. Kể từ thời điểm kích hoạt, thời hạn dùng thử là đúng 30 ngày; **không có bất kỳ thời gian ân hạn 3 ngày nào sau khi dùng thử kết thúc**.

## 2. Giai đoạn khám phá không giới hạn thời gian

1. Từ lúc đăng ký/cài ứng dụng cho đến trước ngưỡng kích hoạt, trạng thái là `EXPLORATION / TRIAL NOT STARTED`; không có đồng hồ đếm ngược dùng thử.
2. Khách hàng được khám phá đầy đủ năng lực sản phẩm theo vai trò, quyền LEGO, quan hệ membership, phê duyệt của chủ quán và các quy tắc bảo mật hiện hành.
3. Chính sách dùng thử không áp đặt giới hạn số lời mời nhân viên. Ví dụ, mời đến 10.000 nhân viên không làm đồng hồ dùng thử bắt đầu, không tiêu tốn ngày dùng thử và không tự kích hoạt tính phí chỉ vì số lời mời.
4. Việc tải/cài app, đăng nhập, tạo cửa hàng, mở/đóng app, đổi điện thoại, mời nhân viên hoặc để app không hoạt động trong một khoảng thời gian không bắt đầu hay tiêu hao thời gian dùng thử.
5. Khách hàng được dừng sử dụng rồi quay lại sau vài ngày, vài tuần hoặc vài tháng mà vẫn ở giai đoạn khám phá nếu chưa đạt ngưỡng.
6. Không được dùng giới hạn số nhân viên hoặc thời hạn theo ngày để thay thế điều kiện kích hoạt 100 hóa đơn. Bất kỳ giới hạn kỹ thuật/bảo mật độc lập nào phải có cơ sở riêng, được ghi hồ sơ và phê duyệt theo quy trình; không được tự suy diễn từ chính sách dùng thử.

## 3. Điều kiện kích hoạt dùng thử

1. Dùng thử được kích hoạt tại thời điểm máy chủ ghi nhận hóa đơn hợp lệ đã thanh toán thứ 100 của cửa hàng.
2. Nguồn đếm là bộ đếm do máy chủ xác định, chống đếm trùng và truy xuất được bằng chứng. Đơn nháp, đơn chưa thanh toán, hóa đơn chưa thu đủ, thanh toán thất bại, hóa đơn bị hủy/void và dữ liệu thử nghiệm QA không được tính là hóa đơn đủ điều kiện.
3. Tiếp tục áp dụng quyết định đã có về loại trừ các hóa đơn/đơn kiểm thử khỏi ngưỡng thương mại, theo cách loại trừ do máy chủ kiểm soát và có thể kiểm chứng.
4. Cài lại app, xóa cache, đăng xuất/đăng nhập, đổi thiết bị hoặc khôi phục phiên không được đặt lại bộ đếm và không được kích hoạt lại dùng thử đã từng được kích hoạt.

## 4. Thời gian dùng thử đúng 30 ngày — không ân hạn

1. `trialActivatedAt` phải được ghi bằng thời gian do máy chủ xác định khi đạt ngưỡng.
2. Hạn kết thúc được tính một lần bằng thời điểm kích hoạt cộng 30 ngày; đồng hồ thiết bị khách hàng không có quyền kéo dài hoặc đặt lại thời hạn.
3. Tại thời điểm hết hạn 30 ngày, trial chuyển sang trạng thái kết thúc ngay. **Không cộng thêm 3 ngày, không tạo grace window và không để UI/API xem thời gian gia hạn cũ như quyền sử dụng miễn phí.**
4. Từ thời điểm trial kết thúc, áp dụng chính sách prepaid connection billing, ví và khóa kết nối nhân viên đã được phê duyệt. Nếu không đủ số dư, hành vi khóa/mở phải tuân theo quy tắc billing hiện hành; không được trì hoãn chỉ vì giả định có 3 ngày ân hạn.
5. Nạp ví, thay đổi danh sách nhân viên/thiết bị, đăng nhập lại hoặc thay đổi phiên không gia hạn trial.

## 5. Quy tắc Dashboard

- **Trước ngưỡng 100 hóa đơn:** Không hiển thị bộ đếm/ngưỡng “100 hóa đơn”, số ngày dùng thử hoặc đồng hồ trial; không tạo cảm giác đồng hồ đã bắt đầu. Khách hàng vẫn khám phá được sản phẩm theo quyền của mình.
- **Khi đạt ngưỡng:** Bắt đầu hiển thị trial chính thức 30 ngày và thời gian còn lại dựa trên timestamp máy chủ.
- **Khi hết 30 ngày:** Hiển thị rõ trạng thái dùng thử đã kết thúc; không hiện thêm 3 ngày ân hạn. Hiển thị ước tính thời gian đến khi kết nối nhân viên có thể bị khóa, tính từ số dư ví và số kết nối đủ điều kiện theo chính sách billing; có lối vào Ví để chủ quán xử lý.
- Nếu theo phép tính hiện tại kết nối có thể bị khóa ngay, không được hiển thị số ngày dương giả tạo.
- Mọi con số trên Dashboard phải phản ánh dữ liệu authoritative; không được dùng đồng hồ QA tăng tốc hoặc dữ liệu client để thay thế.

## 6. Quy tắc riêng biệt không bị thay đổi

Quy tắc cảnh báo số dư thấp trước khi ví được dự kiến không đủ để trả phí kết nối trong 3 ngày là **cảnh báo ví**, không phải thời gian ân hạn dùng thử. Cảnh báo này vẫn giữ nguyên theo quyết định riêng. Nó không gia hạn trial sau khi đủ 30 ngày.

## 7. Quan hệ với hồ sơ cũ và giới hạn quyết định

- Quyết định này làm rõ và thay thế mọi cách diễn giải rằng 3 ngày là thời gian ân hạn sau trial.
- Cụm từ lịch sử “trial ends after 100 commercial orders” phải được hiểu/điều chỉnh theo nghĩa chính xác: trial **bắt đầu** khi đạt hóa đơn hợp lệ đã thanh toán thứ 100; hết trial sau 30 ngày.
- Hồ sơ lịch sử không bị xóa; bản ghi mới này là quyết định PO hiện hành cho vòng đời dùng thử.
- Đây là quyết định nghiệp vụ và cập nhật hồ sơ. Nó không khẳng định mã nguồn đã tuân thủ; không tự tạo ra quyền deploy mới, không cho phép sửa dữ liệu thật hoặc Production.

**Kết luận nghiệp vụ:** `100th qualifying paid invoice → activate 30-day trial → expire with NO GRACE PERIOD`  
**Kết luận triển khai:** `NOT VERIFIED BY THIS GOVERNANCE CHANGE`  
**Production:** `STRICTLY FORBIDDEN`
