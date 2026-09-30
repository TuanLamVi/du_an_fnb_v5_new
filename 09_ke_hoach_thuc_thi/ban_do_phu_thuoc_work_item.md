# BẢN ĐỒ PHỤ THUỘC WORK ITEM (DEPENDENCY MAP) F&B SMART V5.1

Sơ đồ phụ thuộc giữa các Work Items:

```text
WI-AUTH-01 (Xác thực) ──► WI-SETUP-01 (Quick Setup & Menu) ──► WI-POS-01 (POS & Table)
                                                                     │
                                              ┌──────────────────────┴──────────────────────┐
                                              ▼                                             ▼
                                     WI-KDS-01 (Nhà bếp KDS)                       WI-PAY-01 (Thanh toán)
                                              │                                             │
                                              └──────────────────────┬──────────────────────┘
                                                                     ▼
                                                    WI-CUST-01 (Khách hàng & Công nợ)
```
