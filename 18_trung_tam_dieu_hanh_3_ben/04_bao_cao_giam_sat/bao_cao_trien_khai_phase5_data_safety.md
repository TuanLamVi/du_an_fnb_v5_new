# BÁO CÁO TRIỂN KHAI PHIÊN BẢN PHASE 5 — AN TOÀN DỮ LIỆU — PROMPT-125

**FEATURE:** QUẢN LÝ KHU VỰC / BÀN / MÓN / TOPPING
**PHASE:** PHASE 5 — AN TOÀN DỮ LIỆU (DATA SAFETY)
**MODE:** SURGICAL FIX (CRITICAL & HIGH)
**NGÀY:** 2026-10-03
**NGƯỜI THỰC HIỆN:** CODEX / GEMINI

---

## 1. TỔNG QUAN HẠNG MỤC TRIỂN KHAI

### A. CRITICAL-01 — ĐÃ XỬ LÝ
- **Lỗi cũ:** POS nạp danh sách sản phẩm chưa lọc `status == 'active'`, dẫn đến món tạm ngưng (`inactive`) vẫn hiển thị và đặt bán được.
- **Surgical Fix:** Trong `lib/features/pos/views/pos_ordering_view.dart`, bổ sung điều kiện `.where((p) => p.status == 'active')` cho `StreamBuilder` hiển thị sản phẩm trên POS.
- **Kết quả:** Món ăn có trạng thái `inactive` bị loại hoàn toàn khỏi menu POS.

### B. CRITICAL-02 — ĐÃ XỬ LÝ
- **Lỗi cũ:** `ProductRepository.deleteProduct()` thực hiện `delete()` trực tiếp mà không có Delete Guard kiểm tra đơn hàng chưa hoàn tất.
- **Surgical Fix:** Bổ sung bước kiểm tra trong `ProductRepository.deleteProduct()` để quét tất cả đơn hàng chưa đóng/hoàn tất (`status` thuộc `['active_unfenced', 'draft', 'submitted', 'preparing', 'open']`). Nếu tồn tại đơn hàng mở chứa món ăn đó, hệ thống chặn xóa và ném Exception với thông báo: *"Không thể xóa món ăn này vì đang nằm trong đơn hàng chưa hoàn tất."*
- **Kết quả:** Bảo vệ tuyệt đối món ăn khỏi bị xóa khi đang có khách sử dụng.

### C. HIGH-01 — ĐÃ XỬ LÝ
- **Lỗi cũ:** Modal chọn topping cho món ăn trên POS hiển thị cả các topping bị tạm ngưng (`active == false`).
- **Surgical Fix:** Trong `lib/features/pos/views/pos_ordering_view.dart`, lọc danh sách `product.toppings` chỉ lấy những topping có `active != false` khi dựng UI modal chọn topping.
- **Kết quả:** Topping tạm ngưng bị ngắt khỏi danh sách chọn bán trên POS.

### D. HIGH-02 — ĐÃ XỬ LÝ & FIRESTORE RULES DEPLOYED
- **Cập nhật Rules:** Sửa `firestore.rules` phân tách quyền đối với `categories`, `products`, `productionStations`, `toppings`:
  - `allow create, update: if canManageMenu(storeId);`
  - `allow delete: if isStoreActiveOwner(storeId);`
- **Kết quả:** Ngăn chặn tuyệt đối việc client dùng quyền Manager hoặc API trực tiếp phát lệnh hard delete document catalog khỏi Firestore.
- **Deployment:** Đã deploy thành công lên Firebase project `fnb-smart`:
  - Command: `npx -y firebase-tools deploy --only firestore:rules --project fnb-smart`
  - Status: `Deploy complete!`

---

## 2. KẾT QUẢ AUTOMATED TESTS & BUILD

- **Static Analysis:** `flutter analyze` PASS (0 errors).
- **Unit Tests:** `flutter test` PASS (173/173 unit tests PASS, bao gồm test suite `test/phase5_data_safety_test.dart`).
- **Build APK Debug:**
  - Build Task: `flutter build apk --debug`
  - APK Output: `build\app\outputs\flutter-apk\app-debug.apk`
  - SHA256: `B32B1A9CE859B64D5C294BB5448FE25E9DACDA82746D6CA976E7792D6EBE8C25`
- **Device Verification:** Đã cài đặt (`install -r`) thành công lên thiết bị Samsung Note 8 (`988e50385a3931435330`).

---

## 3. LỊCH SỬ DỮ LIỆU & REGRESSION VERIFICATION

1. **Snapshot Bất biến:** Mọi thay đổi giá, đổi tên hay đặt `status: 'inactive'` trên sản phẩm/topping KHÔNG BAO GIỜ làm ảnh hưởng đến `OrderLineModel`, `InvoiceLineModel`, `KitchenTicketModel` hay `TransactionDetailView` của các giao dịch quá khứ.
2. **Regression Check:** Toàn bộ các module Phase 1-4 (Zone, Table, Category, Product, Topping, Permissions, POS, KDS, Payment, Invoice, Audit Trail) hoạt động ổn định và không gặp hồi quy.

===== END BÁO CÁO TRIỂN KHAI PHASE 5 =====
