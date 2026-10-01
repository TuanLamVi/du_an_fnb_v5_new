===== BÁO CÁO READ-FIRST XÁC ĐỊNH WORK ITEM KẾ TIẾP (PROMPT-027) =====

1. RÀ SOÁT CÁC WORK ITEM ĐÃ LỌC (LOCKED / PO_VERIFIED)
- WI-AUTH-01: `PO_VERIFIED / PROTECTED / LOCKED` (Phone Auth, Dual Entry, AuthStartupGateway, Session Persistence).
- WI-SETUP-01: `PO_VERIFIED / PROTECTED / LOCKED` (Quick Setup Wizard 20 mô hình, menu cloning, 1 zone, 10 bàn starter).
- WI-TABLE-01 / WI-POS-01: `PO_VERIFIED / PROTECTED / LOCKED` (Table Map, zone selector, table states, POS ordering, cart, order submission).
- WI-KDS-01: `PO_VERIFIED / PROTECTED / LOCKED` (Kitchen Stations, Kitchen Tickets, KDS State Machine `queued → acknowledged → preparing → ready → served`).

2. XÁC ĐỊNH WORK ITEM KẾ TIẾP TỪ MASTER SPECIFICATION & ROADMAP
Theo `CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` (§15 Checkout / Payment, §16 Shift & Cash Drawer, §17 Customer & Debt Ledger), sau khi hoàn thành KDS (bếp chuẩn bị và phục vụ món), phân hệ tiếp theo trong chuỗi giao dịch cốt lõi (Core Transaction Pipeline) là **Thanh toán, Hóa đơn và Quản lý Ca / Két tiền**.

3. THÔNG TIN WORK ITEM KẾ TIẾP
NEXT WORK ITEM:
ID: WI-PAY-01
NAME: Checkout, Payment & Shift Management (Thanh toán, Hóa đơn & Quản lý Ca)
REASON: Tiếp nối trực tiếp sau KDS trong pipeline giao dịch F&B SaaS (Auth → Setup → Table/POS → KDS → Checkout/Payment & Shift).
DEPENDENCIES: WI-AUTH-01 (LOCKED), WI-SETUP-01 (LOCKED), WI-TABLE-01/POS-01 (LOCKED), WI-KDS-01 (LOCKED).
CURRENT STATUS: NOT_STARTED
SCOPE: 
- Quản lý Ca làm việc (Open shift, Cash in/out, Handover, Close shift blocking).
- Thanh toán hóa đơn (Cash, payOS QR webhook verification, Split payment, Debt Lite).
- Kiến trúc thanh toán 3 lớp: PaymentAttempt → Allocation → Settlement.
- Ghi nhận doanh thu & đồng bộ két tiền mặt (Cash Drawer).
PO DECISION REQUIRED: YES (Awaiting PO approval of WI-PAY-01 implementation plan before coding).

4. ĐỀ XUẤT KẾ HOẠCH TIẾP THEO
- Lập kế hoạch chi tiết cho WI-PAY-01 (Kế hoạch triển khai, cấu trúc dữ liệu, Firestore Rules, UI thanh toán & quản lý ca).
- CHƯA CODE. Chờ PO phê duyệt kế hoạch.
