# KẾ HOẠCH CỔNG THỰC THI — WI-PREPAID-EMPLOYEE-BILLING-01

## 1. Trạng thái quản trị

- Work Item: `WI-PREPAID-EMPLOYEE-BILLING-01`
- Change Request: `CR-PREPAID-BILLING-01`
- Decision: `DEC-PREPAID-BILLING-01`
- CR: `APPROVED BY PO — 2026-10-09`
- Execution Authorization: `NOT GRANTED`
- Work Item status: `EXECUTION GATE PREPARATION`
- Application source changes: `NOT AUTHORIZED`
- Firebase / production changes: `NOT AUTHORIZED`
- Tests: all planned tests remain `NOT RUN` until executed and evidence is recorded.

PO approval covers the prepaid billing requirements and Governance change request only. It is not authorization to edit application code, deploy Cloud Functions, change Firestore rules/schema, migrate data, or affect production.

## 2. Official target and repository boundary

- Governance repository: `TuanLamVi/du_an_fnb_v5_new`, branch `main`.
- Application repository for any future separately authorized work: `TuanLamVi/fnb-smart-v5`.
- Do not put Governance records into the application repository.
- Do not modify the locked F&B SMART V5.1 baseline or use legacy repositories as a substitute for the official source.
- Before any implementation, perform READ-FIRST against the official application source and its current documentation; record the exact branch, HEAD, worktree state, applicable contracts, and protected files. If the official source or required documents cannot be read, mark `UNPROVEN / BLOCKED` and stop.

## 3. PO-approved business rules to preserve

1. Fee: 3,000 VND per maintained staff-device connection per Vietnam billing day.
2. Server device: free under the current policy; do not describe this as permanently free.
3. Billing boundary: 00:00 Vietnam time (UTC+7).
4. Option A on insufficient balance: do not deduct any amount; preserve the balance; lock all staff devices; the owner chooses which devices to retain.
5. If the owner removes devices and the fee for the current day has not yet been collected, collect the exact total for the remaining devices only when the balance is sufficient, then enable those remaining devices through the end of that billing day.
6. Do not charge twice for the same store and billing day. Do not automatically refund after a daily fee has already been collected.
7. Recovery may clear `locked_insufficient_balance` only; it must preserve `revoked` and `suspended`.
8. Trial ends after 100 commercial orders. Exclude the 5 test orders only when they occur in a server-controlled isolated test environment.
9. Low-wallet warning when the available balance covers no more than 3 days.
10. Missed downtime days must not be charged retroactively without a trustworthy snapshot.
11. Keep tenant isolation, idempotency, immutable ledger, one-time top-up code, anti-replay/rate limiting, and batch writes capped at 400 operations.
12. Keep the wallet and ledger tenant-scoped as approved in the requirements: `storeWallets/{storeId}`, `billingLedger/{ledgerId}`, and `topUpCodes/{codeId}`. The exact Firestore layout, indexes, rules, and transactional boundaries must be verified against the official app architecture before implementation; do not assume this note alone is a complete schema contract.

## 4. Execution gates

### GATE 0 — CR approved

- [x] PO approved `CR-PREPAID-BILLING-01`.
- [x] Governance records updated on `main`.
- [ ] Keep execution authorization separate from CR approval.

### GATE 1 — Application READ-FIRST / forensic (read-only)

Must be completed before implementation authorization is requested:
- [ ] Confirm exact application repository, branch, HEAD, clean/dirty worktree, and protected baseline.
- [ ] Read official Kim Chi Nam / source-of-truth rules and applicable product, architecture, data, security, billing, trial, and testing contracts from the official documentation source.
- [ ] Inspect existing store/tenant identity, owner/staff membership, device/connection identity and revocation/suspension flows.
- [ ] Inspect existing server-side billing/payment functions, scheduled jobs, wallet/top-up capabilities, audit trail, and Firestore rules/indexes.
- [ ] Identify exact files and functions likely to change, data migration needs, backward compatibility risks, and production safety boundaries.
- [ ] Verify whether `storeWallets`, `billingLedger`, and `topUpCodes` already exist; do not create parallel sources of truth.
- [ ] Report evidence, first failure, root cause (if any), gaps, risks, and proposed surgical scope. No edits, deployments, or live-data changes in this gate.

### GATE 2 — Technical design and acceptance contract

- [ ] Produce an implementation design grounded in the actual source: data model, server-authoritative charge operation, idempotency key, daily billing boundary, ledger invariants, top-up code lifecycle, access lock/recovery precedence, security rules, indexes, observability and rollback.
- [ ] Specify concurrency behavior for simultaneous daily charge, owner device removal, top-up redemption, and retries.
- [ ] Define the complete 13-case test matrix with expected outcomes and evidence requirements. TC-BAL-04 is already registered but remains `NOT RUN`.
- [ ] Include emulator/staging-only test strategy; no production test transactions or real deductions.
- [ ] Resolve any contract/source conflict with the PO before proceeding.

### GATE 3 — Separate execution authorization

Request an explicit PO authorization after Gates 1 and 2 have evidence. The request must state:
- exact application repository, branch, and approved files/scope;
- whether Firestore schema/rules/index changes are included;
- whether staging deployment is included;
- explicit production exclusion unless separately authorized;
- tests, build/device verification, rollback, and evidence plan.

Until that separate authorization is recorded, the implementation agent must remain read-only.

### GATE 4 — Authorized implementation (future only)

Only after explicit execution authorization:
1. Make the smallest approved code changes on a dedicated branch; never edit the locked baseline directly.
2. Implement server-authoritative, tenant-scoped, idempotent billing and immutable ledger behavior.
3. Implement Option A and status-precedence rules without bypassing revocation/suspension.
4. Add and run unit, emulator/integration, security, concurrency, and billing-boundary tests.
5. Run analyzer/build and staging-only verification as authorized.
6. Capture diffs, test outputs, commit/PR, deployment evidence if authorized, and rollback instructions.
7. Stop at first failure; do not silently expand scope.

### GATE 5 — PO acceptance and closeout (future only)

- [ ] PO verifies the approved acceptance scenarios against evidence.
- [ ] All 13 test cases have truthful statuses; no test is marked PASS without execution evidence.
- [ ] Update traceability, evidence catalog, risk register, and decision/status records.
- [ ] Only after PO verification may the Work Item be considered for `PO_VERIFIED / PROTECTED / LOCKED`.

## 5. Current blockers

- Execution authorization has not been granted.
- Official application-source READ-FIRST / forensic evidence has not been collected as part of this execution-gate plan.
- Technical architecture, exact file list, and migration impact must be established from the official application repository; they must not be guessed from this Governance repository.
- TC-BAL-04 and the other planned cases have not been executed.

## 6. Current verdict

`CR APPROVED` / `EXECUTION GATE PREPARATION` / `APPLICATION AND FIREBASE CHANGES NOT AUTHORIZED`.

Next permitted activity: read-only READ-FIRST / forensic and technical-design preparation. No application edits, Firebase edits, deployment, or production operations are authorized by this plan.
