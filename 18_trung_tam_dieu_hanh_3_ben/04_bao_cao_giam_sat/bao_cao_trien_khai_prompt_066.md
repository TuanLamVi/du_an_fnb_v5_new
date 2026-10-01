===== BEGIN FNB SMART FINAL REPORT =====

PROMPT:
PROMPT-066

WORK ITEM:
WI-REPORT-01 / WI-ANALYTICS-01

PO ISSUE:
Báo cáo chưa tính đầy đủ công nợ phát sinh từ quá trình bán hàng / Checkout. -> FIXED (Both Checkout Debt and Manual Debt are aggregated under "Ghi nợ phát sinh").

FIX:
- Debt from Sales: `TodaysSummaryService` aggregates debt from sales and manual debt via `debtOriginations`.
- Manual Debt: Aggregated correctly.
- Total Debt Recorded: Combines all debt origins without inflating Sales Revenue or Collected cash.

BUSINESS CHECK:
- Nợ từ bán hàng xuất hiện trong báo cáo: PASS
- Nợ ngoài đơn hàng xuất hiện: PASS
- Hai loại được cộng đúng: PASS
- Debt không tính vào Collected: PASS
- Debt không làm tăng Cash: PASS
- Thu nợ Cash: PASS
- Thu nợ QR/Transfer: PASS

TEST:
- Unit: PASS (All unit tests passed)
- Analyze: PASS (0 errors, 0 warnings)
- Build: PASS (Built build\app\outputs\flutter-apk\app-debug.apk)

APK:
- Path: `build/app/outputs/flutter-apk/app-debug.apk`
- SHA256: `CC56D80E69B7445B260CCE39A438299414998382A524A92F38CA14ACAC355AB3`

GIT:
- Branch: main, HEAD: 3548bb8, Commit: 3548bb8, Pushed successfully.

PO STATUS:
READY FOR PO RETEST

KHÔNG:
- PO_VERIFIED
- PROTECTED
- LOCKED
- CLOSE-OUT

===== END FNB SMART FINAL REPORT =====
