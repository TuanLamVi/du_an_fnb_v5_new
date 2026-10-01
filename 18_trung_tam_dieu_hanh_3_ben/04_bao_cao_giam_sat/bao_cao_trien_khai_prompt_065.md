===== BEGIN FNB SMART FINAL REPORT =====

PROMPT:
PROMPT-065

WORK ITEM:
WI-REPORT-01 / WI-ANALYTICS-01

PO ISSUES:
1. Manual Debt chưa hiển thị riêng trong báo cáo. -> FIXED (Added "Ghi nợ phát sinh" metric powered by `debtOriginations`).
2. Chưa tách tiền mặt và chuyển khoản/QR. -> FIXED (Added separate lines for Cash and Transfer/QR under Collected).

FIX:
- Manual Debt Report: `TodaysSummaryService` queries `debtOriginations` created today.
- Cash Report: `TodaysSummaryService` filters settlements where `method == 'cash'`.
- QR/Transfer Report: `TodaysSummaryService` filters settlements where `method IN ['payos_qr', 'transfer', 'qr']`.

BUSINESS CHECK:
- Debt không tính vào Revenue: PASS
- Debt không tính vào Collected: PASS
- Manual Debt không tăng Cash: PASS
- Cash tách riêng: PASS
- QR/Transfer tách riêng: PASS
- Debt repayment phân loại đúng: PASS

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
