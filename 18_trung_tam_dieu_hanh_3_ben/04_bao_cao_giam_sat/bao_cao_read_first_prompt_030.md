===== READ-FIRST REPORT: WI-PAY-01 SHIFT MANAGEMENT & STORE POLICY (PROMPT-030) =====

WORK ITEM:
WI-PAY-01 — Checkout, Payment & Shift Management

CURRENT SHIFT STATUS:
- Data models (`ShiftModel`, `CashEntryModel`) exist, but repository, service, and shift UI (Open/Close shift) are not yet implemented in the app source code.

CURRENT STORE POLICY STATUS:
- Database schema (`DATABASE_SCHEMA_V0.1.md` §4) defines `/stores/{storeId}/privateSettings/{settingId}` (e.g., `financialSettings`, `joinAccess`).
- A toggle for Shift Management (`shiftManagementEnabled` / `enableShiftManagement`) should be stored either directly inside the Store document `/stores/{storeId}` or within `/stores/{storeId}/privateSettings/storePolicy` (or `financialSettings`).

CURRENT PERMISSION STATUS:
- Owner / Manager (`role_owner` or manager capabilities): Full administrative control over store settings, shift policies, and shift closures.
- Staff / Cashier: Operational access; conditional on shift policy when Shift Management is ON.

SHIFT UI:
- Open Shift: NOT YET IMPLEMENTED
- Close Shift: NOT YET IMPLEMENTED
- Handover: NOT YET IMPLEMENTED
- Cash In: NOT YET IMPLEMENTED
- Cash Out: NOT YET IMPLEMENTED

STORE OPERATING POLICY:
- Đã có trong hồ sơ: YES (`DATABASE_SCHEMA_V0.1.md` §4 & Master Spec §16).
- Canonical location: `/stores/{storeId}` (field `shiftManagementEnabled: bool`) or `/stores/{storeId}/privateSettings/storePolicy`.

RECOMMENDED DESIGN:
- Shift ON: Staff with selling permission must have an active open shift (`/stores/{storeId}/shifts` where `status == 'open'`) before payment settlement is allowed. If no open shift exists, prompt Open Shift dialog.
- Shift OFF: Staff with selling permission can execute payment settlement directly without checking for an open shift.

CLOSE SHIFT RULE:
- Blocked if: (1) Any tables remain in `occupied` or `cleaning` state; (2) Any pending payment attempts (`pending_confirmation`) exist.

IMPACT ON POS:
- POS ordering / checkout checks store shift policy and active shift status before completing payment.

IMPACT ON PAYMENT:
- Settlements are linked to the active `shiftId` when Shift Management is ON. When OFF, settlement can proceed without a `shiftId` or use a system shift context.

IMPACT ON CASH DRAWER:
- Cash drawer cash entries (`Cash In`, `Cash Out`, expected cash reconciliation) are active when Shift Management is ON.

IMPACT ON DEBT:
- Debt collections are associated with the active shift when Shift Management is ON.

LOCKED COMPONENTS AT RISK:
- NONE (WI-AUTH-01, WI-SETUP-01, WI-TABLE-01/POS-01, WI-KDS-01 remain protected).

RECOMMENDED NEXT WORK ITEM:
- Complete WI-PAY-01 by implementing Shift Management (Open/Close Shift, Cash In/Out, and Store Policy toggle for Shift ON/OFF).

PO DECISION REQUIRED:
- Confirm storage location of store shift policy (`/stores/{storeId}` field `shiftManagementEnabled` vs `/stores/{storeId}/privateSettings/storePolicy`).

STATUS:
READ-FIRST ONLY — NO CODE
