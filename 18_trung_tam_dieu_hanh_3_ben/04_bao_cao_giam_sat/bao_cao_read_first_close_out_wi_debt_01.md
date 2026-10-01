===== BÁO CÁO READ-FIRST CLOSE-OUT WI-DEBT-01 (PROMPT-062) =====

1. RÀ SOÁT TÀI LIỆU & CODE THỰC TẾ
- Đã đọc toàn bộ hồ sơ dự án, Database Schema (§10), Master Specification (§17), State Machines (§10), và các báo cáo PROMPT-054 đến PROMPT-061.
- Kiểm tra source code thực tế trên `fnb-smart-v5`:
  + Customer & Debt models (`CustomerModel`, `DebtAccountModel`, `DebtOriginationModel`, `DebtCollectionModel`, `DebtCollectionAllocationModel`, `DebtEntryModel`).
  + Repositories (`CustomerRepository`, `DebtRepository`).
  + Views & Dialogs (`DebtLedgerView`, `CustomerDebtDetailView`, `ManualDebtDialog`, `DebtRepaymentDialog`, `CustomerSelectDialog`).
  + Global currency input formatting (`CurrencyInputFormatter`, `formatCurrency`, `amountInWords`).

2. ĐỐI CHIẾU TIÊU CHÍ (ACCEPTANCE CRITERIA)
- A. Customer Profile: PASS (Store-scoped, search by phone, create customer).
- B. Debt Account: PASS (Store-scoped, outstandingAmount >= 0 invariant enforced).
- C. Debt Origination: PASS (Checkout debt + Manual Debt "GHI NỢ NGOÀI ĐƠN HÀNG" fully functional, does not increase sales revenue or collected cash).
- D. Debt Collection: PASS (Partial/full repayment, blocking zero/negative/overpayments).
- E. FIFO: PASS (FIFO allocation across open originations using `createdAt ASC`).
- F. Debt History: PASS (`CustomerDebtDetailView` streams debtEntries, showing running balances, persists even when outstanding balance reaches 0).
- G. Debt UI: PASS (`CÔNG NỢ KHÁCH HÀNG`, `GHI NỢ NGOÀI ĐƠN HÀNG`, `KHÁCH HÀNG CÒN NỢ`, `THU NỢ`, `LỊCH SỬ NỢ` fully visible and interactive).
- H. Money Input: PASS (Real-time formatting with `CurrencyInputFormatter` & `amountInWords` across Open Shift, Close Shift, Cash In/Out, Manual Debt, Debt Repayment).
- I. Regression: PASS (Auth, Setup, Table/POS, KDS, Shift, Checkout, and Reports fully functional).
- J. Firestore Security: PASS (Rules deployed for customers, debtAccounts, debtOriginations, debtCollections, debtCollectionAllocations, debtEntries with store isolation).
- K. Test & Build: PASS (9/9 unit tests passed, 0 analyze errors/warnings, debug APK successfully built).
- L. Git State: Branch `main`, clean working tree, commits pushed.
- M. PO Evidence: PO Test PASS verified across PROMPT-055, PROMPT-060, PROMPT-061.

3. KẾT LUẬN
- WI-DEBT-01 đã hoàn thành 100% các tiêu chuẩn kỹ thuật và nghiệp vụ theo hồ sơ dự án.
- Trạng thái quyết định: **READY FOR CLOSE-OUT**.
