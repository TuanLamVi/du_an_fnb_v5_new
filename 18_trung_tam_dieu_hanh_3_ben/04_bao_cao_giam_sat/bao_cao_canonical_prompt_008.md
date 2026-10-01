===== BÁO CÁO XÁC ĐỊNH CANONICAL FIELD STORE OWNERSHIP (PROMPT-008) =====

1. BẢNG ĐỐI CHIẾU 3 BÊN:
| Thành phần | Field hiện tại | Nguồn bằng chứng |
| --- | --- | --- |
| Tài liệu Schema | `createdBy` | `DATABASE_SCHEMA_V0.1.md` §1.2 & §3.2 |
| StoreModel Source | `ownerUid` | `lib/features/auth/models/store_model.dart` |
| Firestore Rules | `createdBy` | `firestore.rules` line 38 |

2. BẰNG CHỨNG TÀI LIỆU CHÍNH THỨC:
- `DATABASE_SCHEMA_V0.1.md` §1.2 quy định: Document mutable có các trường metadata chuẩn: `revision`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`.
- `DATABASE_SCHEMA_V0.1.md` §3.2 quy định bảng `/stores/{storeId}` có các trường metadata: `createdBy, createdAt, updatedAt`.
- `firestore.rules` dòng 38 kiểm tra: `allow create: if isAuthenticated() && request.resource.data.createdBy == request.auth.uid;`.

3. KẾT LUẬN CANONICAL:
CANONICAL = createdBy

4. BẢNG MÔ HÌNH CANONICAL OWNER MEMBERSHIP:
- Path: `/stores/{storeId}/members/{uid}`
- `uid`: `request.auth.uid`
- `role`: `role_owner` (hoặc `roleId = 'role_owner'`)
- `status`: `active`

5. CONFIRM ROOT CAUSE:
YES — `StoreModel.toJson()` trong `store_repository.dart` thiếu trường `createdBy`, khiến `request.resource.data.createdBy` bị `null` khi Firestore Rules kiểm tra, dẫn tới lỗi `[cloud_firestore/permission-denied]`.
