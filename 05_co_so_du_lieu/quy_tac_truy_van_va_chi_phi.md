# QUY TẮC TRUY VẤN VÀ CHI PHÍ FIRESTORE (QUERY RULES & COST BUDGET) F&B SMART V5.1

Dựa trên tài liệu `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`:

## 1. Query Patterns & Indexing
- Mọi truy vấn Firestore phải bao gồm điều kiện lọc theo `storeId` để tận dụng compound index và giới hạn phạm vi đọc dữ liệu trong scope cửa hàng.
- Tránh các truy vấn `collectionGroup` trên quy mô lớn nếu không có chỉ mục phù hợp để kiểm soát chi phí đọc document (Read operations).

## 2. Realtime Listeners (Snapshot Listeners)
- Sử dụng Realtime Listeners hợp lý cho màn hình POS và KDS để đồng bộ trạng thái đơn hàng thời gian thực.
- Hủy bỏ subscription (unsubscribe) khi widget bị dispose để tránh rò rỉ bộ nhớ và chi phí đọc thừa.

## 3. Query Budget & Cost Constraints
- Tuân thủ ngân sách chi phí đọc/ghi được định nghĩa trong `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`, tối ưu hóa số lượng document đọc trên mỗi giao dịch bán hàng.
