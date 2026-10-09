# EXECUTION AUTHORIZATION — PREPAID BILLING ADDENDUM

- **Decision ID:** `DEC-PREPAID-BILLING-ADD-EXEC-01`
- **Date:** 2026-10-10 (Vietnam time, UTC+7)
- **Decision maker:** PO (Tuấn)
- **Decision source:** Explicit confirmation in the F&B SMART project conversation: “tôi đồng ý. bạn cứ triển khai”, following the proposed bounded authorization wording.
- **Work Item:** `WI-PREPAID-EMPLOYEE-BILLING-01`
- **CR Addendum:** `CR-PREPAID-BILLING-01-ADD-01`
- **Related CR approval:** [DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/14_rui_ro_va_quyet_dinh/DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md)

## 1. Authorization granted

The PO authorizes bounded implementation and verification of the approved addendum with these exact limits:

- Modify application code only on the dedicated branch `feature/wi-prepaid-employee-billing-01`; do not make changes directly on `main`.
- Implement same-day incremental billing for an eligible new staff-device connection after 00:00 Vietnam time, at 3,000 VND for the current Vietnam billing day, with server-authoritative charge-before-activation, no partial charge, idempotency, recovery consistency, and preservation of prior paid active connections.
- Correct the identified member-role privilege escalation in Firestore Rules, preserving the legitimate owner bootstrap path.
- Add and run applicable automated tests, including Firebase Emulator security/integration tests where the available workspace supports execution.
- Emulator/local isolated test data only. Staging may be used only if it is verified as isolated and cannot connect to production data or cause a real financial transaction. If this cannot be verified, stop before using staging.

## 2. Explicit prohibitions

This authorization does **not** permit:
- Merge, pull-request merge, or direct changes to `main`.
- Production deployment or any production Firebase Rules/schema/configuration change.
- Access to or mutation of production customer/store data.
- Real-money deductions, live top-ups, or production billing runs.
- Destructive migrations or unreviewed schema/collection changes.
- Marking tests PASS without actual output and evidence.
- Expanding scope beyond the approved CR addendum and necessary, directly related security fix.

## 3. Execution controls

1. Reconcile the current feature branch and exact source HEAD before editing. If local Git evidence is unavailable, use the exact verified GitHub branch commit; do not invent local command output.
2. Make the smallest source-grounded changes, preserving unrelated work.
3. Add tests for owner self-escalation, legitimate owner bootstrap, tenant isolation, same-day incremental fee, insufficient balance, duplicate/concurrent requests, daily billing races, and status precedence.
4. Run all feasible checks. Clearly label commands not run and checks not supported by this environment.
5. If a test fails or architecture assumptions remain unproven, stop at first failure and report the blocker.
6. Commit/push only to the dedicated feature branch. Do not merge or deploy.
7. Record commits, exact changed paths, test commands/results, and remaining risks in governance after verification.

## 4. Status

- `CR-PREPAID-BILLING-01-ADD-01`: `PO APPROVED`
- `DEC-PREPAID-BILLING-ADD-EXEC-01`: `PO AUTHORIZED — FEATURE BRANCH / ISOLATED TEST ONLY`
- `main` merge: `NOT AUTHORIZED`
- Production: `NOT AUTHORIZED`
- Real-money operations: `NOT AUTHORIZED`
- Work item closeout: not granted; PO acceptance remains a later step.
