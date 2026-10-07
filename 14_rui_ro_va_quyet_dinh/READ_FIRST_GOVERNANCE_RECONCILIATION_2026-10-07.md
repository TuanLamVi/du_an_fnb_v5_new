# GOVERNANCE RECONCILIATION — READ-FIRST / FORENSIC

**Ngày:** 2026-10-07  
**Repository:** `TuanLamVi/du_an_fnb_v5_new`  
**Branch:** `main`

## Mục đích

Đối chiếu các Work Item/Prompt gần nhất với Governance hiện có, không dùng chat/memory làm bằng chứng thay cho repository.

## Kết quả

### Đã được Governance xác nhận trên GitHub

| Work Item | Trạng thái GitHub |
|---|---|
| WI-APP-DISPLAY-NAME-01 | COMPLETED / PO_VERIFIED / PROTECTED / LOCKED |
| WI-TOPPING-01 | COMPLETED / PO_VERIFIED / PROTECTED / LOCKED |
| WI-PRIMARY-JOB-NAVIGATION-01 (PROMPT-274) | COMPLETED / PO_VERIFIED / PROTECTED / LOCKED |
| WI-POS-CART-CONFIGURATION-DISPLAY-01 (PROMPT-284) | COMPLETED / PO_VERIFIED / PROTECTED / LOCKED |
| WI-CUSTOMER-LOOKUP-UX-IMPL-01 (PROMPT-288/293) | COMPLETED / PO_VERIFIED / PROTECTED / LOCKED |
| WI-TABLE-TEMP-INVOICE-PAID-RETURN-FIX-01 (PROMPT-302) | COMPLETED / PO_VERIFIED / PROTECTED / LOCKED |

### Được phát hiện trong lịch sử Governance nhưng chưa được bảng Work Item hiện tại phản ánh đầy đủ

- WI-CUSTOMER-360-PURCHASE-HISTORY-FIX-01: bảng tiến độ hiện đã ghi COMPLETED / PO_VERIFIED / LOCKED, nhưng danh mục Work Item hiện tại chưa có dòng tương ứng.
- WI-CUST-01: roadmap hiện vẫn ghi PARTIAL và cần GAP-LOYAL-01. Lịch sử Governance có các close-out PROMPT-200..216 liên quan Customer/Loyalty, nhưng chưa có bằng chứng trong ba bảng hiện tại đủ để tự động đổi WI-CUST-01 sang COMPLETED.
- WI-PAY-01 / các close-out Discount Card và Loyalty: lịch sử commit có tồn tại, nhưng không tự suy diễn trạng thái khóa Work Item từ commit close-out riêng lẻ.

### Các Prompt gần nhất chưa có bản ghi Governance trên GitHub

Không tìm thấy file/commit Governance chứa các mã sau:

- PROMPT-305
- PROMPT-308
- PROMPT-310
- PROMPT-314
- PROMPT-315
- PROMPT-318
- PROMPT-319

Vì vậy các mục trên được đánh dấu **NOT VERIFIED IN GOVERNANCE**. Không được tự chuyển thành COMPLETED / PO_VERIFIED / LOCKED chỉ dựa trên báo cáo ngoài repository.

## Kết luận quỹ đạo

**ĐANG ĐI ĐÚNG QUỸ ĐẠO SAU KHI RECONCILE:** Governance hiện tại vẫn đặt WI-CUST-01 ở trạng thái PARTIAL và Phase 6 ở PENDING. Không tự mở Work Item mới và không tự thay đổi trạng thái nghiệp vụ khi thiếu evidence trong repository.

## Gate

- CODE: NOT APPLICABLE
- TEST: NOT VERIFIED
- EVIDENCE: PARTIAL
- PO TEST: chỉ công nhận khi có record/evidence trong Governance
- GOVERNANCE: RECONCILED / gaps recorded
- COMMIT: PASS — `4a59d5eb0a9fd50a3e4077a2403c295c43d6aa15`
- PUSH: PASS — branch `main` đã được cập nhật
- GITHUB VERIFY: PASS — file đã đọc lại từ `main`

## Quy tắc tiếp theo

Mọi trạng thái COMPLETED / PO_VERIFIED / PROTECTED / LOCKED cho các Prompt chưa có Governance record phải được xác minh bằng evidence tương ứng trước khi cập nhật bảng chính thức.
