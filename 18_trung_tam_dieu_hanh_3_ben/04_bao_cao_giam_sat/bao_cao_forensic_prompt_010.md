===== BÁO CÁO FORENSIC SỰ CỐ KHÔI PHỤC PHIÊN ĐĂNG NHẬP CHỦ QUÁN (PROMPT-010) =====

1. BẰNG CHỨNG PHÂN TÍCH LUỒNG KHỞI ĐỘNG (APP STARTUP FLOW)
- Khi ứng dụng khởi động lại (`main.dart`), `Firebase.initializeApp()` chạy thành công.
- Tầng Firebase Authentication SDK lưu và khôi phục phiên người dùng tự động trong bộ nhớ cục bộ (`FirebaseAuth.instance.currentUser != null`).
- Tuy nhiên, trong `lib/main.dart`:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F&B Smart V5',
      theme: ThemeData(...),
      home: const PhoneLoginView(), // <--- LỖI CỐ ĐỊNH ROUTE KHỞI ĐỘNG
    );
  }
}
```

2. NGUYÊN NHÂN GỐC (ROOT CAUSE)
- Trong `lib/main.dart`, thuộc tính `home` của `MaterialApp` được gán cứng cố định là `const PhoneLoginView()`.
- Khi ứng dụng bị thoát và mở lại, ứng dụng không kiểm tra `FirebaseAuth.instance.currentUser`, không lắng nghe `authStateChanges()`, và không truy vấn dữ liệu membership/store của người dùng trên Firestore.
- Mặc dù phiên đăng nhập Firebase Auth vẫn tồn tại đầy đủ, giao diện ứng dụng luôn hiển thị màn hình đăng nhập SĐT (`PhoneLoginView`), làm cho Chủ quán bị đẩy về luồng tạo quán ban đầu.

3. ĐỀ XUẤT SỬA ĐỔI (RECOMMENDED FIX)
- Tạo component `AuthStartupGateway` (Cổng điều hướng khởi động):
  + Lắng nghe `FirebaseAuth.instance.authStateChanges()`.
  + Nếu `currentUser == null`: Hiển thị `PhoneLoginView`.
  + Nếu `currentUser != null`: Truy vấn Firestore kiểm tra membership của người dùng (`/stores/{storeId}/members/{uid}`):
    * Nếu có membership `status == 'active'` & `role == 'role_owner'`: Chuyển trực tiếp tới `DashboardPlaceholderView`.
    * Nếu có membership `status == 'pending'`: Chuyển tới `PendingApprovalView`.
    * Nếu chưa có store/membership nào: Chuyển tới `RoleSelectionView`.
- Cập nhật `lib/main.dart`: Gán `home: const AuthStartupGateway()`.
