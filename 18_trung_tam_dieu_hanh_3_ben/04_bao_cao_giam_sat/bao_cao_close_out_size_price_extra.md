===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — SIZE PRICE EXTRA FIX =====

WORK ITEM:
Size Price Extra Surgical Fix (PosOrderingView)

PROMPT / TASK:
- Fix default size selection and price calculation breakdown in `PosOrderingView._showProductDetails`.

PO DECISION:
APPROVED — Cho phép triển khai sửa lỗi phụ thu Size trong POS.

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (19/19 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `F3C72E27EC417E80E902E3F16F720107A6CAD6FCE677AF545EB1C11E29A1ED50`, Time: 10/1/2026 3:27:06 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `1a4df3c` to `origin main`)

SUMMARY OF WORK COMPLETED:
1. **Default Size Prioritization:** Cập nhật `_showProductDetails` ưu tiên chọn mặc định size có `priceExtra == 0` (thường là size chuẩn/nhỏ nhất), tránh việc size đầu tiên có phụ thu kích thước bị gán mặc định gây nhầm lẫn với tiền Topping.
2. **Dynamic Price Breakdown:** Bổ sung hiển thị chi tiết thành phần giá (`Giá gốc + Phụ thu size + Tiền topping`) cập nhật real-time ngay trong modal chi tiết món.

EVIDENCE:
- Unit Tests: 19/19 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `1a4df3c` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
