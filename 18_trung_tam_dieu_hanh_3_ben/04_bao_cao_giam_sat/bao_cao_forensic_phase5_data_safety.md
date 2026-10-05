# BÁO CÁO FORENSIC AN TOÀN DỮ LIỆU — PROMPT-124

**FEATURE:** QUẢN LÝ KHU VỰC / BÀN / MÓN / TOPPING
**PHASE:** PHASE 5 — AN TOÀN DỮ LIỆU (DATA SAFETY)
**MODE:** READ-FIRST / FORENSIC ONLY
**NGÀY:** 2026-10-03
**NGƯỜI THỰC HIỆN:** CODEX / GEMINI

---

## 1. KẾT QUẢ READ-FIRST
- **Hồ sơ tham chiếu:**
  - `KIM_CHI_NAM.md` & `SOURCE_OF_TRUTH.md` (00_tong_quan_va_quan_ly/ban_do_nguon_su_that.md)
  - `CURRENT_STATE.md` (18_trung_tam_dieu_hanh_3_ben/02_bang_dieu_hanh/trang_thai_du_an.md)
  - `Product Charter` & `01_san_pham/feature_roadmap_quan_ly_khu_vuc_ban_mon_topping.md`
  - `Database Schema` & `Firestore Query Cost Budget`
  - `State Machines` (03_quy_tac_nghiep_vu_va_trang_thai)
  - Các Báo cáo Close-out Phase 1, 2, 3 & 4 (PROMPT-097 đến PROMPT-123)
- **Kết quả Read-First:** PASS (Đã hoàn tất kiểm tra 100% tài liệu bắt buộc).

---

## 2. KẾT QUẢ KIỂM TRA PHÂN NĂNG (FORENSIC FINDINGS)

### A. KHU VỰC (ZONE) — [GAP]
1. **Xóa Khu vực (Zone Delete):**
   - `TableRepository.deleteZone()` đã có Delete Guard kiểm tra nếu còn Bàn (`where('zoneId', isEqualTo: zoneId)`). Nếu còn bàn thì chặn xóa bằng Exception.
   - Khi khu vực trống (không có bàn), cho phép xóa cứng document khu vực.
2. **Đổi tên/Sửa/Thứ tự (Zone Update/Rename):**
   - Bàn tham chiếu `zoneId`. Tên khu vực được load realtime theo `zoneId`. Đổi tên khu vực sẽ tự cập nhật trên UI quản lý bàn.
   - **Tác động đơn hàng/lịch sử cũ:** Đơn hàng (`OrderModel`) và Hóa đơn (`InvoiceModel`) KHÔNG lưu trữ `zoneId` hay `zoneName` (chỉ lưu `tableId` và `tableName`). Do đó, đổi tên/xóa Khu vực HOÀN TOÀN KHÔNG làm sai hay ảnh hưởng đến lịch sử hóa đơn.
3. **Soft Delete / Inactive:**
   - `ZoneModel` hiện chưa có cờ `active` / `isDeleted`. Chỉ có cơ chế xóa cứng khi không còn bàn.

---

### B. BÀN (TABLE) — [GAP]
1. **Xóa Bàn (Table Delete):**
   - `TableRepository.deleteTable()` đã có Guard kiểm tra trạng thái hoạt động: Chặn xóa bàn đang có khách (`occupied`), đang dọn (`cleaning`), đang đặt (`reserved`), hoặc đang gắn với đơn hàng mở (`currentOrderId != null`).
   - **Lỗ hổng (Gap):** Nếu bàn ở trạng thái Trống (`available`), hệ thống cho phép xóa cứng document `/tables/{tableId}` và `/tableStates/{tableId}`.
2. **Ảnh hưởng lịch sử đơn hàng cũ:**
   - Đơn hàng đã đóng/thanh toán (`orders`, `invoices`) lưu trữ `tableId` cố định. Màn hình KDS (`KitchenTicketModel`) lưu snapshot chuỗi tên bàn (`tableName: "Bàn 01"`) tại thời điểm gửi đơn.
   - Tuy nhiên, nếu một bàn đã xóa từng phục vụ hàng trăm đơn hàng trong quá khứ, việc mất document bàn sẽ làm cho các truy vấn tra cứu thông tin chi tiết Bàn từ ID bị lỗi/không tìm thấy document.
3. **Soft Delete / Inactive:**
   - `TableModel` chưa có cờ `status == 'inactive'` hay `isDeleted`. Cần bổ sung cờ ngưng hoạt động thay vì xóa hẳn document.

---

### C. DANH MỤC (CATEGORY) — [SAFE / GAP]
1. **Xóa Danh mục (Category Delete):**
   - `CategoryRepository.deleteCategory()` đã có Delete Guard kiểm tra sản phẩm (`where('categoryId', isEqualTo: categoryId)`). Nếu còn sản phẩm thì chặn xóa.
