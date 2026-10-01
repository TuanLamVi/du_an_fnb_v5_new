===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-PAY-01 RECEIPT & STAFF TRACKING =====

WORK ITEM:
WI-PAY-01 (Payment & Invoice Generation / Customer Receipt)

PROMPT / TASK:
- Implement itemized invoice lines with toppings, internal staff tracking, and Customer Receipt preview dialog (`InvoiceReceiptDialog`).

PO DECISION:
APPROVED — Hóa đơn đưa cho khách chỉ hiển thị nhân viên thu tiền/thanh toán, hiển thị rõ giá món + size + topping. Dữ liệu nội bộ lưu `createdBy` cho từng Invoice Line.

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (21/21 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `984D8C60CEB648E0EE86DA07DF8D3C1D783D7AAD09C5B5AC32480004A704AA36`, Time: 10/1/2026 4:26:46 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `c304c2b` to `origin main`)

SUMMARY OF WORK COMPLETED:
1. **InvoiceLineModel (`lib/features/pay/models/invoice_model.dart`):** Bổ sung lưu trữ `sizeName`, `sizePriceExtra`, `toppings` (`List<Map<String, dynamic>>`), và `createdBy` (UID nhân viên tạo Order Line tương ứng).
2. **PaymentRepository (`lib/features/pay/data/payment_repository.dart`):** Cập nhật `processCashPayment`, `processQrPayment`, và `processDebtPayment` đọc danh sách dòng món từ Order và ghi thành các `InvoiceLineModel` chi tiết dưới subcollection `/stores/{storeId}/invoices/{invoiceId}/lines/{lineId}`.
3. **Customer Receipt Dialog (`InvoiceReceiptDialog`):** Màn hình phiếu/hóa đơn xem trước cho khách hiển thị rõ tên món, size, topping thụt lề `  ↳ Tên topping × Số lượng — Thành tiền`, tổng tiền và tên Thu ngân (`InvoiceModel.createdBy`), không hiển thị nhân viên gọi món đợt A/B/C trên bill khách.
4. **Internal Staff Tracking:** Dữ liệu nội bộ bảo toàn `createdBy` trên từng `InvoiceLineModel` để Owner/Manager tra cứu nhân viên tạo từng món.

EVIDENCE:
- Unit Tests: 21/21 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `c304c2b` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
