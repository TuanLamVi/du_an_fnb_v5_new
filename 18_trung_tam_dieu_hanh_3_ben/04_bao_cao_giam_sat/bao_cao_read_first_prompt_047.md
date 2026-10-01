===== BÁO CÁO READ-FIRST XÁC ĐỊNH ĐẶC TẢ TỔNG QUAN HÔM NAY (PROMPT-047) =====

1. MỤC TIÊU & TÀI LIỆU CĂN CỨ
- Work Item: `WI-REPORT-01 / WI-ANALYTICS-01 — Today's Summary & Reports (Tổng quan hôm nay, Báo cáo Doanh thu & Két tiền)`
- Căn cứ: `REPORTS_ANALYTICS_DISCOVERY_V5.1.md` (Prompt 099), `CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` §18, `DATABASE_SCHEMA_V0.1.md` §1.3, §3.2, §9, §10, `STATE_MACHINES_V0.1.md`.

2. CHỈ SỐ BẮT BUỘC & CÔNG THỨC CHÍNH THỨC
- **Doanh thu bán hàng (Sales Revenue):**
  $$\text{Subtotal (Tạm tính)} - \text{Discounts (Giảm giá)} = \text{Doanh thu bán hàng}$$
- **Đã thu (Collected Amount):**
  Tổng tiền mặt thực tế + Chuyển khoản payOS QR thực tế (`Cash + QR`). Tuyệt đối KHÔNG cộng Tiền ghi nợ vào Đã thu (`Đã thu ≠ Ghi nợ`).
- **Ghi nợ (Debt Recorded):**
  Tổng số tiền nợ phát sinh trong ngày (`Ghi nợ ≠ Đã thu`).
- **Còn phải thu (Uncollected Balance):**
  Tổng giá trị các đơn hàng/bàn đang phục vụ chưa tính tiền/chưa chốt hóa đơn (`Còn phải thu ≠ Nợ`).
- **Tiền mặt trong két (Cash Drawer Balance A6 Locked):**
  $$\text{ExpectedCash} = \text{OpeningCash} + \text{PhysicalCashCollected} + \text{CashIn} - \text{CashOut} - \text{Drops} \pm \text{Adjustments}$$
- **Bàn & Đơn:**
  Số bàn đang phục vụ (`Occupied`), Bàn chờ dọn (`Cleaning`), Bàn trống (`Available`), và Tổng số đơn hàng trong ngày.
- **Ca hiện tại:**
  Tiền đầu ca, Tiền mặt dự kiến, Tiền mặt thực tế, Chênh lệch (`Variance`).

3. NGUỒN DỮ LIỆU & FIRESTORE PATHS
- `/stores/{storeId}/orders` (`status`, `totalAmount`, `createdAt`)
- `/stores/{storeId}/invoices` (`totalAmount`, `status`, `createdAt`)
- `/stores/{storeId}/settlements` (`amount`, `method`, `createdAt`)
- `/stores/{storeId}/shifts` (`openingCash`, `cashSales`, `cashIn`, `cashOut`, `expectedCash`, `closingCash`, `variance`)
- `/stores/{storeId}/cashEntries` (`entryType`, `amount`)
- `/stores/{storeId}/tables` & `/stores/{storeId}/tableStates` (`state`)
- `/stores/{storeId}/debtAccounts` (`outstandingAmount`)

4. KHUNG THỜI GIAN (TIME WINDOW)
- Tính theo ngày kinh doanh hiện tại (`businessDate` YYYY-MM-DD) hoặc thời gian trong ngày từ `00:00` đến thời điểm hiện tại theo timezone cửa hàng.

5. YÊU CẦU UI & PHÂN QUYỀN
- Hiển thị các thẻ chỉ số trực quan tại Dashboard / Màn hình Báo cáo:
  1. Thẻ Doanh thu & Thu tiền (Sales Revenue, Collected, Debt, Uncollected)
  2. Thẻ Két tiền mặt (Cash Drawer A6 Synced)
  3. Thẻ Vận hành Bàn & Đơn (Occupied, Cleaning, Available, Total Orders)
  4. Thẻ Ca hiện tại (Opening Cash, Expected, Actual, Variance)
- Phân quyền: Dành cho `view_financials` hoặc `role_owner` / `role_manager`.

6. THIẾU SÓT & TÀI LIỆU CHƯA QUY ĐỊNH (DEFERRED FEATURES)
- Xuất file Excel/PDF giáng cấp xuống Post-MVP (chỉ xem trên màn hình và in tóm tắt qua máy in bill).
- Báo cáo Giá vốn / Lợi nhuận (COGS / Margin) giáng cấp xuống Post-MVP.

7. KẾT LUẬN & ĐỀ XUẤT
- Đã xác định 100% căn cứ đặc tả.
- CHƯA VIẾT CODE, CHƯA SỬA SOURCE, CHƯA BUILD.
- Chờ PO chỉ định bắt đầu lập Kế hoạch triển khai chi tiết cho WI-REPORT-01 / WI-ANALYTICS-01.