2. **Đổi tên Danh mục (Category Rename):**
   - Đơn hàng (`OrderLineModel`) và Hóa đơn (`InvoiceLineModel`) lưu trực tiếp `name` (tên món), `unitPrice`, `sizeName`, `toppings`, `options`, `subtotal` làm snapshot độc lập.
   - `OrderLineModel` KHÔNG phụ thuộc vào `categoryId` hay `categoryName`. Đổi tên hay xóa Danh mục KHÔNG làm thay đổi bất kỳ hóa đơn/lịch sử cũ nào.
3. **Soft Delete / Inactive:**
   - `CategoryModel` chưa có cờ `active` / `status`.

---

### D. MÓN ĂN (PRODUCT) — [CRITICAL / GAP]
1. **Xóa Món ăn (Product Delete) — [CRITICAL GAP]:**
   - `ProductRepository.deleteProduct()` hiện tại thực hiện lệnh `delete()` trực tiếp mà **KHÔNG CÓ DELETE GUARD**!
   - Nếu Quản lý chọn xóa món "Bún bò Huế", document `/products/{productId}` bị xóa cứng khỏi Firestore.
   - *Đánh giá an toàn lịch sử:* `OrderLineModel` và `InvoiceLineModel` đã lưu Snapshot dữ liệu độc lập (`name`, `unitPrice`, `sizeName`, `toppings`), nên lịch sử hóa đơn cũ vẫn hiển thị "Bún bò Huế" 50.000đ chuẩn xác. Tuy nhiên, việc xóa mất document sản phẩm sẽ làm gãy các báo cáo phân tích/tra cứu sản phẩm theo ID.
2. **Trạng thái Tạm ngưng (Product Inactive) — [CRITICAL GAP]:**
   - `ProductModel` có trường `status: 'active' | 'inactive'`.
   - `ProductManagementView` cho phép chuyển trạng thái món sang `'inactive'`.
   - **LỖ HỔNG NGHIÊM TRỌNG:** Giao diện bán hàng POS (`PosOrderingView`) hiện tại **CHƯA LỌC** `status == 'active'` khi nạp danh sách món! Món ăn đã bị đánh dấu "Tạm ngưng" (`inactive`) VẪN HIỂN THỊ trên danh mục POS và VẪN CHO PHÉP NHÂN VIÊN CHỌN BÁN!

---

### E. NƠI CHẾ BIẾN (PRODUCTION STATION) — [SAFE / GAP]
1. **Xóa Nơi chế biến (Station Delete):**
   - `ProductionStationRepository.deleteStation()` đã có Delete Guard kiểm tra sản phẩm đang gán (`where('stationId', isEqualTo: stationId)`). Chặn xóa nếu còn món ăn.
2. **Đổi tên Nơi chế biến (Station Rename):**
   - Đổi tên Nơi chế biến (ví dụ "Bếp nóng" → "Bếp chính") chỉ thay đổi thông tin hiển thị trên sơ đồ cấu hình. Vé bếp KDS (`KitchenTicketModel`) lưu `stationId` và chi tiết món. Đơn hàng/Hóa đơn không phụ thuộc tên station.
3. **Trạng thái Tạm ngưng:**
   - `ProductionStationModel` có cờ `active: true/false`.

---

### F. TOPPING — [HIGH / GAP]
1. **Sửa giá / Tạm ngưng / Xóa Topping:**
   - **Sửa giá:** Topping "Chả cua" đổi giá từ 10.000đ → 12.000đ trong thư viện Topping.
     - `OrderLineModel.toppings` và `InvoiceLineModel.toppings` lưu snapshot mảng `{name: "Chả cua", price: 10000, qty: 1}` tại thời điểm đặt hàng.
     - Đơn hàng cũ VẪN GIỮ NGUYÊN 10.000đ. Đơn cũ HOÀN TOÀN AN TOÀN & BẤT BIẾN!
   - **Xóa Topping:** `ToppingRepository.deleteTopping()` kiểm tra xem topping có đang được món ăn nào gán không. Chặn xóa nếu đang sử dụng.
   - **Tạm ngưng Topping (Inactive Leak) — [HIGH GAP]:**
     - `ToppingModel` có cờ `active: true/false`.
     - Tuy nhiên, trong `PosOrderingView` (modal chọn topping), hệ thống hiển thị toàn bộ mảng `product.toppings` mà chưa lọc bỏ các topping có `active == false`.

---

### G. FIRESTORE DATA SAFETY — [GAP]
1. **Delete Guards trên Rules:**
   - Security Rules cấp Firestore cho phép ghi/xóa đối với user có quyền `canManageMenu` hoặc `isStoreActiveOwner`.
   - Các Delete Guards hiện tại đang nằm ở cấp Flutter Repository. Nếu gọi API Firestore trực tiếp hoặc qua SDK client khác, Firestore Rules không chặn xóa cứng tài liệu.
2. **Audit Trail Immutability:**
   - Thư mục `/auditEvents/{eventId}` được bảo vệ tuyệt đối ở Rules với `allow update, delete: if false;` (Chống sửa/xóa 100%).

---

