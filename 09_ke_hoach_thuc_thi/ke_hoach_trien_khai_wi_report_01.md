# KẾ HOẠCH TRIỂN KHAI CHI TIẾT WI-REPORT-01 / WI-ANALYTICS-01

## 1. MỤC TIÊU WORK ITEM
Xây dựng phân hệ **TỔNG QUAN HÔM NAY (Today's Summary & Reports)** giúp Chủ quán / Quản lý theo dõi trực quan các chỉ số vận hành và tài chính thời gian thực trong ngày theo chuẩn Master Specification V5.1 (§18) và Discovery V5.1 (Prompt 099).

## 2. PHẠM VI CHỈ SỐ BẮT BUỘC (REQUIRED METRICS & FORMULAS)
### A. Nhóm Doanh thu & Thu tiền
- **Doanh thu bán hàng:** $\text{DoanhThu} = \text{Tạm tính (Subtotal)} - \text{Giảm giá (Discounts)}$
- **Đã thu (Collected):** Tổng tiền thanh toán thực nhận bằng Tiền mặt + Chuyển khoản payOS (`Cash + QR`). Tuyệt đối KHÔNG cộng tiền ghi nợ vào Đã thu (`Đã thu ≠ Ghi nợ`).
- **Ghi nợ (Debt Recorded):** Tổng dư nợ khách hàng ghi sổ trong ngày (`Ghi nợ ≠ Đã thu`).
- **Còn phải thu (Uncollected Balance):** Tổng giá trị các đơn hàng/bàn đang phục vụ chưa chốt hóa đơn/thanh toán (`Còn phải thu ≠ Nợ`).

### B. Nhóm Két tiền mặt (A6 Locked Formula)
- **Tiền mặt trong két:**
  $$\text{ExpectedCash} = \text{OpeningCash} + \text{PhysicalCashCollected} + \text{CashIn} - \text{CashOut}$$

### C. Nhóm Bàn & Đơn hàng
- **Thống kê bàn:** Số bàn đang có khách (`Occupied`), Bàn chờ dọn (`Cleaning`), Bàn trống (`Available`).
- **Tổng đơn hàng:** Tổng số đơn hàng được khởi tạo trong ngày (`Total Orders`).

### D. Nhóm Ca làm việc hiện tại
- **Đối soát ca:** Tiền đầu ca, Tiền mặt dự kiến, Tiền mặt thực tế đếm được, Chênh lệch (`Variance`).

## 3. VỊ TRÍ GIAO DIỆN (UI LOCATION)
- **Tùy chọn 1 (Khuyên dùng):** Render trực tiếp các Thẻ chỉ số "Tổng quan hôm nay" (`TodaysSummaryCardWidget`) trên Dashboard chính của cửa hàng dưới dạng At-a-Glance Overview.
- **Tùy chọn 2:** Bổ sung nút "BÁO CÁO CHI TIẾT (REPORTS DASHBOARD)" dẫn sang màn hình `TodaysSummaryView` riêng biệt.
- **Trạng thái:** `NEEDS PO DECISION` (Để PO lựa chọn giữa hiển thị trực tiếp trên Dashboard hay mở màn hình Báo cáo riêng).

## 4. NGUỒN DỮ LIỆU & FIRESTORE PATHS
- `/stores/{storeId}/orders` (`status`, `totalAmount`, `createdAt`)
- `/stores/{storeId}/invoices` (`totalAmount`, `status`, `createdAt`)
- `/stores/{storeId}/settlements` (`amount`, `method`, `createdAt`)
- `/stores/{storeId}/shifts` (`openingCash`, `cashSales`, `cashIn`, `cashOut`, `expectedCash`, `closingCash`, `variance`)
- `/stores/{storeId}/cashEntries` (`entryType`, `amount`)
- `/stores/{storeId}/tables` & `/stores/{storeId}/tableStates` (`state`)
- `/stores/{storeId}/debtAccounts` (`outstandingAmount`)

## 5. KHUNG THỜI GIAN (TIME WINDOW)
- Lọc theo ngày kinh doanh hiện tại (`businessDate` YYYY-MM-DD) hoặc khoảng thời gian từ `00:00` đầu ngày đến thời điểm hiện tại (`createdAt >= startOfDayTimestamp`).

## 6. PHÂN QUYỀN (PERMISSIONS)
- Quyền truy cập báo cáo tài chính: Dành cho `view_financials` hoặc `role_owner` / `role_manager`.

## 7. CÁC CÔNG VIỆC NGOÀI PHẠM VI (DEFERRED POST-MVP)
- Xuất file Excel / PDF (Giáng cấp xuống Post-MVP theo §18.4).
- Báo cáo Giá vốn / Lợi nhuận (COGS / Margin) (Giáng cấp xuống Post-MVP theo §18.4).

## 8. ĐỀ XUẤT THỨ TỰ CÁC PROMPT TRIỂN KHAI FUTURE
- `PROMPT-049`: Xây dựng `TodaysSummaryService` thực hiện truy vấn và tính toán dữ liệu tổng quan hôm nay từ Firestore.
- `PROMPT-050`: Xây dựng UI Widget `TodaysSummaryCardsWidget` & `TodaysSummaryView` hiển thị các thẻ chỉ số (Doanh thu, Đã thu, Ghi nợ, Két tiền, Bàn & Đơn).
- `PROMPT-051`: Tích hợp Dashboard, chạy analyze, test, build APK, deploy lên M51 & Note 8 và chuẩn bị PO Test.

## 9. TRẠNG THÁI KẾ HOẠCH
READY FOR PO APPROVAL — CHƯA CODE
