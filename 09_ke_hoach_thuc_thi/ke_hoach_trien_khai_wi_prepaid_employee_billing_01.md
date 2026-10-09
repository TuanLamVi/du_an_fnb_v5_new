# KẾ HOẠCH CỔNG THỰC THI — WI-PREPAID-EMPLOYEE-BILLING-01

## 1. Trạng thái quản trị

- Work Item: `WI-PREPAID-EMPLOYEE-BILLING-01`
- Change Request: `CR-PREPAID-BILLING-01`
- Decision: `DEC-PREPAID-BILLING-01`
- CR: `APPROVED BY PO — 2026-10-09`
- Execution Authorization: `PO GRANTED — STAGING/TEST ONLY, CONDITIONAL ON GATE 1 AND GATE 2 VERIFICATION — 2026-10-09`
- Work Item status: `AUTHORIZED FOR GATED STAGING IMPLEMENTATION`
- Application source changes: `AUTHORIZED ONLY AFTER GATE 1 FORENSIC AND GATE 2 TECHNICAL DESIGN ARE VERIFIED`
- Firebase Emulator / staging changes: `AUTHORIZED ONLY WITHIN VERIFIED SCOPE`
- Production / live-data changes: `NOT AUTHORIZED`
- PO authorization record: `14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_PREPAID_BILLING_EXECUTION_AUTHORIZATION.md`
- Tests: all planned tests remain `NOT RUN` until executed and evidence is recorded.

The PO has now separately authorized the bounded staging/test implementation scope in the decision record referenced above. This does not waive Gate 1 or Gate 2: Codex must complete and record both before the first source/configuration change. Production deployment, production Firestore/rules/schema mutation, live-data migration, real-money deductions, and production transactions remain explicitly unauthorized.

## 2. Official target and repository boundary

- Governance repository: `TuanLamVi/du_an_fnb_v5_new`, branch `main`.
- Official application repository for this PO-authorized, gated staging/test work: `TuanLamVi/fnb-smart-v5`.
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
- [x] Execution authorization recorded separately from CR approval, with staging/test-only scope and production explicitly excluded.

### GATE 1 — Application READ-FIRST / forensic (read-only)

Must be completed and evidenced before the first implementation change; the PO authorization does not waive these prerequisites:
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

### GATE 3 — PO execution authorization (recorded)

- [x] Explicit PO authorization recorded on 2026-10-09 in `14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_PREPAID_BILLING_EXECUTION_AUTHORIZATION.md`.
- [x] Scope is limited to the official application repository, a dedicated branch, and emulator/staging/test verification.
- [x] Production and live-data operations are explicitly excluded.
- [ ] Codex must verify and record Gate 1 and Gate 2 evidence before the first application/Firebase change.

If Gate 1 or Gate 2 fails, stop at first failure and report; do not edit or guess.

### GATE 4 — Authorized staging/test implementation

The PO has granted bounded authorization, effective for code/configuration edits only after Gate 1 and Gate 2 are completed and evidenced. Then:
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

- Gate 1 evidence and Gate 2 design must be explicitly recorded by Codex before any application/Firebase edits; the prior forensic summary alone is not a substitute for source-grounded evidence.
- Technical architecture, exact file list, migration impact, and existing wallet/ledger/top-up capabilities must be established from the official application repository.
- TC-BAL-04 and the other planned cases remain `NOT RUN` until actually executed with evidence.
- Production remains outside the authorization.

## 6. Current verdict

`CR APPROVED` / `PO EXECUTION AUTHORIZATION RECORDED — STAGING/TEST ONLY` / `GATE 1 AND GATE 2 REQUIRED BEFORE FIRST EDIT` / `PRODUCTION NOT AUTHORIZED`.

Next permitted activity: Codex performs source-grounded Gate 1 verification and Gate 2 technical design, then proceeds with the smallest approved implementation on a dedicated branch only if both gates pass. No production operations are authorized.


---

## 7. ADDENDUM — PO BUSINESS POLICY DECISION FOR SAME-DAY NEW DEVICE ACTIVATION (2026-10-10)

