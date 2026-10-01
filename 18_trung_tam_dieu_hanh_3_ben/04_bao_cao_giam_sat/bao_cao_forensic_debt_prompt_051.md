===== BÁO CÁO FORENSIC TÌNH TRẠNG DEBT LITE (PROMPT-051) =====

1. ĐÁNH GIÁ TRẠNG THÁI DEBT (PARTIAL / NOT READY)
- A. Debt đã được triển khai chưa?
  + Đã có data models (`DebtAccountModel`, `DebtOriginationModel`, `DebtCollectionModel` trong `debt_model.dart`) vàlogic tính toán trong `TodaysSummaryService`.
  + CHƯA có UI tùy chọn thanh toán "Ghi nợ (Debt Lite)" trong `CheckoutView` và chưa có `DebtRepository` để tạo giao dịch Debt Origination.
- B. Debt có thể tạo được giao dịch thực tế chưa?
  + CHƯA. Màn hình thanh toán hiện tại (`CheckoutView`) chỉ hỗ trợ Tiền mặt (Cash) và payOS QR.
- C. Báo cáo Debt đang lấy dữ liệu từ đâu?
  + `TodaysSummaryService` truy vấn `/stores/{storeId}/settlements` lọc theo `method == 'debt'` và `createdAt >= startOfDay`.
- D. Có thể PO test Debt ngay trên APK hiện tại không?
  + KHÔNG THỂ (PARTIAL / NOT READY). Cần bổ sung phân hệ Debt Lite UI & Repository trước khi PO có thể tạo và kiểm chứng giao dịch nợ.

2. CÁC PHẦN ĐÃ PASS ĐƯỢC BẢO VỆ TUYỆT ĐỐI
- Sales Revenue, Collected, Uncollected, Bàn & Đơn, Ca làm việc, Két tiền mặt, định dạng tiền Việt Nam, WI-AUTH-01, WI-SETUP-01, WI-TABLE-01/POS-01, WI-KDS-01, WI-PAY-01 (Checkout & Cash Payment) hoàn toàn ổn định, không bị ảnh hưởng.

3. KẾT LUẬN & NEXT ACTION
- Không Close-Out WI-REPORT-01 trong prompt này.
- Chờ PO xem báo cáo forensic và quyết định Work Item / Prompt bổ sung Debt Lite thực tế (hoặc hoàn tất ghi nhận báo cáo).
