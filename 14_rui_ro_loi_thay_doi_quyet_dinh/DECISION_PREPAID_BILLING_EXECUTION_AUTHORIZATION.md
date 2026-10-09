# DECISION — WI-PREPAID-EMPLOYEE-BILLING-01 — EXECUTION AUTHORIZATION

- **Decision ID:** DEC-PREPAID-BILLING-01-EXEC-AUTH
- **Work Item:** WI-PREPAID-EMPLOYEE-BILLING-01
- **Change Request:** CR-PREPAID-BILLING-01
- **Decision maker:** Tuấn — Chủ đầu tư / Product Owner (PO)
- **Decision date:** 2026-10-09 (Vietnam time, UTC+7)
- **Decision source:** Explicit PO instruction in the ChatGPT project coordination conversation on 2026-10-09.
- **Governance repository:** https://github.com/TuanLamVi/du_an_fnb_v5_new
- **Application repository:** https://github.com/TuanLamVi/fnb-smart-v5

## 1. PO decision

Tuấn explicitly approves implementation of WI-PREPAID-EMPLOYEE-BILLING-01 and grants execution authorization within the bounded scope below. This is separate from, and in addition to, the previously recorded CR approval.

## 2. Authorized scope

- Implement prepaid wallet and employee-device daily billing according to the approved Option A requirements.
- Work only on a dedicated application branch based on the official application repository and current HEAD; do not edit the protected V5.1 baseline directly.
- Code changes, tests, and Firebase Emulator / staging-only configuration or deployment may be performed only when required by the verified technical design and only within the approved Work Item.
- Codex must complete and record source-grounded Gate 1 forensic verification and Gate 2 technical design/acceptance contract before the first application/Firebase change. These gates are mandatory preconditions within the authorized work sequence, not waived by this decision.
- If a gate fails, required source cannot be read, a contract conflict appears, worktree changes cannot be safely preserved, or scope expands, stop at first failure and report evidence to the PO. Do not proceed by guessing.
- No production deployment, production Firestore/rules/schema mutation, real-money deduction, live-data migration, or production transaction is authorized by this decision. Any production activity requires a separate explicit PO authorization.

## 3. Business rules that must be preserved

1. Charge 3,000 VND per maintained staff-device connection per Vietnam billing day.
2. Server device is free under the current policy; do not describe this as permanently free.
3. Billing boundary is 00:00 Vietnam time (UTC+7).
4. Option A on insufficient balance: do not deduct a partial amount; preserve balance and lock all staff devices; the owner chooses devices to retain.
5. When the owner removes devices before the current day's fee has been collected, charge only for remaining devices if balance is sufficient, then enable those devices through the end of that billing day.
6. Do not double-charge a store for the same billing day. Do not automatically refund after a daily fee was collected.
7. Recovery may clear `locked_insufficient_balance` only; preserve `revoked` and `suspended`.
8. Trial ends after 100 commercial orders. Exclude five test orders only in a server-controlled isolated test environment.
9. Warn when available wallet balance covers no more than three days.
10. Do not retroactively charge missed downtime days without a trustworthy snapshot.
11. Preserve tenant isolation, server authority, idempotency, immutable ledger, one-time top-up codes, anti-replay/rate limiting, and the 400-operation batch-write cap.
12. Verify the actual app architecture and existing data capabilities before introducing any collection or parallel source of truth.

## 4. Required execution and evidence

- Preserve existing dirty/untracked files; inspect and report them before making changes. Do not discard or overwrite unrelated user work.
- Produce a source-grounded technical design and exact scope before edits.
- Run relevant unit, emulator/integration, security, concurrency, and billing-boundary tests; keep all 13 acceptance cases truthfully marked until evidence exists.
- Run Flutter/Dart analysis and the applicable build checks.
- Validate only on emulator/staging and approved test devices; do not use production data or real funds.
- Use the project's First Failure Stop, Git safety, and evidence/reporting rules.
- Do not mark the Work Item `PO_VERIFIED`, `PROTECTED`, or `LOCKED`; those require subsequent PO acceptance against evidence.

## 5. Current authorization state

- CR approval: `APPROVED`.
- PO execution authorization: `GRANTED — STAGING/TEST ONLY, CONDITIONAL ON GATE 1 AND GATE 2 VERIFICATION`.
- Production: `NOT AUTHORIZED`.
- Implementation/tests: not claimed complete; results must be reported from actual execution.

This record documents the PO's authorization and scope. It is not evidence that Codex has started, that code has changed, or that any test/build/deployment has passed.
