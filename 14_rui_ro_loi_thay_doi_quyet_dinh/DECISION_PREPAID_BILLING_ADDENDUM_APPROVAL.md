# DECISION — PO APPROVAL OF PREPAID BILLING ADDENDUM

- **Decision ID:** `DEC-PREPAID-BILLING-ADD-01`
- **Date:** 2026-10-10 (Vietnam time, UTC+7)
- **Decision maker:** PO (Tuấn)
- **Decision source:** Explicit PO response in the F&B SMART project conversation: “tôi đồng ý bước tiếp theo”, in direct response to the stated next step of formally approving `CR-PREPAID-BILLING-01-ADD-01`.
- **CR:** [CR-PREPAID-BILLING-01-ADD-01](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/13_quan_ly_thay_doi/CR-PREPAID-BILLING-01-ADDENDUM-01.md)
- **Related business policy:** [DECISION_PREPAID_BILLING_LATE_DEVICE_ACTIVATION_POLICY.md](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_PREPAID_BILLING_LATE_DEVICE_ACTIVATION_POLICY.md)

## 1. PO decision

**APPROVED:** The PO approves the scope and acceptance requirements in `CR-PREPAID-BILLING-01-ADD-01` for same-day incremental billing of an eligible employee-device connection becoming eligible after 00:00 Asia/Ho_Chi_Minh.

The approved behavior is exactly the bounded scope in the CR addendum: charge an additional 3,000 VND for the current Vietnam billing day before activating the new eligible connection; if the wallet has insufficient funds, deduct nothing and leave only the new connection non-active/pending, without locking previously paid active connections; enforce server-side idempotency and consistency with daily billing.

## 2. Decision boundary — not an execution authorization

- **CR addendum approval:** `APPROVED BY PO — 2026-10-10`.
- **Expanded-scope execution authorization:** `NOT GRANTED BY THIS DECISION`.
- **Gate 1 evidence:** `MUST BE VERIFIED AND RECORDED BEFORE ANY SOURCE/CONFIGURATION EDIT`.
- **Gate 2 technical design and acceptance contract:** `MUST BE VERIFIED AND RECORDED BEFORE ANY SOURCE/CONFIGURATION EDIT`.
- **Tests:** All relevant tests remain `NOT RUN` until actually executed with verifiable evidence.
- **Application source changes:** Not yet permitted for this expanded scope until Gate 1 and Gate 2 evidence are verified and separate execution authorization is granted/confirmed.
- **Firebase Emulator/staging:** No changes for this expanded scope until those prerequisites are satisfied.
- **Production, production Firebase Rules/schema mutation, live-data migration, real-money deductions/transactions, deployment, and merge into `main`:** `NOT AUTHORIZED`.

This decision does not rewrite the historical approval or conditional execution authorization for the parent CR. It approves only the named addendum's change scope; it does not mark any gate PASS, authorize implementation now, or permit production operations.

## 3. Required next steps

1. Codex records source-grounded Gate 1 forensic evidence for the expanded behavior, including exact repo/branch/HEAD, source paths/functions, data layout, status transitions, Firestore Rules and security risks.
2. Codex records Gate 2 design for atomic wallet/ledger/activation consistency, same-day idempotency, concurrency with daily billing and device removal, failure recovery, and TC-LATE-DEVICE-15 through TC-LATE-DEVICE-20.
3. The PO/authorized governance process verifies the gate evidence and records separate execution authorization for the expanded scope.
4. Only after all prerequisites pass may the smallest scoped staging/emulator implementation begin. Stop at first failure. Do not merge or deploy to production.

## 4. Final status

`CR APPROVED` / `EXPANDED-SCOPE EXECUTION AUTHORIZATION NOT GRANTED` / `GATE 1 + GATE 2 EVIDENCE REQUIRED BEFORE EDIT` / `PRODUCTION NOT AUTHORIZED` / `BLOCKED — DO NOT MERGE`.
