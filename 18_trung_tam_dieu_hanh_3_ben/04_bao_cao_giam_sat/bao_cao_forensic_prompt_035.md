===== BÁO CÁO FORENSIC SỰ CỐ INDEX CLOSE SHIFT (PROMPT-035) =====

A. QUERY THỰC TẾ
- File: `lib/features/pay/data/shift_repository.dart`
- Function: `getActiveOpenShift(String storeId, String userId)`
- Query đầy đủ:
  ```dart
  QuerySnapshot query = await _firestore
      .collection('stores')
      .doc(storeId)
      .collection('shifts')
      .where('userId', isEqualTo: userId)
      .where('status', isEqualTo: 'open')
      .limit(1)
      .get();
  ```

B. INDEX FIREBASE YÊU CẦU (DỰA TRÊN QUERY THỰC TẾ)
- Collection Scope: `COLLECTION` (Subcollection `/stores/{storeId}/shifts`)
- Collection Group: `shifts`
- Fields: `userId` (ASCENDING), `status` (ASCENDING)

C. INDEX ĐANG CÓ TRONG FIRESTORE.INDEXES.JSON (TRƯỚC ĐÓ)
- Đã khai báo nhầm các field theo mô tả ngoài lề: `userId`, `startTime`, `isClosed` (thay vì các field thực tế mà `ShiftModel` sử dụng là `userId` và `status`).

D. MISMATCH
- Code thực tế trong `ShiftRepository.getActiveOpenShift` thực hiện query lọc theo `userId` và `status` (với dữ liệu model `ShiftModel` lưu trường `status` và `userId`), trong khi index đã deploy trước đó lại định nghĩa các field `startTime` và `isClosed`.
- Do sự bất nhất giữa field name trong code thực tế (`status`, `userId`) và index đã cấu hình (`isClosed`, `startTime`), Firestore tiếp tục báo lỗi `failed-precondition` yêu cầu đúng index cho `userId` và `status`.

E. APK / SOURCE VERIFICATION
- PO đang test trên source code hiện tại (commit `fa61905` hoặc phiên bản gần nhất).

F. ROOT CAUSE
- Nguyên nhân gốc: Bất nhất giữa field name dùng trong query của `ShiftRepository` (`status`) và field name khai báo trong index (`isClosed`). Do code truy vấn `status` nhưng index khai báo `isClosed`, Firestore không nhận diện được index khớp với query thực tế và tiếp tục yêu cầu index đúng.

G. RECOMMENDED FIX
- Cập nhật `firestore.indexes.json` để khai báo đúng composite index cho collectionGroup `shifts` với các field thực tế: `userId` (ASCENDING), `status` (ASCENDING).
- Sau đó deploy lại index bằng lệnh `npx firebase deploy --only firestore:indexes --project fnb-smart`.

STATUS:
FORENSIC COMPLETE — AWAITING PO DECISION
