# DANH MỤC QUY TẮC VÀ TRẠNG THÁI (RULES & STATES CATALOG) F&B SMART V5.1

Catalog tổng hợp nhanh toàn bộ Rules và States của hệ thống:

| ID | Loại | Domain | Mô tả ngắn | Trạng thái | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **RULE-AUTH-01** | Rule | Auth | Xác thực nhân sự | CONFIRMED | Master Spec |
| **RULE-SETUP-01** | Rule | Setup | Quick Setup & Clone Menu | CONFIRMED | Quick Setup Discovery |
| **RULE-POS-01** | Rule | POS | Tạo và Gửi đơn hàng | CONFIRMED | POS Discovery |
| **RULE-TABLE-01** | Rule | Table | Quản lý trạng thái bàn | CONFIRMED | Table Discovery |
| **RULE-KDS-01** | Rule | KDS | Cập nhật trạng thái chế biến | CONFIRMED | KDS Discovery |
| **RULE-PAY-01** | Rule | Payment | Thanh toán đơn hàng | CONFIRMED | Checkout Discovery |
| **RULE-SHIFT-01** | Rule | Shift | Quản lý ca làm việc | CONFIRMED | Shift Discovery |
| **TR-ORD-01** | Transition | Order | Draft → Submitted | CONFIRMED | POS Discovery |
| **TR-TAB-01** | Transition | Table | Available → Occupied | CONFIRMED | Table Discovery |
| **TR-KDS-01** | Transition | KDS | New → Cooking | CONFIRMED | KDS Discovery |
| **TR-PAY-01** | Transition | Payment | Pending → Success | CONFIRMED | Checkout Discovery |
