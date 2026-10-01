===== BÁO CÁO DEPLOY FIRESTORE RULES CHO WI-SETUP-01 (PROMPT-013) =====

1. THÔNG TIN DEPLOYMENT
- Firebase Project Target: `fnb-smart` (Staging)
- Environment: Staging
- File Rules Deploy: `firestore.rules` (Commit `5b9aa08` / Root repository)
- Lệnh thực hiện: `npx firebase deploy --only firestore:rules --project fnb-smart`
- Thời gian triển khai: `2026-09-30 18:15:00`

2. BẰNG CHỨNG THỰC TẾ (COMMAND OUTPUT EVIDENCE)
```text
=== Deploying to 'fnb-smart'...

i  deploying firestore
i  firestore: reading indexes from firestore.indexes.json...
i  cloud.firestore: checking firestore.rules for compilation errors...
+  cloud.firestore: rules file firestore.rules compiled successfully
i  firestore: uploading rules firestore.rules...
+  firestore: released rules firestore.rules to cloud.firestore

+  Deploy complete!

Project Console: https://console.firebase.google.com/project/fnb-smart/overview
```

3. NỘI DUNG RULES ĐÃ RELEASE TRÊN CLOUD
- Hàm `isStoreActiveOwner(storeId)` được cập nhật hỗ trợ song song cả field canonical và legacy model:
  + `(resource.data.createdBy == request.auth.uid || resource.data.ownerUid == request.auth.uid)`
  + `(data.roleId == 'role_owner' || data.role == 'role_owner')`
- Match rules cho các subcollection dưới `/stores/{storeId}`:
  + `/categories/{categoryId}` -> allow write: if `isStoreActiveOwner(storeId)`
  + `/products/{productId}` -> allow write: if `isStoreActiveOwner(storeId)`
  + `/zones/{zoneId}` -> allow write: if `isStoreActiveOwner(storeId)`
  + `/tables/{tableId}` -> allow write: if `isStoreActiveOwner(storeId)`

4. KIỂM TRA THAY ĐỔI
- App Source (`fnb-smart-v5`): KHÔNG THAY ĐỔI (Giữ nguyên commit `5b9aa08`)
- Build APK: Giữ nguyên SHA256 `32800D0CB43D10E596742B1592BB598F12638B56C7B082560C459E39476A91D8`
- Deploy Thiết bị: APK đã cài sẵn trên Samsung Galaxy M51 và Samsung Galaxy Note 8.

5. HƯỚNG DẪN PO TEST
PO tiến hành test lại luồng Quick Setup trên thiết bị M51 / Note 8:
- Bấm "MỞ WIZARD KHỞI TẠO QUÁN NHANH".
- Chọn 1 hoặc nhiều Mô hình kinh doanh.
- Bấm "KHỞI TẠO BẮT ĐẦU BÁN HÀNG".
- Kiểm tra kết quả: Hệ thống khởi tạo thành công 1 Khu vực 1, 10 Bàn và Menu mẫu mà không bị nổ lỗi `permission-denied`.