### H. POS / KDS / PAYMENT / HISTORY REGRESSION — [SAFE]
- Toàn bộ 4 module cốt lõi (POS, KDS, Payment, Sales History) đều sử dụng cơ chế **Data Snapshot** hoàn chỉnh:
  - `OrderLineModel`: Snapshot `name`, `unitPrice`, `sizeName`, `sizePriceExtra`, `toppings`, `options`, `subtotal`.
  - `InvoiceLineModel`: Snapshot đầy đủ chi tiết món.
  - `KitchenTicketModel` / `KitchenTicketLineModel`: Snapshot `tableName`, `productId`, `name`, `quantity`, `sizeName`, `toppings`.
  - `InvoiceModel`: Snapshot `cashierName`, `staffName`, tổng tiền, giảm giá.
- Mọi thao tác sửa giá, đổi tên, ngưng bán hay chuyển danh mục ở Phase 1-4 KHÔNG BAO GIỜ làm thay đổi hay sai lệch dữ liệu quá khứ.

---

## 3. PHÂN LOẠI MỨC ĐỘ NGUY CƠ (SEVERITY CLASSIFICATION)

### CRITICAL (2 vấn đề)
1. **CRIT-01 (POS Inactive Product Leak):** `PosOrderingView` không lọc `status == 'active'`, dẫn đến món ăn đã tạm ngưng (`inactive`) vẫn hiển thị trên màn hình POS và gọi món bình thường.
2. **CRIT-02 (Product Delete Without Guard):** `ProductRepository.deleteProduct()` cho phép xóa cứng document sản phẩm mà không có Delete Guard kiểm tra đơn hàng đang mở.

### HIGH (2 vấn đề)
1. **HIGH-01 (POS Inactive Topping Leak):** Modal chọn topping trên POS chưa lọc bỏ topping bị đánh dấu tạm ngưng (`active == false`).
2. **HIGH-02 (Firestore Direct Delete Risk):** Security Rules cho `categories`, `products`, `toppings`, `tables` cho phép xóa document nếu có quyền role, chưa chặn ở cấp Rules nếu chưa chuyển sang soft delete.

### MEDIUM (2 vấn đề)
1. **MED-01 (Table Hard Delete):** Bàn trống bị xóa cứng khỏi Firestore thay vì chuyển sang cờ `inactive` / `isDeleted`.
2. **MED-02 (Lack of Active Flag on Category & Zone):** Category và Zone chưa hỗ trợ cờ `active` / `isDeleted` để ẩn tạm thời.

### LOW (1 vấn đề)
1. **LOW-01 (Station Hard Delete when empty):** Nơi chế biến trống bị xóa cứng khỏi Firestore.

### SAFE (4 điểm sáng bảo vệ thành công)
1. **SAFE-01:** Snapshot dữ liệu lịch sử hóa đơn & vé bếp hoàn toàn bất biến.
2. **SAFE-02:** Nhật ký kiểm toán `auditEvents` chống sửa/xóa 100% ở Rules.
3. **SAFE-03:** Bàn đang phục vụ / có khách được bảo vệ chống xóa 100%.
4. **SAFE-04:** Delete Guards cho Category, Station, Topping hoạt động chuẩn xác ở cấp Repository.

---

## 4. ĐỀ XUẤT PHẠM VI IMPLEMENTATION PHASE 5

### ĐÃ AN TOÀN (Không cần sửa)
- Snapshot dữ liệu `OrderLineModel`, `InvoiceLineModel`, `KitchenTicketModel`.
- Quy tắc bảo mật Firestore Rules cho `auditEvents`.
- Logic bảo vệ Bàn đang có khách / đơn mở (`deleteTable`).
- Delete Guards cho Category, Station, Topping trong Repositories.

### CÒN THIẾU & CẦN SỬA (Scope đề xuất triển khai Phase 5)
1. **POS Product Filtering:** Thêm bộ lọc `p.status == 'active'` trong `PosOrderingView` để ngắt ngay các món tạm ngưng khỏi menu bán hàng.
2. **POS Topping Filtering:** Lọc bỏ topping `active == false` trong modal chọn topping bán hàng.
3. **Product Delete Guard & Soft Delete:** Bổ sung Delete Guard kiểm tra đơn mở cho Product, khuyến khích chuyển nút Xóa món thành chuyển trạng thái Tạm ngưng (`inactive`).
4. **Soft Delete / Inactive Flags:** Bổ sung cờ `active` / `isDeleted` cho Table & Category để hỗ trợ ngưng hoạt động mà vẫn bảo tồn document tham chiếu lịch sử.

---

## 5. GIT SAFETY & CONFIRMATION
- **Source Code Changed:** MUST BE NO (Đã xác minh không có file source code nào bị thay đổi trong PROMPT-124).
- **Branch:** `main`
- **HEAD Commit:** `215008d67dd55d03f2d0a989374cfb2b7bf3ff30`
- **Worktree:** Safe & Clean.

===== END BÁO CÁO FORENSIC PHASE 5 =====
