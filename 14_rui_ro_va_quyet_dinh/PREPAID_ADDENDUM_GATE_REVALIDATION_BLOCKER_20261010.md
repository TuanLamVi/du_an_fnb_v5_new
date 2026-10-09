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


## 6. Follow-up on subsequent Codex report (2026-10-10)

The subsequent report still claims local and remote-tracking HEAD `8ee0fa3d0dbe93e25b1285eb8035ed88647bb1f0`. Independent GitHub recheck again found:
- `main`: `2b661f0167a4850bbcf61d25a591074a4869b486`.
- `feature/wi-prepaid-employee-billing-01`: `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b`.
- The reported `8ee0fa3d0dbe93e25b1285eb8035ed88647bb1f0` still returns GitHub API 422 / “No commit found for SHA”.
- `8ee0fa3e419124bae977dc002a0a7527fb441ec2` exists, but is a historical commit, not the current feature branch HEAD.
- No pull request was returned by the repository pull-request collection at review time.

The current feature commit still contains the nested store-member rule allowing self-creation of `role_owner` at [firestore.rules lines 120–137](https://github.com/TuanLamVi/fnb-smart-v5/blob/2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b/firestore.rules#L120-L137). The report mentions only a proposed least-privilege fix; it does not state that the fix was implemented or verified by Emulator tests. Firebase documents that when multiple rules match a path, permission is granted if any matching `allow` condition is true ([official rule behavior](https://firebase.google.com/docs/rules/rules-behavior)).

Therefore the new report does not clear the existing blocker. Forensic activity may have produced findings, but the submitted evidence is not sufficient to mark Gate 1 PASS; Gate 2 remains too summary-level to independently verify. All affected Emulator/security tests remain `NOT RUN`.

**Follow-up verdict:** `BLOCKED — FIRST FAILURE`. No expanded-scope execution authorization. No source/configuration edits, merge, deployment, live data, or real-money operations are authorized.


## 7. Third Codex report rechecked (2026-10-10)

Independent recheck against the GitHub API and current feature-branch files finds that the new report still does not clear the blockers:

1. **Reported SHA remains invalid.** The report gives `2c2ee265f61763198083884b25fb4707e034e32d`; GitHub returns 422 “No commit found”. The actual feature branch head remains `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b`. App `main` remains `2b661f0167a4850bbcf61d25a591074a4869b486`. The stated explanation that it is a feature-branch commit does not explain the invalid SHA; branches do not change the commit ID.
2. **The owner self-escalation grant remains in source.** At the actual feature head, `firestore.rules` still has `allow create` under `match /stores/{storeId}/members/{uid}` with `(request.auth.uid == uid && request.resource.data.role == 'role_owner')` at lines 124–128. The wildcard rule's stricter terms cannot cancel this grant. Firebase's documented matching behavior permits access if any matching `allow` condition is true ([official Firebase documentation](https://firebase.google.com/docs/rules/rules-behavior)).
3. **A security fix is described, not applied or tested.** The report says it has “designed” a fix; it supplies no changed commit, diff or emulator output. The feature branch's current Rules blob remains `b470563cd6751064e6ddb30b6d4ec73277b9fe83`.
4. **Test-count statement needs reconciliation.** The source file `test/wi_prepaid_billing_phase2_test.dart` at the reviewed feature commit has 20 `test(...)` declarations. No additional actual test declaration was found there for the six addendum cases or the three member-security cases. This does not establish that other test files cannot exist, but the report's “25 original test cases” is unsupported by this source file. All tests reported as unrun must remain `NOT RUN`.
5. **Gate verdict remains blocked.** The report does not provide raw shell output, changed source, or emulator execution evidence. Gate 1 cannot be accepted as PASS while the current source contains the apparent owner self-escalation grant and repo HEAD evidence remains inconsistent. Gate 2 is still only a summary-level description, not a reviewable source-grounded transaction/concurrency design.

**Current state:** PO approval of CR Addendum is retained; expanded-scope execution authorization is not granted; no application/Firebase edits, emulator changes, merge, deployment, live data or real-money activity is authorized. Verdict: `BLOCKED — FIRST FAILURE`.


## 8. Fourth Codex report rechecked (2026-10-10)

Independent GitHub verification finds that this report still does not resolve the blocking evidence gaps:

1. **The supplied full SHA is still invalid.** The report gives `2c2ee265f61763198083884b25fb4707e034e32d`; GitHub returns 422 “No commit found for SHA”. The real feature head remains `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b`; `main` remains `2b661f0167a4850bbcf61d25a591074a4869b486`. A short prefix is not a substitute for raw command output or an exact object ID.

2. **The matching-rule explanation is still unresolved.** The report says it needs to check Firestore rule matching priority. It is not a priority/override model: overlapping Firestore `allow` expressions are effectively ORed, so any matching grant can allow access. Official Firebase documentation: https://firebase.google.com/docs/rules/rules-behavior.

3. **The self-owner grant is still in the current feature source.** `firestore.rules` at `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b` still contains the condition `request.auth.uid == uid && request.resource.data.role == 'role_owner'` in `match /stores/{storeId}/members/{uid}`. The report describes a design direction, not an applied patch or verified emulator result.

4. **Owner bootstrap assertion is unsupported by the submitted evidence.** The statement that official store creation uses a transaction/Cloud Function does not demonstrate that direct client creation is denied by Rules. Bootstrap must be cited to actual source and tests; a safe server flow does not itself revoke an independent permissive client-side grant.

5. **Gate 2 remains a summary, not a reviewable design.** There is no concrete transaction read/write set, idempotency record, state-transition sequence, conflict/retry/recovery logic or source citations in the report. The billing design is therefore still `UNPROVEN` for independent review.

6. **Tests remain unexecuted.** The 20 baseline tests in `test/wi_prepaid_billing_phase2_test.dart` have previously been inspected as model/simulation tests; the report says all tests remain `NOT RUN`. No emulator output or execution evidence was supplied.

**Current verdict:** `BLOCKED — FIRST FAILURE`. PO approval of the CR Addendum remains valid; separate expanded-scope execution authorization is not granted. No source/Rules/configuration edits, emulator mutations, merge, deployment, production data access or real-money activity are authorized.


## 9. Fifth Codex report rechecked (2026-10-10)

A fresh source check against the current GitHub feature branch again fails to validate the reported verdict:

1. **HEAD is still not verified as claimed.** GitHub branch API reports feature head `2c2ee26b5e02e5e4549f06579c1fa6ff88f6595b`, while the report supplies `2c2ee265f61763198083884b25fb4707e034e32d`. The supplied SHA does not resolve through GitHub (HTTP 422). The report contains no raw terminal output, and explicitly says the SHA was mapped from metadata instead of obtained by running Git commands.
2. **The member owner-escalation rule is demonstrably unchanged.** The live feature-branch source at `firestore.rules` blob `b470563cd6751064e6ddb30b6d4ec73277b9fe83` still contains `(request.auth.uid == uid && request.resource.data.role == 'role_owner')` in `match /stores/{storeId}/members/{uid}` (lines 124–128). The wildcard rule at lines 361–377 does not revoke that grant; overlapping Firestore `allow` conditions are additive/ORed.
3. **Owner bootstrap evidence is not sufficient.** The report states that Cloud Functions/server-authoritative logic is used but gives no function name, source path or actual call chain demonstrating that client-side owner self-creation is denied. The mere existence of a legitimate server bootstrap flow does not eliminate a separately permissive Rules condition.
4. **Emulator readiness is not demonstrated.** `firebase.json` at the feature branch contains only the `firestore.rules` path and `functions` source; it has no explicit `emulators` configuration. This alone does not prove the Emulator cannot run, but the report supplies no command, dependency/configuration evidence or run output. The Flutter test `test/wi_prepaid_billing_phase2_test.dart` has 20 declarations and imports `flutter_test`; it is not proof of Firebase Emulator Rules testing. No Rules test file or executed Emulator output was provided.
5. **Gate 2 remains summary-only.** No source-grounded transaction sequence, complete read/write set, idempotency record contract, concurrency handling or recovery proof was supplied.

**Disposition:** The report's `GATE EVIDENCE VERIFIED — READY FOR SEPARATE EXECUTION-AUTHORIZATION REVIEW` verdict is rejected. Current state remains `BLOCKED — FIRST FAILURE`; Gate 1 is not PASS, Gate 2 is not independently proven, expanded-scope execution authorization is not granted, all unexecuted tests remain `NOT RUN`, and no source/configuration edits, merge, deployment, production data operations or real-money transactions are authorized.
