===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-LOYALTY-02 / PROMPT-210 =====

WORK ITEM:
WI-LOYALTY-02 (Flexible Store Loyalty, Redemption Campaigns & Member Tiers)

PROMPT / TASK:
- PROMPT-210: Loyalty Transaction Engine (Active program point accrual, next-invoice tier discount rule, transactional gift redemption, duplicate processing protection).

PO DECISION:
PENDING PO TEST (Chờ Chủ quán Tuấn trực tiếp kiểm tra thực tế trên M51 & Note 8).

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (49/49 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `AA3DD4AF954835A90F660C5B1DD2CB4144260CBAA047E394804AB1D2726B2BE2`, Time: 10/1/2026 10:10:27 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Pushed to `origin main`)

SUMMARY OF PROMPT-210 WORK COMPLETED:
1. **Active Program Point Calculation (`LoyaltyRepository.processInvoiceLoyalty`):** Tự động xác định chương trình ACTIVE của store, tính toán điểm thưởng theo tỷ lệ `vndPerPoint` riêng của chương trình đó, cộng dồn vào `programPoints[activeProgramId]`, và ghi sổ điểm `loyaltyLedger`.
2. **Duplicate Protection:** Chống cộng điểm hai lần cho cùng một hóa đơn/payment nhờ kiểm tra `invoiceId` trong ledger.
3. **Next-Invoice Tier Discount Rule:** Đánh giá thăng hạng (Programs 2 & 3). Mốc hạng đạt được trên hóa đơn hiện tại chỉ cập nhật hạng cho khách, nhưng ưu đãi giảm giá hạng mới sẽ áp dụng từ hóa đơn tiếp theo.
4. **Transactional Gift Redemption:** Tích hợp giao dịch đổi quà an toàn bằng Firestore Transaction (kiểm tra điểm >= `pointsRequired`, trừ điểm nguyên tử, ghi nhận `redeem_campaign`).
5. **POS & Receipt Integration:** Tự động áp dụng giảm giá hạng thành viên (nếu khách đã đạt hạng trước đó), hiển thị chi tiết điểm tích lũy và thông báo đạt hạng mới trên hóa đơn (`InvoiceReceiptDialog`).

EVIDENCE:
- Unit Tests: 49/49 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: Pushed to GitHub `fnb-smart-v5` main.

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