- **Decision record:** [DECISION_PREPAID_BILLING_LATE_DEVICE_ACTIVATION_POLICY.md](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_PREPAID_BILLING_LATE_DEVICE_ACTIVATION_POLICY.md)
- **Business policy status:** `PO_APPROVED` for the policy described in the linked decision record.
- **CR revision/addendum for expanded implementation scope:** `PO APPROVED — 2026-10-10`, see `DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md`.
- **Execution authorization for expanded scope:** `NOT GRANTED`; required Gate 1/Gate 2 evidence and separate scope authorization remain prerequisites.
- **Production:** `NOT AUTHORIZED`.
- **Work Item status:** `BLOCKED — DO NOT MERGE` because expanded-scope Gate 1/Gate 2 evidence, separate execution authorization, security/concurrency verification, and acceptance test execution remain incomplete. The CR addendum itself is PO-approved.

### Approved business behavior

For an eligible staff-device connection added after the 00:00 Asia/Ho_Chi_Minh billing boundary, the server must collect an additional 3,000 VND for the current Vietnam billing day before activating that connection. If the wallet cannot cover the incremental fee, no partial amount is deducted; only the new connection remains non-active/pending, while previously paid active connections remain active. Each charge must be idempotent per store, Vietnam billing date, and connection identity. The base daily billing flow and incremental activation flow must coordinate so a connection is never omitted or charged twice. The existing owner/server-device exclusion remains in force.

### Required acceptance scenarios for the CR revision

Add and keep the following cases `NOT RUN` until execution evidence is recorded:

- `TC-LATE-DEVICE-15`: Successful same-day incremental charge and activation after the base daily fee has been collected.
- `TC-LATE-DEVICE-16`: Insufficient wallet balance leaves the new connection pending without disabling previously paid active connections.
- `TC-LATE-DEVICE-17`: Concurrent/repeated activation for the same connection/date cannot double-charge.
- `TC-LATE-DEVICE-18`: Connection arrives while base daily billing is pending or recovering; retries preserve consistency without omission, unpaid activation, or duplicate charge.
- `TC-LATE-DEVICE-19`: `pending`, `revoked`, `suspended`, and `rejected` states remain protected from unintended charge/activation.
- `TC-LATE-DEVICE-20`: The following day's normal daily fee includes an eligible activated connection according to the established billing policy.

### Governance and execution boundary

This addendum records the PO's business-policy choice and change-control approval without rewriting the historical status of the original CR or original bounded authorization. `CR-PREPAID-BILLING-01-ADD-01` was explicitly approved by the PO on 2026-10-10; the approval is recorded in `DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md`. No application source, Firebase Rules, configuration, staging/emulator mutation, deployment, or production data operation for the expanded behavior may proceed until source-grounded Gate 1 and Gate 2 evidence is verified and separate execution authorization for this expanded scope is granted/confirmed. Do not mark any test `PASS` without actual execution logs. Do not mark the Work Item `PO_VERIFIED / PROTECTED / LOCKED` before PO acceptance.


## 8. Change-control follow-up after PO policy decision

- PO business-policy decision recorded at [DEC-PREPAID-BILLING-LATE-DEVICE-01](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_PREPAID_BILLING_LATE_DEVICE_ACTIVATION_POLICY.md).
- The implementation change is tracked by [CR-PREPAID-BILLING-01-ADD-01](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/13_quan_ly_thay_doi/CR-PREPAID-BILLING-01-ADDENDUM-01.md), now `PO APPROVED — 2026-10-10`; see [decision record](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md).
- CR approval does not grant execution authorization for the expanded scope.
- Before edits, complete and evidence Gate 1 and Gate 2 specifically for the incremental same-day charge/activation behavior. The six cases TC-LATE-DEVICE-15 through TC-LATE-DEVICE-20 remain `NOT RUN` until executed with evidence.
- Current verdict remains `BLOCKED — DO NOT MERGE`; expanded-scope execution authorization is not granted; production remains `NOT AUTHORIZED`.
