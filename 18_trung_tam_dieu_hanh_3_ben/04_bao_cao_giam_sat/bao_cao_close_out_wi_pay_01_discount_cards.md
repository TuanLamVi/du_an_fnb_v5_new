===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — PROMPT-211 DISCOUNT CARDS =====

WORK ITEM:
WI-PAY-01 (Discount Cards & Campaign Voucher System / Thẻ ưu đãi)

PROMPT / TASK:
- PROMPT-211: Implement Discount Cards module (`🎟️ THẺ ƯU ĐÃI`), allowing bulk generation of unique 6-character alphanumeric voucher cards (`SN10-X7K29`) with QR codes, campaign budget capping, multi-use tracking, usage history, print/share card view, and mutual exclusivity with Loyalty.

PO DECISION:
APPROVED — Phát hành thẻ ưu đãi do cửa hàng tự phát hành để giảm trực tiếp trên hóa đơn.

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (5/5 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `A5C3A190842DD13BB879AB9FEAA95164155107457BB1D5EF513714238259F18A`, Time: 10/1/2026 11:22:16 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `cb7105c` to `origin main`)

SUMMARY OF PROMPT-211 WORK COMPLETED:
1. **Discount Models & Repository (`DiscountCardRepository`):**
   - Quản lý chiến dịch (`discountCampaigns`) và thẻ ưu đãi (`discountCards`), ghi nhận lịch sử sử dụng (`discountCardUsages`) tại subcollection `/stores/{storeId}/...`.
   - Sinh hàng loạt thẻ duy nhất với mã 6 ký tự (ví dụ: `SN10-X7K29`) kèm QR string data.
   - Giao dịch áp dụng thẻ an toàn bằng Firestore Transaction: kiểm tra hạn sử dụng, ngân sách còn lại, tính toán discount capped chính xác, cập nhật số dư và ghi nhận usage audit log.
2. **Owner UI (`DiscountCardManagementView`):**
   - Quản lý chiến dịch, phát hành thẻ hàng loạt, danh sách thẻ với bộ lọc trực quan (Tất cả, Chưa tặng, Đã tặng, Đang hoạt động, Hết giá trị, Hết hạn), thống kê tổng quan, và dialog hiển thị QR code của thẻ để in/chia sẻ qua Zalo/Facebook.
3. **Checkout Integration (`CheckoutView`):**
   - Cho phép thu ngân nhập mã thẻ hoặc quét QR để áp dụng giảm giá trực tiếp trên tổng hóa đơn.
   - **Loyalty Exclusivity:** Thực thi tính loại trừ lẫn nhau nghiêm ngặt: Áp dụng Thẻ ưu đãi sẽ tự động vô hiệu hóa Loyalty và ngược lại.
4. **Security & Firestore Rules:**
   - Thêm match rules cho `discountCampaigns`, `discountCards`, và `discountCardUsages` bảo đảm 100% tenant isolation theo `storeId`.

EVIDENCE:
- Unit Tests: 5/5 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `cb7105c` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
