===== BÁO CÁO FORENSIC SỰ CỐ KHÔNG MỞ ĐƯỢC QUICK SETUP WIZARD (PROMPT-010 PO TEST FAILURE) =====

1. MÔ TẢ LỖI
Khi PO bấm vào nút "MỞ WIZARD KHỞI TẠO QUÁN NHANH" trên Dashboard:
- Ứng dụng không phản ứng;
- Dialog QuickSetupWizardDialog không xuất hiện;
- Không có phản hồi hay thông báo cho người dùng.

2. PHÂN TÍCH FORENSIC LUỒNG CODE (`dashboard_placeholder_view.dart`)

a) Nút bấm & Callback (`onPressed`):
Trong `dashboard_placeholder_view.dart`:
```dart
ElevatedButton.icon(
  onPressed: _openQuickSetupDialog,
  icon: const Icon(Icons.rocket_launch),
  label: const Text('MỞ WIZARD KHỞI TẠO QUÁN NHANH'),
)
```
-> Nút bấm được render và gắn callback `_openQuickSetupDialog`.

b) Hàm `_openQuickSetupDialog`:
```dart
void _openQuickSetupDialog() {
  if (!mounted) return;
  User? user = _authRepository.currentUser;
  if (_storeId == null || user == null) return; // <--- ĐIỂM CHẶN IM LẶNG (SILENT EXIT)

  showDialog(...);
}
```
-> Khi `_storeId == null`, hàm `_openQuickSetupDialog()` gặp điều kiện `_storeId == null` và THOÁT NGAY LẬP TỨC (`return`), không gọi `showDialog` và không đưa ra bất kỳ thông báo hay log nào cho người dùng.

c) Tại sao `_storeId` bị `null`?
Trong hàm `_checkStoreAndSetup()`:
- Hàm truy vấn Firestore bằng `collectionGroup('members').where('uid', isEqualTo: user.uid).where('status', isEqualTo: 'active')`.
- Toàn bộ luồng nằm trong khối `try { ... } catch (_) {}` im lặng nuốt mọi ngoại lệ (silent catch).
- Nếu truy vấn `collectionGroup` trả về rỗng (do chưa kịp index hoặc delay đồng bộ sau khi vừa tạo Store) hoặc gặp ngoại lệ, khối `catch (_)` chạy và gán `_isLoading = false` mà KHÔNG gán giá trị cho `_storeId`.
- Dẫn đến giao diện hiển thị nút "MỞ WIZARD KHỞI TẠO QUÁN NHANH", nhưng biến state `_storeId` bị `null`, khiến mọi lần bấm vào nút đều bị chặn im lặng.

3. NGUYÊN NHÂN GỐC (ROOT CAUSE)
- Nguyên nhân chính: `_openQuickSetupDialog()` thoát im lặng khi `_storeId == null` mà không thông báo hoặc re-fetch.
- Nguyên nhân phụ: `_checkStoreAndSetup()` chỉ dựa vào `collectionGroup('members')` và nuốt ngoại lệ im lặng. Khi luồng truy vấn `collectionGroup` chưa trả về kết quả, `_storeId` giữ giá trị `null`, làm vỡ liên kết giữa nút bấm và lệnh `showDialog`.

4. ĐOẠN CODE/FILE LIÊN QUAN
- File: `lib/features/auth/views/dashboard_placeholder_view.dart`
- Đoạn code: `_checkStoreAndSetup()` (dòng 35-78) và `_openQuickSetupDialog()` (dòng 87-105).

5. ĐỀ XUẤT SURGICAL FIX (ĐÃ SẴN SÀNG)
- Bổ sung Fallback Query trong `_checkStoreAndSetup()`: Nếu `collectionGroup('members')` rỗng/lỗi, thực hiện truy vấn trực tiếp bảng `/stores` với điều kiện `createdBy == user.uid` để lấy `storeId` cho Chủ quán.
- Bổ sung Re-fetch & SnackBar trong `_openQuickSetupDialog()`: Khi `_storeId == null`, tự động chạy lại tìm `storeId` hoặc thông báo SnackBar thay vì thoát im lặng.
- Bỏ nuốt ngoại lệ im lặng trong `_checkStoreAndSetup()`.

6. FORENSIC STATUS
FORENSIC STATUS: READY FOR SURGICAL FIX
