===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-CUST-01 LOYALTY LITE =====

WORK ITEM:
WI-CUST-01 (Customer Management & Loyalty Lite / GAP-LOYAL-01)

PROMPT / TASK:
- Implement Loyalty Lite (`GAP-LOYAL-01`) following store-scoped loyalty policy, deferred debt point accrual, loyalty ledger tracking, and customer points balance display.

PO DECISION:
APPROVED — Triển khai phần Loyalty Lite của WI-CUST-01 theo quyết định PO.

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (30/30 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `28B44170908523AB18294364691B4E891C1E2530B72643E333866FAE2521C740`, Time: 10/1/2026 5:09:50 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `f8fd46e` to `origin main`)

SUMMARY OF WORK COMPLETED:
1. **Store Loyalty Policy (`StorePolicyRepository`):** Bổ sung `getLoyaltyEnabled`, `getLoyaltyRatio` (mặc định 10.000đ = 1 điểm) và `setLoyaltyPolicy`.
2. **Customer Model (`CustomerModel`):** Bổ sung field `loyaltyPoints` (`int`, default `0`).
3. **Loyalty Models & Repository:** Tạo `LoyaltyEntryModel` và `LoyaltyRepository` quản lý subcollection `/stores/{storeId}/loyaltyLedger/{entryId}`, tự động cập nhật tổng điểm của khách hàng.
4. **Instant Payment Integration (`PaymentRepository`):** Tự động tích điểm khi checkout hóa đơn tiền mặt/QR cho khách hàng có gắn profile (nếu chính sách store bật).
5. **Debt Collection Integration (`DebtRepository`):** Không tích điểm lúc ghi nợ; chỉ tính và cộng điểm khi thu nợ thực tế thành công (kể cả thu nợ một phần).
6. **Customer UI (`CustomerDebtDetailView`):** Hiển thị tổng điểm tích lũy và tab **LỊCH SỬ TÍCH ĐIỂM (LOYALTY HISTORY)** chi tiết.

EVIDENCE:
- Unit Tests: 30/30 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `f8fd46e` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
