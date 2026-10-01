===== BÁO CÁO LẬP KẾ HOẠCH TRIỂN KHAI WI-REPORT-01 (PROMPT-048) =====

WORK ITEM:
WI-REPORT-01 / WI-ANALYTICS-01 — Today's Summary & Reports (Tổng quan hôm nay, Báo cáo Doanh thu & Két tiền)

READ-FIRST:
PASS

CURRENT DASHBOARD:
`DashboardPlaceholderView` currently displays Store info, Quick Setup card, Store Policy toggle card, Active Shift status card, and Navigation buttons (Sơ đồ bàn & Màn hình bếp).

REPORT SCREEN:
Planned `TodaysSummaryView` and `TodaysSummaryCardWidget`.

UI LOCATION:
NEEDS PO DECISION (Option 1: Display Today's Summary metric cards directly on main Dashboard; Option 2: Add dedicated "BÁO CÁO CHI TIẾT" button to open separate Reports screen).

REQUIRED METRICS:
1. Doanh thu bán hàng (Sales Revenue)
2. Đã thu (Actual Payment Received: Cash + payOS QR)
3. Ghi nợ (Debt Recorded)
4. Còn phải thu (Uncollected Table/Order Balance)
5. Tiền mặt trong két (Cash Drawer A6 Formula)
6. Bàn & Đơn (Serving Occupied tables, Cleaning tables, Available tables, Total Orders)
7. Ca hiện tại (Opening Cash, Expected Cash, Actual Cash, Variance)

FORMULAS:
- Sales Revenue = Subtotal - Discounts
- Collected = Cash + payOS QR Collected (Excludes Debt)
- Debt Recorded = Customer Credit extended
- Uncollected = Unbilled active orders on occupied tables
- Cash Drawer = Opening + PhysicalCash + CashIn - CashOut

DATA SOURCES:
- `/stores/{storeId}/orders`, `/invoices`, `/settlements`, `/shifts`, `/cashEntries`, `/tables`, `/tableStates`, `/debtAccounts`.

TIME WINDOW:
- Today's business window (`00:00 -> current timestamp` in local store timezone / current `businessDate`).

PERMISSION:
- `view_financials` or `role_owner` / `role_manager`.

EXISTING COMPONENTS:
- Orders, Invoices, Settlements, Shifts, Cash Entries, Table/TableStates, Debt models and repositories.
- `formatCurrency` shared formatter (`lib/core/utils/currency_utils.dart`).

NEW COMPONENTS REQUIRED:
- `TodaysSummaryService`
- `TodaysSummaryCardWidget`
- `TodaysSummaryView`

FIRESTORE QUERIES:
- Daily aggregation queries filtering by `storeId` and `createdAt >= startOfDay`.

INDEX IMPACT:
- May require composite index on `invoices` / `orders` / `settlements` (`storeId`, `createdAt`).

BUSINESS LOGIC:
- Strictly obeys Master Specification V5.1 §18 & Prompt 099. Preserves distinction between Collected vs Debt vs Uncollected.

TEST PLAN:
- Unit tests for `TodaysSummaryService` calculations across all 4 metric groups.

PO TEST PLAN:
- Create orders, collect cash, collect QR, record debt, do cash in/out -> Open Dashboard/Reports -> Verify exact matching figures.

DEPENDENCIES:
- WI-AUTH-01 (LOCKED), WI-SETUP-01 (LOCKED), WI-TABLE-01/POS-01 (LOCKED), WI-KDS-01 (LOCKED), WI-PAY-01 (LOCKED).

GAPS:
- Excel/PDF export and COGS/Margin deferred to Post-MVP (§18.4).

PO DECISION REQUIRED:
- UI Location choice: Render metrics directly on Dashboard (Option 1) vs Dedicated Reports Screen (Option 2).

IMPLEMENTATION PHASES:
- Phase 1: Service & Data Aggregation
- Phase 2: UI Cards & Views
- Phase 3: Integration, Testing & Deployment

PROPOSED NEXT PROMPTS:
- PROMPT-049: Service implementation
- PROMPT-050: UI Cards & View implementation
- PROMPT-051: Deployment & PO Test Preparation

CODE CHANGED:
NO

BUILD:
NOT RUN

PO_VERIFIED:
NO

STATUS:
READY FOR PO APPROVAL — CHƯA CODE
