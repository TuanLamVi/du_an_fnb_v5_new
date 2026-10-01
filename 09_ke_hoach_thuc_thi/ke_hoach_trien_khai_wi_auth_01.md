# KẾ HOẠCH TRIỂN KHAI WI-AUTH-01 (RÀ SOÁT LẦN CUỐI)

## 1. Mục tiêu
Xác thực số điện thoại qua Firebase Auth (Real Phone OTP), chuẩn hóa số điện thoại E.164 (`+84...`), phân luồng sau đăng nhập (Owner vs. Employee) qua One App Dual Entry Flows, khởi tạo cửa hàng cho Chủ quán, và gửi yêu cầu gia nhập cửa hàng (`status = pending`) cho Nhân viên.

## 2. Phạm vi chi tiết
### Xác thực
- Phone Authentication sử dụng Firebase Auth.
- Mã OTP thật qua SMS.
- Chuẩn hóa định dạng số điện thoại theo chuẩn E.164.

### Luồng Chủ cửa hàng (Owner)
- Nhập số điện thoại → Nhận & xác thực OTP → Đăng nhập thành công (nhận Firebase UID).
- Chọn vai trò **CHỦ QUÁN**.
- Nhập thông tin cửa hàng cơ bản (Tên cửa hàng, địa chỉ, số điện thoại).
- Khởi tạo cửa hàng trên Firestore (`/stores/{storeId}`).
- Tạo membership Chủ quán (`role_owner`, `status = active`).

### Luồng Nhân viên (Employee)
- Nhập số điện thoại → Nhận & xác thực OTP → Đăng nhập thành công (nhận Firebase UID).
- Chọn vai trò **NHÂN VIÊN**.
- Nhập mã cửa hàng (Store ID/Code).
- Gửi yêu cầu gia nhập tại `/stores/{storeId}/members/{uid}` với `status = pending`.
- Màn hình chờ phê duyệt từ Chủ quán.

## 3. Ngoài phạm vi (Excluded)
- Màn hình POS ordering, thanh toán (Payment), KDS, quản lý ca làm việc (Shift), báo cáo (Reports).
- Tính năng duyệt nhân viên của Chủ quán (thuộc Work Item phân quyền/nhân sự sau).
- Quick Setup chi tiết 20 business models và menu items nâng cao (sẽ do WI-SETUP-01 phụ trách phần clone menu template sâu; WI-AUTH-01 chỉ khởi tạo Store và Membership cơ bản).

## 4. Nguồn yêu cầu
- `docs-123/EMPLOYEE_ONBOARDING_V1.md`
- `docs-123/ONBOARDING_FLOW_V1.md`
- `docs-123/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`

## 5. Bảng Phạm Vi Code (Component Scope Table)

| STT | Thành phần | Tạo mới / Sửa | Nguồn yêu cầu | Mục đích |
| --- | ---------- | ------------- | ------------- | -------- |
| 1 | `AuthRepository` | Tạo mới | EMPLOYEE_ONBOARDING_V1 | Gửi OTP, xác thực OTP, lấy current user, sign out |
| 2 | `StoreRepository` | Tạo mới | MASTER_SPECIFICATION | Tạo Store mới, kiểm tra Store tồn tại |
| 3 | `MemberRepository` | Tạo mới | EMPLOYEE_ONBOARDING_V1 | Gửi yêu cầu tham gia store (`status = pending`) |
| 4 | `PhoneLoginView` | Tạo mới | ONBOARDING_FLOW_V1 | Màn hình nhập SĐT & yêu cầu gửi OTP |
| 5 | `OtpVerificationView` | Tạo mới | ONBOARDING_FLOW_V1 | Màn hình nhập mã xác thực OTP |
| 6 | `RoleSelectionView` | Tạo mới | ONBOARDING_FLOW_V1 | Màn hình chọn vai trò (Chủ quán / Nhân viên) |
| 7 | `OwnerOnboardingView` | Tạo mới | ONBOARDING_FLOW_V1 | Màn hình nhập thông tin quán cho Chủ quán |
| 8 | `StaffJoinView` | Tạo mới | EMPLOYEE_ONBOARDING_V1 | Màn hình nhập Store ID/Code cho Nhân viên |
| 9 | `AuthRoutingService` | Tạo mới | MASTER_SPECIFICATION | Điều hướng sau đăng nhập dựa trên state & membership |
| 10 | `lib/main.dart` | Sửa | CLEAN_REBUILD_SPEC | Khởi tạo Firebase và cấu hình root routing |

## 6. Thứ Tự Thực Hiện (Execution Sequence)

### Bước 1: AuthRepository & Phone Authentication Service
- **Đầu vào:** Số điện thoại người dùng.
- **Đầu ra:** Gửi OTP thành công / trả về `VerificationId`, xác thực credential thành công trả về `UserCredential`.
- **Phụ thuộc:** `firebase_auth`.
- **Cách kiểm thử:** Unit test cho hàm chuẩn hóa SĐT sang E.164 và mock auth repository.

### Bước 2: PhoneLoginView & OtpVerificationView
- **Đầu vào:** UI input SĐT và OTP.
- **Đầu ra:** Chuyển tiếp sang màn hình chọn vai trò hoặc routing.
- **Phụ thuộc:** Bước 1.
- **Cách kiểm thử:** Widget test luồng nhập SĐT và chuyển sang màn OTP.

### Bước 3: RoleSelectionView
- **Đầu vào:** Firebase UID đã xác thực.
- **Đầu ra:** Lựa chọn Role (`Chủ quán` hoặc `Nhân viên`).
- **Phụ thuộc:** Bước 2.
- **Cách kiểm thử:** Widget test click chọn Chủ quán vs Nhân viên.

### Bước 4: OwnerOnboardingView & StoreRepository
- **Đầu vào:** Tên quán, địa chỉ, SĐT.
- **Đầu ra:** Document `/stores/{storeId}` được tạo, membership `role_owner` được tạo (`status = active`).
- **Phụ thuộc:** Bước 3, `cloud_firestore`.
- **Cách kiểm thử:** Integration test tạo store và kiểm tra Firestore mock.

### Bước 5: StaffJoinView & MemberRepository
- **Đầu vào:** Store ID / Code.
- **Đầu ra:** Document `/stores/{storeId}/members/{uid}` được tạo (`status = pending`).
- **Phụ thuộc:** Bước 3, `cloud_firestore`.
- **Cách kiểm thử:** Integration test gửi join request và kiểm tra trạng thái pending.

## 7. Kiểm Tra Firebase
- **Project ID:** `fnb-smart` (Staging).
- **Services:** Firebase Auth (Phone), Cloud Firestore.
- Không tạo project mới, không đổi project ID.

## 8. Tác Động & Kiểm Tra An Toàn
- Dữ liệu User: Sử dụng Firebase UID cố định, không tạo tài khoản trùng.
- Dữ liệu Store & Membership: Phân lập theo `storeId`.
- Security Rules: Đảm bảo chỉ owner mới duyệt member, member chỉ tạo request `pending` cho chính mình.

## 9. Điều Kiện Hoàn Thành & Nghiệm Thu
- Hoàn tất code các thành phần trong bảng.
- `flutter analyze` 0 lỗi, `flutter test` pass.
- Build debug APK thành công.
