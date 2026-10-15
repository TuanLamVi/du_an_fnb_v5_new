# CHANGE REQUEST — VÒNG ĐỜI DÙNG THỬ 30 NGÀY, KHÔNG ÂN HẠN

- **CR ID:** `CR-PREPAID-BILLING-02`
- **Ngày:** 2026-10-15 (giờ Việt Nam, UTC+07:00)
- **Work Item:** `WI-PREPAID-EMPLOYEE-BILLING-01`
- **Change type:** Thay đổi/làm rõ chính sách nghiệp vụ và hồ sơ; cập nhật yêu cầu Dashboard
- **PO status:** `APPROVED BY PO — 2026-10-15`
- **Related decision:** [`DEC-2026-TRIAL-LIFECYCLE-30D-NO-GRACE-01`](../14_rui_ro_loi_thay_doi_quyet_dinh/quyet_dinh_dung_thu_30_ngay_khong_an_han_20261015.md)
- **Parent scope:** `CR-PREPAID-BILLING-01`; đây là Change Request riêng cho trial lifecycle, không phải mở rộng phạm vi phí bổ sung trong cùng ngày của `CR-PREPAID-BILLING-01-ADD-01`.
- **Production:** `NOT AUTHORIZED`

## 1. Lý do

Không được tính thời gian dùng thử ngay khi khách hàng cài ứng dụng hoặc bắt đầu khám phá. Khách hàng cần thời gian tìm hiểu các tính năng, dừng lại rồi quay lại mà không bị mất trial. Thời gian dùng thử thương mại chỉ bắt đầu sau khi có hành vi vận hành đạt ngưỡng 100 hóa đơn hợp lệ đã thanh toán. Thời gian ân hạn 3 ngày sau trial bị loại bỏ.

## 2. Yêu cầu được PO phê duyệt

1. Từ 0 đến trước hóa đơn hợp lệ đã thanh toán thứ 100: khám phá sản phẩm không giới hạn ngày; chưa bắt đầu trial.
2. Khách hàng có thể khám phá đầy đủ tính năng theo vai trò/quyền và quy tắc bảo mật hiện có.
3. Chính sách trial không đặt giới hạn số nhân viên được mời; việc mời tối đa 10.000 nhân viên không khởi động timer.
4. Đạt hóa đơn hợp lệ đã thanh toán thứ 100 thì kích hoạt trial duy nhất một lần.
5. Trial tồn tại đúng 30 ngày theo timestamp máy chủ. Hết 30 ngày là hết trial, không có grace period.
6. Nạp ví, khởi động lại/cài lại app, đổi thiết bị hoặc thay đổi danh sách nhân viên không đặt lại trial.
7. Dashboard trước ngưỡng không hiển thị số đếm 100 hóa đơn hoặc timer trial; khi kích hoạt hiển thị trial 30 ngày; khi hết hạn cho biết trial kết thúc, thời gian dự kiến đến lúc có thể khóa kết nối theo số dư ví/billing, và lối vào Ví.
8. Giữ nguyên cảnh báo ví 3 ngày trước khi số dư dự kiến không đủ; đây là cảnh báo độc lập, không phải ân hạn trial.
9. Không tính đơn nháp, hóa đơn chưa thanh toán/thu chưa đủ, thất bại, hủy/void và dữ liệu QA cô lập vào ngưỡng thương mại; tiếp tục loại trừ dữ liệu kiểm thử theo quy tắc máy chủ hiện hành.

## 3. Tài liệu và hành vi bị ảnh hưởng

- Quyết định PO và danh mục quyết định.
- Danh mục Change Request.
- Kế hoạch triển khai `WI-PREPAID-EMPLOYEE-BILLING-01`.
- Hợp đồng trial state/field mapping liên quan (`trialEverActivated`, `trialActivatedAt`, `trialExpiresAt`, trạng thái kết thúc); cần đối chiếu đúng schema/source hiện hành trước khi sửa code.
- Logic Dashboard và các acceptance tests về trial activation, expiry, timer persistence, low-wallet calculation và số ngày dự kiến khóa kết nối.
- Hồ sơ cũ có câu “trial ends after 100 commercial orders”; nội dung này phải được ghi chú là đã được làm rõ, không xóa lịch sử.

**Không sửa Baseline V5.1 đã khóa trong CR này.** Quyết định này được ghi ở hồ sơ thay đổi thuộc WI prepaid billing; mọi tác động đến application source vẫn phải qua source-grounded review, kiểm thử và đúng quyền thực thi có sẵn.

## 4. Acceptance criteria

- **TC-TRIAL-01:** Cài app/tạo store và không phát sinh hóa đơn đủ điều kiện; Dashboard không show trial timer hoặc “100 hóa đơn”.
- **TC-TRIAL-02:** Khách hàng tạm ngừng vài ngày/tuần/tháng trước ngưỡng rồi quay lại; trial vẫn chưa bắt đầu.
- **TC-TRIAL-03:** Mời nhiều nhân viên (bao gồm kịch bản 10.000 lời mời mô phỏng/isolated QA); số lời mời không khởi động trial và không tiêu hao ngày dùng thử.
- **TC-TRIAL-04:** Hóa đơn hợp lệ đã thanh toán thứ 99 chưa kích hoạt trial; hóa đơn đủ điều kiện thứ 100 kích hoạt đúng một lần.
- **TC-TRIAL-05:** Hóa đơn unpaid, partially paid, failed, cancelled/void và QA/test không làm tăng counter thương mại.
- **TC-TRIAL-06:** Trial expiration = server `trialActivatedAt + 30 days`; clock client/restart/reinstall/login/device change không gia hạn.
- **TC-TRIAL-07:** Tại expiry, trial ended ngay; không có bất cứ 3-day grace path nào ở UI, backend, scheduled jobs hay authorization checks.
- **TC-TRIAL-08:** Sau expiry, chính sách wallet/connection lock được áp dụng theo số dư và số kết nối đủ điều kiện; Dashboard không hiển thị countdown dương giả tạo.
- **TC-TRIAL-09:** Low-wallet 3-day warning vẫn tách biệt; cảnh báo không kéo dài trial.
- **TC-TRIAL-10:** Owner/active staff vẫn bị đánh giá theo đúng role/permission/membership/device policy; không tạo bypass khi cho phép khám phá tự do.
- **TC-TRIAL-11:** Không reset/re-activate trial khi nạp ví, đổi điện thoại hoặc mở lại app.
- **TC-TRIAL-12:** Tất cả test cần được chạy trong môi trường emulator/isolated Staging có bằng chứng; không thao tác Production hoặc sửa dữ liệu QA hiện hữu nếu chưa được phép cụ thể.

Các test trên hiện được đăng ký là tiêu chí; trạng thái là `NOT RUN` cho đến khi có bằng chứng thực thi thực tế.

## 5. An toàn thực thi và trạng thái

- CR này ghi nhận PO approval cho chính sách và hồ sơ.
- Không được coi commit tài liệu này là bằng chứng code đã triển khai.
- Việc sửa application source chỉ được tiến hành theo WI prepaid billing, sau READ-FIRST/impact analysis và các gate kỹ thuật bắt buộc. Không tự phát sinh quyền deploy, không merge hoặc triển khai Production.
- Không chỉnh/xóa dữ liệu cửa hàng QA để giả lập đạt ngưỡng. Kịch bản 10.000 lời mời phải dùng mock/simulator hoặc test fixture cô lập nếu được thực hiện.
