===== BÁO CÁO FORENSIC SỰ CỐ CLOSE SHIFT BỊ BLOCKED (PROMPT-032) =====

A. READ-FIRST
- Documents read: AGENTS.md, CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md (§16 Shift & Cash Drawer), DATABASE_SCHEMA_V0.1.md (§9 Shift), STATE_MACHINES_V0.1.md (§13 Shift), PROMPT-029 & PROMPT-031 implementation reports.

B. CLOSE SHIFT FLOW
- File: `lib/features/pay/data/shift_repository.dart`
- Function: `closeShift(...)`
- Query:
  1. `_firestore.collection('stores').doc(storeId).collection('orders').where('status', whereIn: ['active_unfenced', 'active_fenced']).get()`
  2. `_firestore.collection('stores').doc(storeId).collection('paymentsAttempts').where('status', whereIn: ['initiated', 'attempted']).get()`
- Blocking condition: `occupiedOrdersQuery.docs.isNotEmpty` or `pendingAttemptsQuery.docs.isNotEmpty`.

C. PO TESTED ORDER
- Order vừa thanh toán thành công chuyển sang trạng thái `closed`, nhưng các order cũ/test nháp trước đó vẫn tồn tại trong collection `orders` với status `active_unfenced` hoặc `active_fenced`.

D. BLOCKING RECORD
- Bất kỳ document nào trong collection `/stores/{storeId}/orders` có `status == 'active_unfenced'` hoặc `'active_fenced'` (kể cả order nháp cũ, order test từ các phiên trước chưa bao giờ được checkout hoặc cancel) đều kích hoạt điều kiện block.

E. ROOT CAUSE
- `ShiftRepository.closeShift()` thực hiện query kiểm tra đơn hàng chưa hoàn tất trên TOÀN BỘ collection `orders` của cửa hàng (`/stores/{storeId}/orders`) mà KHÔNG giới hạn theo khoảng thời gian của ca làm việc hiện tại (`createdAt >= shift.openedAt`) hoặc không kiểm tra thực tế trạng thái bàn đang có `tableStates` là `occupied`.
- Do đó, các order nháp hoặc order test cũ còn sót lại trong database làm cho `occupiedOrdersQuery.docs.isNotEmpty` trả về `true`, gây ra hiện tượng báo lỗi giả (false positive) chặn đóng ca mặc dù trên giao diện Table Map hiện tại PO không thấy bàn nào đang mở.

F. EVIDENCE
- File: `lib/features/pay/data/shift_repository.dart` (Lines 111–123).
- Code logic: Global store-wide query on `orders` collection without shift scopic filtering or active table state validation.

G. IMPACT
- Không ảnh hưởng Checkout/Payment đã PASS (vì `processCashPayment` cập nhật đúng order và table state).
- Không ảnh hưởng các Work Item đã LOCKED (Auth, Setup, Table/POS, KDS).

H. RECOMMENDED SURGICAL FIX
- Surgical Fix: Cập nhật điều kiện kiểm tra Close Shift trong `ShiftRepository.closeShift()`:
  1. Chỉ kiểm tra các Order được tạo trong ca hiện tại (`createdAt >= shift.openedAt`) HOẶC kiểm tra trực tiếp số lượng bàn đang ở trạng thái `occupied` (`/stores/{storeId}/tableStates` có `state == 'occupied'`), vì theo state machine, mọi order chưa thanh toán sẽ giữ bàn ở trạng thái `occupied`.
  2. Lọc pending payment attempts trong thời gian ca làm việc.

I. STATUS
FORENSIC COMPLETE — AWAITING PO DECISION
