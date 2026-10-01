===== BEGIN FNB SMART FINAL REPORT =====

PROMPT:
PROMPT-049

WORK ITEM:
WI-REPORT-01 / WI-ANALYTICS-01 — Today's Summary & Reports

OBJECTIVE:
TodaysSummaryService & Data Aggregation Layer

READ-FIRST:
PASS

IMPLEMENTATION:
PASS

SERVICE:
`TodaysSummaryService` (`lib/features/reports/data/todays_summary_service.dart`)

MODEL:
`TodaysSummaryModel` (`lib/features/reports/models/todays_summary_model.dart`)

DATA SOURCES:
- `/stores/{storeId}/invoices` (Sales Revenue)
- `/stores/{storeId}/settlements` (Collected Cash + QR, Debt)
- `/stores/{storeId}/orders` (Uncollected Balance & Total Orders count)
- `/stores/{storeId}/tables` & `/stores/{storeId}/tableStates` (Occupied, Cleaning, Available table counts)
- `/stores/{storeId}/shifts` & `/stores/{storeId}/cashEntries` (Shift Opening, Expected Cash Drawer balance, Variance)

FORMULAS:
- Sales Revenue = Subtotal - Discounts
- Collected = Cash + QR (Excludes Debt)
- Debt = Debt Settlements / Originations
- Uncollected = Unbilled Active Orders
- Cash Drawer A6 = Opening + CashSales + CashIn - CashOut

TIME WINDOW:
- Today's business window (`00:00 -> current timestamp` in store local timezone / current `businessDate`).

PERMISSION:
- Financial data access scoped for `view_financials` or `role_owner` / `role_manager`.

QUERIES:
- Firestore collection queries filtering by `storeId` and `createdAt >= startOfDay`.

INDEX REQUIRED:
NO (Existing single-field index and subcollection composite rules suffice for single-store daily range queries).

TEST:
PASS (7/7 unit tests passed including all required formula test cases)

ANALYZE:
PASS (0 issues, 0 warnings)

BUILD:
PASS (Built build\app\outputs\flutter-apk\app-debug.apk)

APK:
build\app\outputs\flutter-apk\app-debug.apk

SHA256:
78126852F9C56ED9FB3B43396E0D453A75D4F5F9671833FC337818CCF7CDC9F7

REGRESSION:
PASS (AUTH, SETUP, TABLE/POS, KDS, Shift, Checkout unchanged)

CODE CHANGED:
YES (`lib/features/reports/models/todays_summary_model.dart`, `lib/features/reports/data/todays_summary_service.dart`, `test/widget_test.dart`)

UI CHANGED:
NO (UI screen deferred to PROMPT-050)

DASHBOARD CHANGED:
NO

PAYOS LIVE:
NO

PO TEST:
PENDING

PO_VERIFIED:
NO

NEXT PLANNED STEP:
PROMPT-050 — TodaysSummary UI (`TodaysSummaryView` & Reports Dashboard Button)

===== END FNB SMART FINAL REPORT =====
