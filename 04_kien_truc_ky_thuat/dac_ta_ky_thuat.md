# ĐẶC TẢ KỸ THUẬT (TECHNICAL SPECIFICATION) F&B SMART V5.1

## 1. Technology Stack
- **Framework:** Flutter (Dart).
- **Architecture:** Clean Architecture + Feature-based modularization.
- **Backend as a Service (BaaS):** Firebase (Firebase Auth, Cloud Firestore).
- **State Management:** BLoC / Cubit / Riverpod / ChangeNotifier (Theo thực tế mã nguồn trong `clean_rebuild_v5`).
- **Local Storage:** SharedPreferences / Hive / Isar (Tùy chọn cho cache offline cơ bản).

## 2. Authentication & Security
- Xác thực dựa trên tài khoản nhân sự được khởi tạo bởi Owner trên Firebase Auth.
- Phân quyền theo vai trò (Role-based access control kết hợp LEGO permissions).

## 3. Error Handling & Logging
- Bắt lỗi tập trung tại Data/Repository layer, trả về `Either<Failure, Success>` hoặc Result object chuẩn.
- Ghi log sự kiện theo `LOGGING_PROTOCOL.md`.

## 4. Build & Environment Requirements
- **Flutter SDK:** Bản stable mới nhất tương thích với dự án.
- **Dart SDK:** >= 3.0.
- **Target Platforms:** Android (chủ đạo cho thiết bị POS/Tablet), hỗ trợ đa nền tảng.
