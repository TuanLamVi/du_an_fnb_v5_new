===== BÁO CÁO FORENSIC BẮT LỖI TẠO QUÁN PERMISSION-DENIED (PROMPT-007) =====

1. BẰNG CHỨNG LỖI PO TEST (PO TEST FAILURE)
Khi PO bấm "Tạo quán", hệ thống báo lỗi:
`Lỗi tạo cửa hàng: [cloud_firestore/permission-denied] The caller does not have permission to execute the specified operation`

2. PHÂN TÍCH FORENSIC LUỒNG XỬ LÝ (CREATE STORE BATCH WRITE)
Trong `StoreRepository.createStore`:
- Ghi Write #1: `batch.set(storeRef, store.toJson())` tại đường dẫn `/stores/{storeId}`.
- Ghi Write #2: `batch.set(memberRef, ownerMember.toJson())` tại đường dẫn `/stores/{storeId}/members/{ownerUid}`.

3. ĐỐI CHIẾU VỚI FIRESTORE SECURITY RULES (firestore.rules)
Tại `match /stores/{storeId}` (dòng 38 của `firestore.rules`):
`allow create: if isAuthenticated() && request.resource.data.createdBy == request.auth.uid;`

Đối chiếu với Payload Dữ Liệu `StoreModel.toJson()` trong `store_repository.dart`:
```dart
Map<String, dynamic> toJson() => {
      'storeId': storeId,
      'name': name,
      'address': address,
      'phone': phone,
      'ownerUid': ownerUid, // <--- BẤT NHẤT FIELD NAME
      'createdAt': createdAt,
    };
```

4. NGUYÊN NHÂN GỐC (ROOT CAUSE)
- `StoreModel.toJson()` trong `store_repository.dart` gửi trường `'ownerUid': ownerUid`, nhưng `firestore.rules` yêu cầu trường `'createdBy': request.auth.uid`.
- Do thiếu trường `createdBy` trong payload gửi lên (`request.resource.data.createdBy` bị `null`), điều kiện `request.resource.data.createdBy == request.auth.uid` đánh giá thành `false` (`null != request.auth.uid`).
- Do đó, ngay ở ghi Write #1 (`CREATE /stores/{storeId}`), Firestore Security Rules đã từ chối thao tác và nổ lỗi `[cloud_firestore/permission-denied]`.

Đồng thời, tại `match /stores/{storeId}/members/{uid}`:
Cần đảm bảo Rule cho phép khởi tạo Owner Membership ban đầu (`request.auth.uid == uid && request.resource.data.role == 'role_owner'`) khi Chủ quán tự tạo membership `status = 'active'` cho chính mình.

5. ĐỀ XUẤT SỬA ĐỔI CHÍNH XÁC (RECOMMENDED FIX):
- SỬA CODE (`store_repository.dart` & `store_model.dart`):
  Thêm trường `'createdBy': ownerUid` vào `StoreModel` & `StoreModel.toJson()` để khớp với yêu cầu `request.resource.data.createdBy == request.auth.uid` của `firestore.rules`.
- SỬA RULES (`firestore.rules`):
  Cập nhật Rule tại `match /stores/{storeId}/members/{uid}` để cho phép tạo bootstrap owner membership khi `request.auth.uid == uid` và `request.resource.data.role == 'role_owner'`.
