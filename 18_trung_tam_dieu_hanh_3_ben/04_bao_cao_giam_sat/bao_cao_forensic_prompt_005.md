===== BÁO CÁO FORENSIC BẢO TRÌ VÀ DỰ ĐOÁN NGUYÊN NHÂN CRASH (PROMPT-005) =====

1. BẰNG CHỨNG CRASH (LOGCAT EVIDENCE)
`java.lang.RuntimeException: Unable to instantiate activity ComponentInfo{com.tuan.fnbsmart/com.tuan.fnbsmart.MainActivity}: java.lang.ClassNotFoundException: Didn't find class "com.tuan.fnbsmart.MainActivity"`

2. SO SÁNH MÔI TRƯỜNG BUILD DỰ ÁN CŨ VÀ DỰ ÁN MỚI:
- Cấu trúc Kotlin package:
  + DỰ ÁN CŨ: `android/app/src/main/kotlin/com/tuan/fnbsmart/MainActivity.kt` (`package com.tuan.fnbsmart`).
  + DỰ ÁN MỚI (MẶC ĐỊNH FLUTTER TEMPLATE): `android/app/src/main/kotlin/com/fnbsmart/v5/fnb_smart_v5/MainActivity.kt` (`package com.fnbsmart.v5.fnb_smart_v5`).
  + XUNG ĐỘT: `build.gradle.kts` khai báo `namespace = "com.tuan.fnbsmart"`, dẫn tới Android System không tìm thấy class `com.tuan.fnbsmart.MainActivity` khi khởi chạy process.
- Quyền Manifest:
  + DỰ ÁN CŨ: Có `<uses-permission android:name="android.permission.INTERNET"/>` và `ACCESS_NETWORK_STATE`.
  + DỰ ÁN MỚI (MẶC ĐỊNH TEMPLATE): Thiếu `INTERNET` permission cho Firebase runtime.
- Cấu hình Build SDK:
  + DỰ ÁN CŨ: `compileSdk = 36`, `minSdk = 24`, `targetSdk = 35`, `multiDexEnabled = true`.
  + DỰ ÁN MỚI: Mặc định Flutter SDK config (`minSdk` 21).

3. PHÂN LOẠI NGUYÊN NHÂN:
- LoẠI A (Sai lệch cấu hình build trực tiếp gây crash):
  + Vị trí package Kotlin `MainActivity.kt` không khớp với `namespace` làm nổ `ClassNotFoundException` ngay lập tức khi ứng dụng vừa được mở.
  + Thiếu quyền `INTERNET` trong `AndroidManifest.xml` khiến Firebase Auth / Core runtime gặp lỗi khởi tạo.
- LoẠI B (Khác biệt môi trường chưa trực tiếp gây crash):
  + Cấu hình `minSdk = 24`, `compileSdk = 36`, `targetSdk = 35`.
- LoẠI C (Lỗi logic ứng dụng / Dart Runtime):
  + Không thuộc loại C vì lỗi nổ ngay từ tầng Android Process Instantiation (chưa chạy tới Dart VM `main()`).

4. ĐỀ XUẤT ĐỒNG BỘ CẤU HÌNH (RECOMMENDED FIX):
- FILE 1: `android/app/src/main/kotlin/com/tuan/fnbsmart/MainActivity.kt`
  CURRENT: `com/fnbsmart/v5/fnb_smart_v5/MainActivity.kt`
  EXPECTED: `com/tuan/fnbsmart/MainActivity.kt` (`package com.tuan.fnbsmart`)
  REASON: Khớp với namespace `com.tuan.fnbsmart` và khắc phục triệt để `ClassNotFoundException`.
- FILE 2: `android/app/src/main/AndroidManifest.xml`
  CURRENT: Thiếu quyền INTERNET
  EXPECTED: Thêm `<uses-permission android:name="android.permission.INTERNET"/>` và `ACCESS_NETWORK_STATE`
  REASON: Cần thiết cho Firebase Auth & Firestore.
- FILE 3: `android/app/build.gradle.kts`
  CURRENT: `compileSdk = flutter.compileSdkVersion`, `minSdk = flutter.minSdkVersion`
  EXPECTED: `compileSdk = 36`, `minSdk = 24`, `targetSdk = 35`, `multiDexEnabled = true`
  REASON: Đồng bộ theo chuẩn `A0-BUILD-001`.
