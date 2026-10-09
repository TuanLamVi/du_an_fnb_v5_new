# PREPAID BILLING ADDENDUM — GATE REVALIDATION BLOCKER

- **Date:** 2026-10-10 (Vietnam time, UTC+7)
- **Work Item:** `WI-PREPAID-EMPLOYEE-BILLING-01`
- **CR Addendum:** `CR-PREPAID-BILLING-01-ADD-01`
- **Related PO approval:** [DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md](https://github.com/TuanLamVi/du_an_fnb_v5_new/blob/main/14_rui_ro_loi_thay_doi_quyet_dinh/DECISION_PREPAID_BILLING_ADDENDUM_APPROVAL.md)
- **Review type:** Independent read-only source revalidation
- **Application source reviewed:** [feature/wi-prepaid-employee-billing-01](https://github.com/TuanLamVi/fnb-smart-v5/tree/feature/wi-prepaid-employee-billing-01)
- **Source reviewed at:** `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b`
- **Gate verdict:** `BLOCKED — DO NOT GRANT EXPANDED-SCOPE EXECUTION AUTHORIZATION YET`
- **Production:** `NOT AUTHORIZED`

## 1. Repository / HEAD discrepancy

GitHub branch metadata rechecked on 2026-10-10:
- App `main`: `2b661f0167a4850bbcf61d25a591074a4869b486` — [commit](https://github.com/TuanLamVi/fnb-smart-v5/commit/2b661f0167a4850bbcf61d25a591074a4869b486).
- App `feature/wi-prepaid-employee-billing-01`: `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b` — [commit](https://github.com/TuanLamVi/fnb-smart-v5/commit/2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b).
- Reported local SHA `8ee0fa3d0dbe93e25b1285eb8035ed88647bb1f0` could not be resolved by GitHub (API returned no commit for that SHA).
- The nearby real commit is `8ee0fa3e419124bae977dc002a0a7527fb441ec2`, which is the parent of the feature head; it is not the current feature branch head.
- Therefore the report's claim that local `main` and remote-tracking `origin/feature/wi-prepaid-employee-billing-01` share the reported HEAD is **not independently verified**. Codex must report exact local branch, full `git rev-parse HEAD`, `git status --short --branch`, and remote branch SHA without abbreviating or substituting one for another.

## 2. Firestore Rules security blocker

At feature commit `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b`, `firestore.rules` includes this specific nested rule in `match /stores/{storeId}/members/{uid}`:

```rules
allow create: if isAuthenticated() && (
  (request.auth.uid == uid && request.resource.data.status == 'pending') ||
  (request.auth.uid == uid && request.resource.data.role == 'role_owner') ||
  isStoreActiveOwner(storeId)
);
```

The condition `request.auth.uid == uid && request.resource.data.role == 'role_owner'` appears to let a user create their own membership with the owner role without proving existing owner authority. Firestore Rules allow access when any matching `allow` expression grants it; the broader wildcard member rule cannot revoke this specific grant. This contradicts the report's unqualified claim that member rules satisfy least privilege.

**Required disposition:** Gate 1 cannot be recorded PASS until the exact intended store bootstrap/owner-creation flow and rule semantics are verified against the architecture/security contract and an Emulator security test proves a non-owner cannot self-assign owner. This record does not authorize fixing the rule; implementation remains blocked by the execution-authorization boundary.

Evidence: [firestore.rules at reviewed feature commit](https://github.com/TuanLamVi/fnb-smart-v5/blob/2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b/firestore.rules#L120-L137).

## 3. Gate 2 evidence quality

The submitted report describes the proposed transaction and idempotency design only at summary level. It does not provide a source-grounded sequence, exact function/transaction boundary, stable idempotency record schema, transaction read/write set, retry behavior, or a concurrency matrix for daily deduction versus device enrollment/removal/top-up/recovery. Those items remain **unproven from the submitted report**; no tests should be inferred from the design statement.

The 26 test cases being `NOT RUN` is correctly reported. A case list alone is not execution evidence.

## 4. Required next steps (READ-ONLY)

1. Reconcile local branch/HEAD/worktree to the actual GitHub branch heads.
2. Re-open the full relevant member and device-connection rules, enumerate all overlapping `match` blocks, and identify every alternative grant.
3. Confirm exact source paths, functions, wallet/ledger/device data paths and the actual owner bootstrap workflow.
4. Document the incremental charge transaction, idempotency key/record, transaction conflict/retry strategy, activation/recovery consistency, and all daily-billing race cases.
5. Define concrete Emulator security/integration tests for owner self-escalation, tenant isolation, duplicate charges and pending/revoked/suspended/rejected status precedence.
6. Keep all tests `NOT RUN` until they actually execute and provide logs.

## 5. Execution and deployment boundary

- PO CR Addendum approval: `APPROVED`.
- Expanded-scope execution authorization: `NOT GRANTED`.
- Application source, Firestore Rules/configuration, schema and staging/emulator changes for this expanded behavior: do not edit until Gate 1/Gate 2 evidence is resolved and separate execution authorization is granted/confirmed.
- Production, live data, real-money deductions, deployment and merge to `main`: `NOT AUTHORIZED`.

**Current verdict:** `GATE 1 NOT PASS / GATE 2 NOT YET PROVEN — BLOCKED`.
