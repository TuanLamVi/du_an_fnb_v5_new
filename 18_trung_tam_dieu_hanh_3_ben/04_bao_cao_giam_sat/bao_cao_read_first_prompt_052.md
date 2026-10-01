===== BÁO CÁO READ-FIRST XÁC ĐỊNH WORK ITEM DEBT LITE (PROMPT-052) =====

1. RÀ SOÁT TÀI LIỆU & ROADMAP
- Master Specification V5.1 (§17), Customer & Debt Ledger Discovery (Prompt 107), Product Charter V5.1, và Governance Identity Reconciliation (Prompt 111 / A8 stage).
- Xác định Debt Lite / Customer & Debt Ledger có định danh ngữ nghĩa riêng trong taxonomy dự án (`A8` / `WI-DEBT-01`).

2. THÔNG TIN WORK ITEM DEBT LITE
- WORK ITEM ID: `WI-DEBT-01` (Historical alias: `A8`)
- WORK ITEM NAME: `Customer Profile & Debt Ledger (Sổ nợ & Hồ sơ khách hàng)`
- CURRENT STATUS: `NOT_STARTED`
- DEPENDENCIES: WI-AUTH-01, WI-SETUP-01, WI-TABLE-01/POS-01, WI-KDS-01, WI-PAY-01, WI-REPORT-01 (All LOCKED).

3. PHẠM VI & DỮ LIỆU
- Quản lý hồ sơ khách hàng (`/stores/{storeId}/customers/{customerId}`).
- Sổ nợ cửa hàng (`/stores/{storeId}/debtAccounts/{customerId}`).
- Ghi nhận phát sinh nợ (`DebtOrigination`).
- Thu hồi nợ (`DebtCollection`, phân bổ FIFO `DebtCollectionAllocation`).
- Nhật ký sổ nợ (`DebtEntry`).

4. KẾT LUẬN & NEXT ACTION
- Debt Lite là một Work Item độc lập (`WI-DEBT-01`), tách biệt khỏi WI-PAY-01 (Checkout/Cash/Shift) và WI-REPORT-01.
- TUYỆT ĐỐI CHƯA CODE. Chờ PO quyết định bước tiếp theo.
