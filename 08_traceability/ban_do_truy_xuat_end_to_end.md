# BẢN ĐỒ TRUY XUẤT END-TO-END (END-TO-END TRACEABILITY MAPS) F&B SMART V5.1

Chuỗi truy xuất khép kín (End-to-End Trace) cho các luồng cốt lõi:

## 1. Luồng Bán hàng POS & Gửi Bếp (POS Ordering & KDS E2E Trace)
`REQ-POS-01` (Yêu cầu bán hàng)
  → `FEAT-POS-01` (Tính năng POS)
  → `SCR-POS-01` (Màn hình POS)
  → `FLOW-POS-01` (Luồng tạo đơn)
  → `RULE-POS-01` (Quy tắc tạo và gửi đơn)
  → `Submitted` (Trạng thái Order)
  → `ENT-ORD` & `ENT-ITEM` (Data Entities / Path `/stores/{storeId}/orders`)
  → `COMP-FEAT-POS` & `COMP-FEAT-KDS` (Architecture Components)
  → `CTRL-TENANT-01` & `CTRL-RBAC-01` (Security Controls)
  → `TC-POS-01` & `TC-KDS-01` (Test Cases)
  → `POA-POS-01` (PO Acceptance)
  → `WI-POS-01` (Work Item)
