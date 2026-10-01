# KẾ HOẠCH TRIỂN KHAI CHI TIẾT WI-PAY-01 — CHECKOUT, PAYMENT & SHIFT MANAGEMENT

## 1. OBJECTIVE
Xây dựng toàn bộ phân hệ Thanh toán, Hóa đơn, Quản lý Ca làm việc (Shift Management), Két tiền mặt (Cash Drawer) và Sổ nợ (Debt Lite) theo đúng chuẩn Master Specification V5.1, Database Schema V0.1 và State Machines V0.1.

## 2. SCOPE
- **Shift Management:** Mở ca (Open Shift), Nộp tiền / Rút tiền mặt (`Cash In / Cash Out`), Giao ca (Handover), Đóng ca (Close Shift) với điều kiện chặn đóng ca khi còn đơn hàng chưa thanh toán hoặc thanh toán dang dở.
- **Checkout & Payment:** Màn hình thanh toán (Checkout View), Thanh toán tiền mặt (Cash), Tạo QR payOS & Xác thực webhook (`payOS QR`), Thanh toán tách hóa đơn (Split Payment), Ghi nợ (Debt Lite).
- **Payment Architecture:** Kiến trúc thanh toán 3 lớp: `PaymentAttempt` → `Allocation` → `Settlement`.
- **Cash Drawer & Revenue:** Công thức tính toán kỳ vọng tiền mặt trong két, tách biệt tuyệt đối giữa tiền mặt thực tế, chuyển khoản QR và ghi nợ.
- **Customer & Debt Ledger:** Quản lý sổ nợ khách hàng theo từng cửa hàng, xử lý trả nợ an toàn (không âm quỹ nợ).

## 3. BUSINESS FLOW
### A. Transaction & Payment Flow
```text
Order (active_unfenced) 
  → Checkout 
  → Payment Attempt (Initiated / payOS QR / Cash)
  → Allocation (Matching payment to invoice amount)
  → Settlement (Finalized / Paid)
  → Order Closed (Terminal state)
  → Table Available (Table state: occupied → cleaning → available)
  → Cash / Revenue updated
```

### B. Shift & Cash Drawer Flow
```text
Open Shift (Opening cash immutability)
  → Operating (Sales, Cash-in, Cash-out)
  → Handover (Shift handover audit)
  → Close Shift (Validation of unclosed orders / pending payments → Closing balance reconciliation)
```

## 4. STATE MACHINES
- **Shift State Machine:** `closed → open → handover_pending → closed`.
- **Payment State Machine:** `initiated → attempted → allocated → settled / failed`.
- **Checkout / Invoice Fencing:** `active_unfenced → active_fenced → finalized → closed / cancelled`.

## 5. DATABASE / FIRESTORE CANONICAL PATHS
- `/stores/{storeId}/shifts/{shiftId}`
- `/stores/{storeId}/cashEntries/{cashEntryId}`
- `/stores/{storeId}/invoices/{invoiceId}`
- `/stores/{storeId}/invoices/{invoiceId}/lines/{invoiceLineId}`
- `/stores/{storeId}/paymentAttempts/{paymentAttemptId}`
- `/stores/{storeId}/settlements/{settlementId}`
- `/stores/{storeId}/debtAccounts/{customerId}`
- `/stores/{storeId}/debtOriginations/{originationId}`
- `/stores/{storeId}/debtCollections/{collectionId}`

## 6. SECURITY RULES
- Cập nhật Firestore Rules cho `shifts`, `cashEntries`, `invoices`, `paymentAttempts`, `settlements`, `debtAccounts`.
- Đảm bảo Active Membership phân quyền rõ ràng: Chỉ Cashier / Manager / Owner mới được thực hiện thanh toán, mở/đóng ca và quản lý nợ.
- Server-side validation cho các lệnh tài chính nhạy cảm.

## 7. UI / NAVIGATION
- **Shift Views:** Màn hình Mở ca (`OpenShiftDialog`), Giao ca (`HandoverDialog`), Đóng ca (`CloseShiftDialog`).
- **Checkout / Payment Views:** Màn hình Thanh toán tổng hợp (`CheckoutView`), Hiển thị QR payOS (`PayOsQrDialog`), Tách hóa đơn (`SplitPaymentView`), Ghi nợ (`DebtLiteDialog`).
- **Navigation Integration:** Truy cập từ Dashboard / POS Action bar.

## 8. PAYMENT ARCHITECTURE (payOS)
- Tạo yêu cầu thanh toán payOS thông qua Cloud Functions / Backend.
- Sinh QR Code hiển thị trên thiết bị thu ngân.
- Xác thực webhook từ payOS (Server final authority).
- Cơ chế Idempotency chống trùng lặp giao dịch.

## 9. SHIFT & CASH DRAWER
- Công thức kỳ vọng tiền mặt:
  $$\text{ExpectedCash} = \text{OpeningCash} + \text{PhysicalCashCollected} + \text{CashIn} - \text{CashOut} - \text{Drops} \pm \text{Adjustments}$$
- Khóa cứng (Blocking): Không cho phép đóng ca (`Close Shift`) nếu vẫn còn Bàn ở trạng thái `occupied` hoặc `cleaning`, hoặc có giao dịch thanh toán chưa hoàn tất (`pending_confirmation`).

## 10. DEBT LITE
- Quản lý hạn mức nợ và dư nợ của khách hàng gắn với Store.
- Quy trình trả nợ bằng Tiền mặt / Chuyển khoản, kiểm tra chống số dư âm (`Còn nợ < 0`).

## 11. DEPENDENCIES
- WI-AUTH-01 (LOCKED)
- WI-SETUP-01 (LOCKED)
- WI-TABLE-01 / WI-POS-01 (LOCKED)
- WI-KDS-01 (LOCKED)

## 12. PROTECTED WORK ITEMS
- WI-AUTH-01, WI-SETUP-01, WI-TABLE-01/POS-01, WI-KDS-01 được bảo vệ tuyệt đối, không được làm thay đổi hành vi đã PO_PASS.

## 13. IMPLEMENTATION ORDER (THỨ TỰ TRIỂN KHAI)
1. Data Models (`ShiftModel`, `CashEntryModel`, `InvoiceModel`, `PaymentAttemptModel`, `SettlementModel`, `DebtAccountModel`).
2. Firestore Security Rules & Deployment (`shifts`, `invoices`, `settlements`, etc.).
3. Repositories & Services (`ShiftRepository`, `PaymentRepository`, `DebtRepository`).
4. Shift Management UI (Open / Close Shift dialogues).
5. Checkout & Payment UI (Cash, payOS QR, Split payment, Debt Lite).
6. Integration test, `flutter analyze`, `flutter test`, build debug APK, deploy lên M51 & Note 8.

## 14. PO TEST PLAN
- Đăng nhập Chủ quán → Mở ca (Open Shift với tiền đầu ca) → Chọn bàn đã có Order (ví dụ Bàn 01) → Tiến hành Checkout → Thanh toán Tiền mặt hoặc payOS QR → Hoàn tất thanh toán (Order closed, Table chuyển `cleaning` / `available`, Doanh thu cập nhật) → Đóng ca (Close Shift, kiểm tra số dư và điều kiện chặn đóng ca).

## 15. RISKS / BLOCKERS
- Không có blocker; kiến trúc tuân thủ nghiêm ngặt Master Spec V5.1.

## 16. PO DECISION REQUIRED
- Phê duyệt kế hoạch chi tiết WI-PAY-01 trước khi bắt đầu viết code.
