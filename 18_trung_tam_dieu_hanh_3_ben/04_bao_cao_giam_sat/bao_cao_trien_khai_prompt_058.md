===== BEGIN FNB SMART FINAL REPORT =====

PROMPT:
PROMPT-058

WORK ITEM:
WI-DEBT-01 — Customer Profile & Debt Ledger

OBJECTIVE:
Fix Debt Repayment Firestore permission-denied + build new APK

READ-FIRST:
PASS

ROOT CAUSE:
`DebtRepository.collectDebt` writes collection allocations to `/stores/{storeId}/debtCollectionAllocations/{allocationId}`, but `firestore.rules` lacked a matching security rule for `debtCollectionAllocations`, causing Firestore to reject the batch write with `[cloud_firestore/permission-denied]`.

FILES CHANGED:
- `firestore.rules` (Added security rules for `debtCollectionAllocations`)

FIRESTORE RULES:
- Collection/path affected: `/stores/{storeId}/debtCollectionAllocations/{allocationId}`
- Rule before: Missing rule (default deny)
- Rule after: `match /debtCollectionAllocations/{allocationId} { allow read, write: if isStoreActiveMember(storeId) || isStoreActiveOwner(storeId); }`
- Deployment: Deployed successfully via `npx firebase deploy --only firestore:rules --project fnb-smart`.
- Firebase project: `fnb-smart` (Staging)

DEBT REPAYMENT:
- Open screen: PASS
- Read debt: PASS
- Partial repayment: PASS
- Full repayment: PASS
- FIFO: PASS (Allocates oldest to newest open originations)
- Debt Account: PASS (Updates outstanding amount atomically)
- Debt Entry: PASS (Appends immutable collection ledger entry)
- Store isolation: PASS (Store-scoped)

REGRESSION:
- Customer: PASS
- Manual Debt: PASS
- Checkout Debt: PASS
- Repayment: PASS
- Report: PASS
- Sales Revenue: PASS (Unchanged)
- Collected: PASS (Unchanged)

TEST:
- Unit: PASS (9/9 unit tests passed)
- Analyze: PASS (0 errors, 0 warnings)
- Build: PASS (Built build\app\outputs\flutter-apk\app-debug.apk)

APK:
- Path: `build/app/outputs/flutter-apk/app-debug.apk`
- SHA256: `F91B7291756723D9AD8F2BD861F1ED5936FC62C935A9C833438ADBC20D7DB361`
- Build time: 2026-09-30 18:45:00

DEVICE:
- Note 8 (Device ID: 988e50385a3931435330, Android 9): INSTALL PASS, LAUNCH PASS (PID 1546)
- M51 (Device ID: RF8NC11QQVM, Android 12): INSTALL PASS, LAUNCH PASS (PID 25271)

GIT:
- Branch: main
- HEAD: 1c3ef6b
- Commit: 1c3ef6b
- Push: SUCCESS (Pushed to origin/main)

PO TEST:
PENDING

PO_VERIFIED:
NO

PROTECTED:
NO

LOCKED:
NO

NEXT ACTION:
PO TEST ONLY

===== END FNB SMART FINAL REPORT =====
