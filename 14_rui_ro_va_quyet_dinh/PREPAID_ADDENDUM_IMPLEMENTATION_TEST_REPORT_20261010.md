# IMPLEMENTATION & ISOLATED CI/EMULATOR TEST REPORT — PREPAID BILLING ADDENDUM

- **Date:** 2026-10-10 (Vietnam time, UTC+7)
- **Work Item:** `WI-PREPAID-EMPLOYEE-BILLING-01`
- **CR Addendum:** `CR-PREPAID-BILLING-01-ADD-01` — PO approved
- **Execution Authorization:** `DEC-PREPAID-BILLING-ADD-EXEC-01` — feature branch / isolated tests only
- **Application repository:** https://github.com/TuanLamVi/fnb-smart-v5
- **Verified feature HEAD:** `1148d34ac31a0fc232abe15a3d605950f10d5afd`
- **Verified main HEAD:** `2b661f0167a4850bbcf61d25a591074a4869b486`
- **CI run:** [GitHub Actions run 37975267702 — SUCCESS](https://github.com/TuanLamVi/fnb-smart-v5/actions/runs/37975267702)
- **Draft review:** [PR #1 — OPEN / DRAFT / NOT MERGED](https://github.com/TuanLamVi/fnb-smart-v5/pull/1)

## 1. Work performed in this session

The feature branch already contained the server-authoritative incremental billing callable and member/device security rules. During this session, the existing CI failure was reproduced from its logs and corrected on the feature branch:

1. Commit [e4d44a1](https://github.com/TuanLamVi/fnb-smart-v5/commit/e4d44a194c5f2468af56a2bbfe7ad82748a3135c) removes a stale import of the nonexistent `DeviceConnectionModel` and keeps the recovery status test explicitly scoped as a model/simulation test.
2. Commit [67d17c3](https://github.com/TuanLamVi/fnb-smart-v5/commit/67d17c327c4f77ca6d9a9eb56bfd08ccc250080e) includes the prepaid simulation test in CI path filters and guards optional lockfile staging when a previous step was skipped.
3. CI commit [43909e4](https://github.com/TuanLamVi/fnb-smart-v5/commit/43909e414ec4dfca5e39f9000d8e15c543dbd05d) persisted resolved dependency lockfiles on the dedicated feature branch.
4. Commit [1148d34](https://github.com/TuanLamVi/fnb-smart-v5/commit/1148d34ac31a0fc232abe15a3d605950f10d5afd) ensures the lockfile persistence step runs only for `push` events, so a pull-request validation run cannot push a merge-ref commit back to the feature branch.

No application changes were made to `main`. The push CI run uses the isolated Firebase demo project `demo-prepaid-billing`; no production or customer data was used.

## 2. Implementation evidence reviewed

- `functions/index.js`: `activateStaffDeviceConnectionServer` performs owner verification, validates an active non-owner staff membership, charges 3,000 VND, creates a deterministic idempotent ledger record, and activates the pending connection in a Firestore transaction. If the wallet cannot cover the fee, it performs no writes and leaves the connection pending.
- `functions/index.js`: `processDailyDeductionInternal` excludes connections whose `lastBilledDate` is the current Vietnam billing date, preventing the same-day incremental fee from being charged again by base daily billing.
- `firestore.rules`: direct client-side activation and client-side writes to wallet/ledger billing fields are denied. Member creation allows only a constrained pending staff request, an owner bootstrap bound to the same atomic batch creating a new store with matching `createdBy`/`ownerUid`, or an already-authorized store owner. Wildcard member rules are also constrained.
- `security-tests/firestore_rules.test.mjs`: covers owner self-escalation, restricted role/status changes, legitimate owner bootstrap, device connection creation/activation restrictions, and tenant-isolated device access.
- `security-tests/prepaid_billing.integration.test.mjs`: covers `TC-LATE-DEVICE-15` through `TC-LATE-DEVICE-20`.

## 3. Verified CI results

Run: [37975267702](https://github.com/TuanLamVi/fnb-smart-v5/actions/runs/37975267702), head `1148d34ac31a0fc232abe15a3d605950f10d5afd`, overall conclusion `SUCCESS`.

| Check | Result | Evidence |
|---|---:|---|
| Cloud Functions JavaScript syntax (`npm run lint`, `node --check index.js`) | PASS | CI step exit success |
| Flutter analyze of the scoped device/wallet files | PASS | CI step exit success; 2 informational lint findings are non-fatal under `--no-fatal-infos` |
| `test/wi_prepaid_billing_phase2_test.dart` model/simulation tests | 20/20 PASS | Log: “20 tests passed.” |
| Firestore Rules Emulator tests | 17/17 PASS | Node test summary: `# tests 17; # pass 17; # fail 0` |
| Prepaid billing Functions/Firestore Emulator integration tests | 6/6 PASS | Node test summary: `# tests 6; # pass 6; # fail 0` |
| Overall CI | PASS | [Run summary](https://github.com/TuanLamVi/fnb-smart-v5/actions/runs/37975267702) |

The 20 Flutter cases are model/simulation tests; they are not described as emulator integration tests. The separate 17 Rules and 6 integration tests are actual Firebase Emulator runs using isolated demo data.

## 4. Change-control and deployment boundary

- PO CR Addendum approval: `APPROVED`.
- Bounded expanded-scope execution authorization: `GRANTED` by `DEC-PREPAID-BILLING-ADD-EXEC-01`.
- Implementation branch: `feature/wi-prepaid-employee-billing-01`.
- Current branch HEAD: `1148d34ac31a0fc232abe15a3d605950f10d5afd`.
- `main` remains `2b661f0167a4850bbcf61d25a591074a4869b486` and was not modified by this work.
- PR #1 remains `OPEN / DRAFT / NOT MERGED`.
- Production deployment, production Firebase mutations, live data, real-money transactions and merge to `main`: `NOT AUTHORIZED`.
- Work Item acceptance/closeout: still requires PO review of evidence and PO acceptance. Do not mark `PO_VERIFIED / PROTECTED / LOCKED` based only on CI success.

## 5. Current verdict

`FEATURE IMPLEMENTATION PRESENT / TARGETED CI AND EMULATOR TESTS PASS / READY FOR PO REVIEW — DRAFT PR ONLY / DO NOT MERGE OR DEPLOY TO PRODUCTION`.
