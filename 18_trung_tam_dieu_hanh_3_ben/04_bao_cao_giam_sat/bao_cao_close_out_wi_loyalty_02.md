===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-LOYALTY-02 / PROMPT-204 =====

WORK ITEM:
WI-LOYALTY-02 (Flexible Store Loyalty, Redemption Campaigns & Member Tiers)

PROMPT / TASK:
- Implement flexible store-scoped loyalty policy engine, redemption campaigns (`loyaltyCampaigns`), automatic member tier evaluation (`loyaltyTiers`), customer tier binding (`tierId`), transactional point redemption safety, owner UI settings, and customer ledger history.

PO DECISION:
APPROVED — Đồng ý nghiên cứu và thiết kế nền tảng Loyalty linh hoạt theo từng cửa hàng.

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (34/34 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `85D3771E46FBB0446EB14DCF69F97DBA19C76636131E24FD25087B1DDC89B894`, Time: 10/1/2026 3:07:06 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `fd232a1` to `origin main`)

SUMMARY OF WORK COMPLETED:
1. **Redemption Campaigns (`LoyaltyCampaignModel` & `LoyaltyRepository`):**
   - Quản lý chiến dịch đổi điểm tại `/stores/{storeId}/loyaltyCampaigns/{campaignId}`.
   - Giao dịch đổi điểm an toàn bằng Firestore Transaction: kiểm tra điểm số khách hàng, kiểm tra tính hiệu lực của chiến dịch (`isEnabled`, `startDate`, `endDate`), trừ điểm nguyên tử, ghi nhận ledger `redeem_campaign`, chống trừ điểm âm hoặc trùng lặp.
2. **Member Tiers & Automatic Evaluation (`LoyaltyTierModel` & `LoyaltyRepository`):**
   - Quản lý hạng thành viên tại `/stores/{storeId}/loyaltyTiers/{tierId}`.
   - Tự động đánh giá và cập nhật `tierId` của khách hàng mỗi khi số điểm tích lũy thay đổi dựa trên ngưỡng tối thiểu của các hạng.
3. **Owner UI (`LoyaltySettingsView`):**
   - Cài đặt → Khách hàng thân thiết: Cho phép Chủ quán bật/tắt loyalty, chỉnh tỷ lệ VNĐ/điểm, tạo/sửa chiến dịch đổi điểm, và tạo/sửa hạng thành viên độc lập theo từng Store.
4. **Customer UI (`CustomerDebtDetailView`):**
   - Hiển thị tổng số điểm, tên Hạng thành viên hiện tại (nếu Store có bật Tiers), lịch sử điểm tích lũy/đổi quà (`loyaltyLedger`), và nút mở dialog đổi quà chiến dịch.
5. **Security & Firestore Rules (`firestore.rules`):**
   - Cấu hình match rules cho `loyaltyCampaigns` và `loyaltyTiers` bảo đảm 100% tenant isolation.

EVIDENCE:
- Unit Tests: 34/34 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `fd232a1` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
