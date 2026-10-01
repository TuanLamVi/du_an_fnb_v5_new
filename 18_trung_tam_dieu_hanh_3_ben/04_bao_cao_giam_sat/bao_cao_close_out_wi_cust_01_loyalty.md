===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-CUST-01 LOYALTY LITE & PROMPT-200 =====

WORK ITEM:
WI-CUST-01 (Customer Management & Loyalty Lite / GAP-LOYAL-01)

PROMPTS EXECUTED:
- PROMPT-199: Loyalty Lite Core (Store-scoped policy, deferred debt points, loyalty ledger, points balance display).
- PROMPT-200: Firestore Rules Deployment for `/customers` & `/loyaltyLedger`, Customer Search by Name & Phone, Android Contact Picker integration (`FlutterContacts.openExternalPick`).

PO DECISION:
PENDING PO TEST (Chờ Chủ quán Tuấn trực tiếp kiểm tra thực tế trên M51 & Note 8).

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (30/30 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `C94C47EDA040E1A2008D8CB847CFC136FC3B80BC8CEBAA9DC453F79E98C0B979`, Time: 10/1/2026 5:33:45 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `329b075` to `origin main`)

SUMMARY OF PROMPT-200 WORK COMPLETED:
1. **Firestore Rules Deployed:** Đã phát hành chính thức `firestore.rules` lên cloud server Firebase (`fnb-smart`), cấp quyền đọc/ghi `/customers/{customerId}` và `/loyaltyLedger/{entryId}` cho tài khoản authenticated active member/owner mà vẫn duy trì 100% tenant isolation theo `storeId`.
2. **Customer Search:** Nâng cấp `CustomerRepository.searchCustomers()` và `CustomerSelectDialog` cho phép tìm kiếm linh hoạt theo Tên hoặc Số điện thoại.
3. **Android Contact Picker Integration:** Tích hợp nút "CHỌN TỪ DANH BẠ ĐIỆN THOẠI" (`FlutterContacts.openExternalPick()`). Hệ thống chỉ mở picker để người dùng chủ động chọn **đúng 1 contact**, tự động điền Tên và SĐT vào form thêm khách hàng. Tuyệt đối không đọc toàn bộ danh bạ hay đồng bộ danh bạ lên Firestore.
4. **Loyalty Lite E2E Flow:** Đảm bảo khách hàng được chọn/tạo từ danh bạ được gắn chính xác vào Order/Invoice/Debt, tích điểm tự động theo chính sách riêng của Store.

EVIDENCE:
- Firestore Rules Release: `+ Deploy complete!` (Cloud release successfully).
- Unit Tests: 30/30 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `329b075` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
