# DECISION — WI-PREPAID-EMPLOYEE-BILLING-01 — SAME-DAY NEW STAFF DEVICE ACTIVATION

- **Decision ID:** DEC-PREPAID-BILLING-LATE-DEVICE-01
- **Work Item:** WI-PREPAID-EMPLOYEE-BILLING-01
- **Decision maker:** Tuấn — Product Owner (PO)
- **Decision date:** 2026-10-10 (Vietnam time, UTC+7)
- **Decision source:** Explicit PO approval in the project coordination conversation on 2026-10-10.
- **Governance repository:** `TuanLamVi/du_an_fnb_v5_new`
- **Application repository:** `TuanLamVi/fnb-smart-v5`

## 1. Decision

The PO approves the following business policy for eligible staff-device connections added after the daily billing boundary of 00:00 Asia/Ho_Chi_Minh.

1. Each newly eligible staff-device connection must incur an additional fee of **3,000 VND for the current Vietnam billing day** before the server activates that connection.
2. If the required fee is successfully collected, the server may activate that connection for the remainder of the current billing day.
3. If the wallet has insufficient balance, do not collect a partial amount. Keep only the new connection in a non-active/pending state. **Do not lock or deactivate previously paid and active connections merely because the incremental fee for the new connection cannot be collected.**
4. Each incremental charge must be server-authoritative and idempotent, uniquely associated with the store, Vietnam billing date, and connection identity. Retries must not charge the same connection twice for that date.
5. The charge, wallet balance update, immutable ledger entry, and connection activation must have a recoverable consistency strategy. Prefer a single Firestore transaction for the financial write and activation when supported by the verified architecture. Never activate first and charge later.
6. If the base daily deduction for the date has not completed successfully, the implementation must coordinate activation with that day's billing state so the new connection is neither omitted nor charged twice. Pending, unapproved, revoked, suspended, or rejected connections must not be charged as eligible active staff connections merely because a billing retry occurs.
7. On the next Vietnam billing date, the normal daily fee policy applies to every eligible staff connection then active. Do not automatically refund a valid same-day fee after it has been collected.
8. The owner/server device remains excluded under the current approved policy.

## 2. Required acceptance evidence

The revised test matrix must include, at minimum:

- **TC-LATE-DEVICE-15:** Base daily fee already collected; one new eligible staff connection has sufficient wallet balance. Exactly 3,000 VND is collected once, ledger and wallet reconcile, and the connection becomes active.
- **TC-LATE-DEVICE-16:** Base daily fee already collected; insufficient balance for a new connection. No partial deduction occurs, the new connection remains non-active, and previously paid active connections remain active.
- **TC-LATE-DEVICE-17:** Repeated/concurrent activation attempts for the same connection and billing date cannot double-charge.
- **TC-LATE-DEVICE-18:** A connection arrives while the base daily billing transaction is pending or recovering. The connection is not omitted, activated without payment, or charged twice; the result is consistent after retry.
- **TC-LATE-DEVICE-19:** Independent connection states (`pending`, `revoked`, `suspended`, `rejected`) remain protected and are not automatically activated or charged.
- **TC-LATE-DEVICE-20:** The following day's normal daily deduction includes an eligible activated connection exactly according to the approved daily billing policy.

All tests remain `NOT RUN` until executed and evidenced in an approved test/emulator environment.

## 3. Scope and authorization boundary

This record approves **the business policy above only**. It does not approve a new or revised Change Request by itself, does not grant execution authorization for the newly expanded implementation scope, and does not authorize production deployment, production Firestore/rules/schema mutation, live-data migration, real-money deduction, or production transactions.

The CR revision/addendum and its acceptance contract must be reviewed and approved by the PO before implementation of the expanded scope. Existing historical approvals must not be rewritten or misrepresented.

## 4. Current status

- Business policy for same-day additional staff-device activation fee: `PO_APPROVED`.
- CR revision/addendum for this expanded scope: `DRAFT / PENDING PO CR APPROVAL`.
- Execution authorization for the expanded scope: `NOT GRANTED UNTIL CR REVISION AND REQUIRED GATES ARE APPROVED/VERIFIED`.
- Production: `NOT AUTHORIZED`.
- Work Item: `BLOCKED — DO NOT MERGE` pending the remaining governance, security, and test evidence.
