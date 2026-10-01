===== BEGIN FNB SMART FINAL REPORT =====

PROMPT:
PROMPT-042 — Implementation of Cash In & Cash Out Drawer Operations

WORK ITEM:
WI-PAY-01 — Checkout, Payment & Shift Management

1. READ-FIRST:
- Master Specification V5.1 (§16 Shift & Cash Drawer), Database Schema V0.1 (§9 Shift), PROMPT-041 Business Discovery.

2. FILES CHANGED:
- `lib/features/pay/views/cash_in_out_dialog.dart` (Created Cash In / Cash Out UI Dialog)
- `lib/features/auth/views/dashboard_placeholder_view.dart` (Added `NẠP TIỀN KÉT` and `RÚT TIỀN KÉT` buttons on active Shift Status Card)

3. CASH IN FLOW:
- User taps `NẠP TIỀN KÉT` -> opens `CashInOutDialog(initialType: 'cash_in')` -> enters amount (> 0) and reason -> saves `CashEntryModel` to `/stores/{storeId}/cashEntries` -> increases expected cash.

4. CASH OUT FLOW:
- User taps `RÚT TIỀN KÉT` -> opens `CashInOutDialog(initialType: 'cash_out')` -> enters amount (> 0) and reason -> saves `CashEntryModel` to `/stores/{storeId}/cashEntries` -> decreases expected cash.

5. UI:
- Buttons integrated directly into active Shift Status Card on Dashboard.

6. PERMISSION:
- Operates under active shift capability (`manage_shift` / active owner/cashier in open shift).

7. FIRESTORE PATH:
- `/stores/{storeId}/cashEntries/{cashEntryId}`

8. SECURITY:
- Governed by Firestore Rules for `cashEntries` under `/stores/{storeId}`.

9. EXPECTED CASH CALCULATION:
- Formula: $\text{ExpectedCash} = \text{OpeningCash} + \text{CashSales} + \text{CashIn} - \text{CashOut}$.

10. TEST 1–8 RESULTS:
- TEST 1 (CASH IN): PASS (Document created under `cashEntries` with correct `shiftId` and `storeId`).
- TEST 2 (CASH OUT): PASS (Document created with `entryType = 'cash_out'`).
- TEST 3 (EXPECTED CASH 100k opening + 50k sales + 50k in - 20k out = 180k expected): PASS.
- TEST 4 (MULTIPLE ENTRIES): PASS (Accurately sums multiple cash entries).
- TEST 5 (CLOSED SHIFT): PASS (Block cash entries on closed shift).
- TEST 6 (NO OPEN SHIFT): PASS (Blocks cash entries when shift management is ON and no shift is open).
- TEST 7 (NON-CASH PAYMENT): PASS (payOS QR payments excluded from cash sales).
- TEST 8 (REGRESSION): PASS (Auth, Setup, Table/POS, KDS, Shift ON/OFF, Checkout fully functional).

11. ANALYZE:
PASS (0 issues, 0 warnings)

12. UNIT TEST:
PASS (4/4 unit tests passed)

13. BUILD:
PASS (Built build\app\outputs\flutter-apk\app-debug.apk)

14. APK SHA256:
4705C7292E75393A9511BA86515E6CAFD8C669F6D68CDC5500DC609875CEFA0A

15. DEVICE INSTALL / LAUNCH:
- Samsung Galaxy Note 8 (Device ID: 988e50385a3931435330, Android 9): INSTALL PASS, LAUNCH PASS (PID 25378)
- Samsung Galaxy M51 (Device ID: RF8NC11QQVM, Android 12): INSTALL PASS, LAUNCH PASS (PID 20049)

16. GIT COMMIT / PUSH:
- Repository: fnb-smart-v5, Branch: main, Commit: 2a673b8, Pushed to origin/main successfully.

17. KNOWN GAPS:
- None for Cash In / Cash Out scope.

STATUS:
TECHNICAL IMPLEMENTATION COMPLETE — WAITING PO TEST

===== END FNB SMART FINAL REPORT =====
