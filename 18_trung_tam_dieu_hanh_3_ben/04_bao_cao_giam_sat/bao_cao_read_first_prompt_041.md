===== BÁO CÁO PHÂN TÍCH NGHIỆP VỤ CASH IN & CASH OUT (PROMPT-041) =====

A. CASH IN — ĐỊNH NGHĨA NGHIỆP VỤ:
- Hành vi bổ sung/nạp thêm tiền mặt trực tiếp vào két tiền trong quá trình ca đang diễn ra (ví dụ: nạp thêm tiền lẻ thối tiền, bổ sung tiền quỹ két giữa ca).

B. CASH OUT — ĐỊNH NGHĨA NGHIỆP VỤ:
- Hành vi rút/trích bớt tiền mặt ra khỏi két tiền trong quá trình ca đang diễn ra (ví dụ: chi trả tiền nhập thực phẩm/đá lẻ tận nơi, chi phí vận hành khẩn cấp tại quán, hoặc rút bớt tiền mặt cất két an toàn / Cash Drop).

C. NGƯỜI THỰC HIỆN:
- Thu ngân (Cashier), Quản lý (Manager), hoặc Chủ quán (Owner) đang đứng ca mở (`status == 'open'`).

D. THỜI ĐIỂM THỰC HIỆN:
- Bất kỳ lúc nào sau khi Mở ca (`Open Shift`) và trước khi Đóng ca (`Close Shift`).

E. UI LOCATION:
- Nằm trên Thẻ Quản lý Ca (`Shift Status Card`) tại Màn hình Dashboard / Trang chủ chính của cửa hàng.

F. PERMISSION:
- Quyền vận hành két tiền / quản lý ca (`manage_shift` hoặc active owner/cashier in shift).

G. DATA MODEL / FIRESTORE PATH:
- Path: `/stores/{storeId}/cashEntries/{cashEntryId}`
- Fields: `entryId`, `storeId`, `shiftId`, `entryType` (`cash_in` | `cash_out`), `amount` (int > 0), `reason` (String), `createdBy`, `createdAt`.

H. EXPECTED CASH IMPACT:
- Công thức: ExpectedCash = OpeningCash + CashSales + CashIn - CashOut
- Cash In: Cộng thêm vào tiền mặt dự kiến cuối ca.
- Cash Out: Trừ bớt khỏi tiền mặt dự kiến cuối ca.

I. LỊCH SỬ GIAO DỊCH:
- Mỗi giao dịch Cash In / Cash Out lưu thành 1 document độc lập tại subcollection `cashEntries` phục vụ minh bạch kiểm toán và hiển thị trong báo cáo tổng kết ca.

J. NHỮNG ĐIỂM TÀI LIỆU CHƯA QUY ĐỊNH (GAPS):
- Quy trình phê duyệt cấp Manager riêng biệt cho Cash Out lớn: `NOT DEFINED IN CURRENT PROJECT DOCUMENTATION` (Hiện tại cho phép ghi nhận trực tiếp gắn kèm `reason`).

K. RECOMMENDED NEXT IMPLEMENTATION SCOPE:
- Bổ sung 2 nút thao tác "NẠP TIỀN KÉT (CASH IN)" và "RÚT TIỀN KÉT (CASH OUT)" trên Thẻ trạng thái Ca ở Dashboard.
- Khi người dùng bấm, hiển thị `CashInOutDialog` nhập số tiền & lý do, lưu vào `cashEntries` và lập tức cập nhật vào tổng Expected Cash khi Close Shift.
