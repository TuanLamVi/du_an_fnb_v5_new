===== BÁO CÁO FORENSIC SỰ CỐ INDEX ORDER CREATEDAT (PROMPT-037) =====

A. QUERY THỰC TẾ
- File: `lib/features/pay/data/shift_repository.dart`
- Function: `closeShift(...)`
- Query đầy đủ:
  ```dart
  var occupiedOrdersQuery = await _firestore
      .collection('stores')
      .doc(storeId)
      .collection('orders')
      .where('status', whereIn: ['active_unfenced', 'active_fenced'])
      .where('createdAt', isGreaterThanOrEqualTo: openedAt)
      .get();
  ```

B. INDEX FIREBASE YÊU CẦU
- Collection: `orders` (Scope: COLLECTION)
- Fields & Order yêu cầu bởi inequality query (`isGreaterThanOrEqualTo`):
  + `status` (ASCENDING / IN)
  + `createdAt` (ASCENDING)
  + `__name__` (ASCENDING)

C. INDEX TRONG FIRESTORE.INDEXES.JSON (ĐANG CÓ)
- Trong `firestore.indexes.json`, index cho `orders` hiện tại đang khai báo:
  + `storeId` (ASCENDING)
  + `status` (ASCENDING)
  + `createdAt` (DESCENDING)  <--- DESCENDING
  + `__name__` (DESCENDING)   <--- DESCENDING

D. INDEX ĐANG ENABLE TRÊN FIREBASE
- Firebase Console hiển thị index có `createdAt DESCENDING` đang ở trạng thái Enabled.

E. COLLECTION SCOPE
- Scope: `COLLECTION` (Subcollection tại `/stores/{storeId}/orders`).

F. FIREBASE PROJECT
- `fnb-smart` (Staging).

G. APK / SOURCE VERIFICATION
- APK build từ commit `fa61905`.

H. SO SÁNH A/B/C/D
- Query trong Dart sử dụng toán tử bất đẳng thức `isGreaterThanOrEqualTo` trên trường `createdAt`, điều này ngầm định yêu cầu index phải sắp xếp `createdAt` theo chiều **ASCENDING** (`order: "ASCENDING"`).
- Tuy nhiên, index đang có trong `firestore.indexes.json` lại khai báo `createdAt` theo chiều **DESCENDING** (`order: "DESCENDING"`).
- Sự khác biệt về hướng sắp xếp (`ASC` vs `DESC`) khiến Firestore không thể sử dụng index hiện có, dẫn đến lỗi `failed-precondition: The query requires an index`.

I. ROOT CAUSE
- Lỗi hướng sắp xếp (Direction Mismatch): Query thực hiện lọc bất đẳng thức `createdAt >= openedAt` (yêu cầu chiều `ASCENDING`), trong khi index được khai báo với chiều `DESCENDING`.

J. RECOMMENDED SURGICAL FIX
- Bổ sung vào `firestore.indexes.json` một composite index cho `orders` với chiều `createdAt` là `ASCENDING`:
  `status` (ASCENDING), `createdAt` (ASCENDING), `__name__` (ASCENDING).
- Deploy index lên Firebase staging (`fnb-smart`).

STATUS:
FORENSIC COMPLETE — AWAITING PO DECISION
