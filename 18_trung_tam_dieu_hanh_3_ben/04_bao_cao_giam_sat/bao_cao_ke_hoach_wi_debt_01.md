===== BÁO CÁO LẬP KẾ HOẠCH TRIỂN KHAI WI-DEBT-01 =====

WORK ITEM:
WI-DEBT-01 / A8 — Customer Profile & Debt Ledger (Sổ nợ & Hồ sơ khách hàng)

READ-FIRST:
PASS

AUTHORITATIVE SOURCES:
- CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md (§17 Customer & Debt Ledger)
- CUSTOMER_LOYALTY_DISCOVERY_V5.1.md (Prompt 107 Final Boundary)
- DATABASE_SCHEMA_V0.1.md (§2.6 & §10 Debt Ledger)
- FIRESTORE_QUERY_COST_BUDGET_V0.1.md (§3.3)
- STATE_MACHINES_V0.1.md (§10)

OFFICIAL SCOPE:
- Customer Profile Management (`/stores/{storeId}/customers/{customerId}`)
- Debt Account & Balance Tracking (`/stores/{storeId}/debtAccounts/{customerId}`)
- Debt Origination on Checkout (`/stores/{storeId}/debtOriginations/{originationId}`)
- Debt Collection & FIFO Allocation (`/stores/{storeId}/debtCollections/{collectionId}`)
- Debt Ledger / Entry Audit (`/stores/{storeId}/debtEntries/{debtEntryId}`)

CHECKOUT → DEBT FLOW:
- Invoice Checkout → Select "Ghi nợ (Debt Lite)" → Lookup/Create Customer by phone → Create DebtOrigination & update DebtAccount → Record Settlement method `debt`.

SECURITY:
- Explicit capabilities: `manage_debt`, `view_customer_debt`, `repay_debt`. Store-scoped data isolation.

STATE MACHINES:
- Debt allocation (`SET_DEBT_{mutationId}`), FIFO consumption on collection.

FIRESTORE PATHS:
- `/stores/{storeId}/customers`, `/debtAccounts`, `/debtOriginations`, `/debtCollections`, `debtCollectionAllocations`, `debtEntries`.

DEPENDENCIES:
- WI-AUTH-01 (LOCKED), WI-SETUP-01 (LOCKED), WI-TABLE-01/POS-01 (LOCKED), WI-KDS-01 (LOCKED), WI-PAY-01 (LOCKED), WI-REPORT-01 (LOCKED).

LOCKED WORK ITEMS PROTECTED:
- All 4 previous locked WIs and WI-REPORT-01 are fully protected against regression.

IMPLEMENTATION PLAN:
1. Data Models (`CustomerModel`, `DebtAccountModel`, `DebtOriginationModel`, `DebtCollectionModel`, `DebtEntryModel`)
2. Firestore Security Rules alignment (`customers`, `debtAccounts`, `debtOriginations`, `debtCollections`, `debtEntries`)
3. Repositories & Services (`CustomerRepository`, `DebtRepository`)
4. Checkout UI integration for Debt Lite & Customer Lookup
5. Debt Ledger & Repayment management view
6. Testing, Analyze, Build APK, Deploy & PO Test

PO TEST PLAN:
- Create customer → Record debt during checkout → Verify customer debt balance → Verify Today's Summary reports separate Debt from Collected → Execute debt repayment.

BLOCKERS:
NONE

NEXT PROMPT:
PROMPT-054 — Customer & Debt Data Models & Repositories (`CustomerModel`, `DebtAccountModel`, `DebtOriginationModel`, `CustomerRepository`, `DebtRepository`)

CODE CHANGES:
NONE

BUILD:
NOT PERFORMED

DEPLOY:
NOT PERFORMED

PO_VERIFIED:
NO CHANGE

PROTECTION:
NO CHANGE

LOCK:
NO CHANGE
