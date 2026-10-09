# CR-PREPAID-BILLING-01-ADD-01 — SAME-DAY INCREMENTAL CHARGE FOR NEW STAFF DEVICES

- **CR ID:** CR-PREPAID-BILLING-01-ADD-01
- **Parent CR:** CR-PREPAID-BILLING-01
- **Work Item:** WI-PREPAID-EMPLOYEE-BILLING-01
- **Related PO decision:** DEC-PREPAID-BILLING-LATE-DEVICE-01
- **Status:** `PO APPROVED — 2026-10-10 (EXPLICIT CHAT APPROVAL)`
- **Execution authorization for this addendum:** `NOT GRANTED`
- **Environment:** Emulator/staging only after approval and required Gate 1/Gate 2 evidence
- **Production:** `NOT AUTHORIZED`
- **Date prepared:** 2026-10-10 (Vietnam time, UTC+7)

## 1. Purpose and background

This addendum extends the previously approved prepaid employee-device billing requirements to cover a staff-device connection first becoming eligible after the daily billing boundary at 00:00 Asia/Ho_Chi_Minh.

The separate PO business-policy decision, `DEC-PREPAID-BILLING-LATE-DEVICE-01`, is approved. The PO explicitly approved this CR addendum on 2026-10-10 in the conversation. The approval is recorded in `DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md`. This CR approval does not grant execution authorization. The existing approval and authorization records for the parent CR must not be rewritten or treated as automatic approval of this expanded scope.

## 2. Problem statement / root cause

The baseline daily billing flow assesses eligible staff connections at the daily billing boundary. A connection first becoming eligible later in the same Vietnam billing day could otherwise either:
- become active without the incremental fee being collected;
- be missed by the daily assessment;
- cause a previously paid active connection to be locked when only the new connection's incremental fee is unaffordable; or
- be charged more than once during concurrent activation/retry.

The implementation must coordinate new-connection approval/activation, incremental financial posting, the daily deduction lock and ledger, and the existing device status state machine.

## 3. PO-approved business policy

As recorded in `DEC-PREPAID-BILLING-LATE-DEVICE-01`:

1. An eligible staff-device connection added after 00:00 Vietnam time incurs an incremental fee of **3,000 VND for the current Vietnam billing day** before activation.
2. If the incremental fee is successfully collected, the server may activate that connection for the remainder of that billing day.
3. If the wallet cannot cover the incremental fee, no partial amount is collected and the new connection remains non-active/pending. Previously paid active connections remain active; do not lock/deactivate them merely because the incremental fee for the new connection cannot be collected.
4. Each incremental charge must be server-authoritative and idempotent, uniquely keyed by store, Vietnam billing date, and connection identity. A retry or concurrent request must not charge the same connection/date twice.
5. The wallet update, immutable ledger entry and incremental charge must have a recoverable consistency strategy with activation. Never activate first and charge later.
6. Coordinate the new connection with a daily billing operation that is pending or recovering, without omission, unpaid activation or duplicate billing.
7. Do not charge pending, unapproved, revoked, suspended or rejected connections as eligible active staff connections merely because billing retries.
8. At the next Vietnam billing boundary, the existing normal daily policy applies to all eligible connections active then.
9. The current policy exclusion for the server/owner device remains unchanged.

## 4. Proposed scope of change

With PO CR approval granted on 2026-10-10, and subject to completion/evidence of the mandatory governance gates:

- Inspect and modify only the necessary server-authoritative connection-creation/approval/activation flow, daily billing logic, wallet/ledger transaction logic, and associated Firestore Rules.
- Establish an idempotency key or equivalent immutable record for each incremental charge by store/date/connection.
- Make connection activation conditional on successful incremental payment.
- Preserve existing independently governed statuses, tenant isolation, wallet/ledger write denial for clients, one-time top-up policy, no-partial-deduction behavior, and the maximum 400-write batch constraint.
- Add automated Firebase Emulator security/integration tests and backend tests for the new behavior.
- Update traceability and evidence records only after tests have actually run.

