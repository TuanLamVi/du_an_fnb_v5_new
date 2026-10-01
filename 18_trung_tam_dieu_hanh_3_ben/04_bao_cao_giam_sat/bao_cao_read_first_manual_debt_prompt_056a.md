===== BÁO CÁO READ-FIRST GHI NỢ NGOÀI ĐƠN HÀNG (PROMPT-056A) =====

1. RÀ SOÁT TÀI LIỆU CĂN CỨ
- `CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` §17 (Customer & Debt Ledger)
- `DATABASE_SCHEMA_V0.1.md` §10.2 (`DebtOrigination` yêu cầu liên kết `invoiceId` và `settlementId`, với công thức ID `originationId = OR_{settlementId}`).
- `CUSTOMER_LOYALTY_DISCOVERY_V5.1.md` (Prompt 107 Final Boundary).

2. KẾT LUẬN NGHIỆM THU
- Theo Database Schema V0.1, mọi khoản nợ (`DebtOrigination`) trong kiến trúc canonical bắt nguồn từ một giao dịch thanh toán hóa đơn (`invoiceId` và `settlementId`).
- Ghi nợ ngoài đơn hàng (không qua POS invoice/order) là: `NOT SPECIFIED IN CURRENT GOVERNANCE`.

3. CÁC ĐIỂM CẦN PO QUYẾT ĐỊNH
1. Có cho phép ghi nợ ngoài đơn hàng (Manual Debt Entry) không?
2. Nếu cho phép, khoản này có được tính vào doanh thu bán hàng hay chỉ là tăng dư nợ công nợ (`DebtAccount`)?
3. Có bắt buộc tạo một hóa đơn thủ công (Manual Invoice) ẩn để thỏa mãn schema `DebtOrigination` hay không?
