# SƠ ĐỒ TRẠNG THÁI HỆ THÔNG (SYSTEM STATE MACHINES) F&B SMART V5.1

Tổng hợp các máy trạng thái (State Machines) chuẩn hóa từ tài liệu `STATE_MACHINES_V0.1.md` và các discovery liên quan:

## 1. Domain: Bàn (Table State Machine)
- **Trạng thái:** `Available` (Trống) → `Occupied` (Đang phục vụ) → `Reserved` (Đặt trước) → `Cleaning` (Đang dọn dẹp).
- **Chuyển tiếp:**
  - `Available` + Mở đơn gọi món mới → `Occupied`.
  - `Occupied` + Thanh toán hoàn tất đơn hàng → `Cleaning`.
  - `Cleaning` + Nhân viên xác nhận dọn xong → `Available`.

## 2. Domain: Đơn hàng (Order State Machine)
- **Trạng thái:** `Draft` (Nháp) → `Submitted` (Đã gửi bếp) → `Preparing` (Đang chế biến) → `Completed` (Đã sẵn sàng/Hoàn thành) → `Paid` (Đã thanh toán) → `Cancelled` (Đã hủy).
- **Chuyển tiếp:**
  - `Draft` + Nhấn Gửi bếp → `Submitted`.
  - `Submitted` + Bếp nhận đơn → `Preparing`.
  - `Preparing` + Bếp hoàn tất món → `Completed`.
  - `Completed` / `Preparing` + Thanh toán thành công → `Paid`.

## 3. Domain: Nhà bếp KDS (Kitchen Order State Machine)
- **Trạng thái:** `New` (Mới) → `Cooking` (Đang nấu) → `Ready` (Sẵn sàng phục vụ) → `Served` (Đã phục vụ).

## 4. Domain: Ca làm việc (Shift State Machine)
- **Trạng thái:** `Closed` (Đóng ca) → `Opened` (Mở ca) → `Settled` (Đã quyết toán/Chốt ca).

## 5. Domain: Thanh toán (Payment State Machine)
- **Trạng thái:** `Pending` (Chờ thanh toán) → `Success` (Thành công) → `Failed` (Thất bại) → `Refunded` (Đã hoàn tiền).