No schema/collection changes may be assumed. Confirm the official app architecture and current data layout first. If a new record or collection is needed, document it in the design and resolve any schema conflict before implementation.

## 5. Out of scope

- Production deployment or production Firebase Rules/schema mutation.
- Live-data migration or use of production customer/store data.
- Real-money deductions or production transactions.
- Merging the feature branch into `main`.
- Changing the existing approved base daily billing price/policy, owner/server-device exclusion, or no-refund-after-success rule beyond what is explicitly described in this addendum.
- Marking the Work Item `PO_VERIFIED`, `PROTECTED`, or `LOCKED`.

## 6. Acceptance criteria and test cases

All cases remain `NOT RUN` until actual execution evidence exists.

- **TC-LATE-DEVICE-15 — Successful incremental charge:** base daily fee already collected; wallet has enough balance; exactly 3,000 VND is charged for the new eligible connection; ledger and wallet reconcile; the connection becomes active.
- **TC-LATE-DEVICE-16 — Insufficient balance:** no partial charge; only the new connection remains pending/non-active; previously paid active connections remain active; balance remains unchanged.
- **TC-LATE-DEVICE-17 — Idempotency/concurrency:** concurrent or repeated activation attempts for the same store/date/connection cannot double-charge.
- **TC-LATE-DEVICE-18 — Billing lock in progress/recovery:** the new connection is not omitted, activated without payment or charged twice if it arrives during base daily billing or recovery.
- **TC-LATE-DEVICE-19 — State precedence:** pending, revoked, suspended and rejected connections are not accidentally charged or activated.
- **TC-LATE-DEVICE-20 — Next billing day:** normal daily deduction includes eligible activated connections according to the approved policy.
- Regression-test all existing prepaid billing, payment, top-up, tenant isolation, and member security acceptance cases.

Required evidence: actual command, exit code, pass/fail/skipped counts, emulator logs, relevant code diff, and reconciliation evidence. Pure local-variable simulations do not prove Firestore transactions, security rules, concurrency, or recovery.

## 7. Governance prerequisites

Before any source/configuration edit for this addendum:
- Confirm the official application repository, branch, HEAD, worktree state and protected baseline.
- Complete and record source-grounded Gate 1 forensic evidence.
- Complete and record Gate 2 technical design and acceptance contract, including concurrent base daily deduction, device removal, connection creation, incremental billing and retry semantics.
- Resolve any conflict with the approved data architecture and security contracts.
- PO approval of this CR addendum: completed on 2026-10-10 and recorded in `DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md`.
- Obtain separate execution authorization for this expanded scope; the existing parent CR authorization does not automatically authorize this incremental-charge scope.

If any prerequisite fails, stop at first failure and report evidence. No guessing, no production action.

## 8. Risk and rollback

Primary risks include duplicate charging, activating an unpaid connection, locking previously paid connections, and a race between connection changes and the daily billing boundary.

Rollback must be designed before implementation. If an emulator/staging test fails, stop rollout and preserve wallet/ledger correctness. Do not automatically refund a successfully collected fee. Any financial correction must use a separately authorized immutable adjustment entry, not edit/delete existing ledger entries.

## 9. Approval record

- PO policy decision: `APPROVED` via `DEC-PREPAID-BILLING-LATE-DEVICE-01`.
- This CR addendum: `PO APPROVED — 2026-10-10`; approval record: `DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md`.
- Expanded-scope execution authorization: `NOT GRANTED`.
- Gate 1/Gate 2 evidence for this expanded scope: `PENDING VERIFICATION/RECORDING`; no source/configuration edit is permitted until required evidence and authorization are verified.
- Tests: all original and addendum cases remain `NOT RUN` unless actual execution evidence is recorded.
- Production: `NOT AUTHORIZED`.
- Current verdict: `BLOCKED — DO NOT MERGE`.

**Next permitted activity:** Complete and record source-grounded Gate 1 and Gate 2 evidence for the approved addendum, then obtain/confirm separate execution authorization for the expanded scope before any source/configuration change.
