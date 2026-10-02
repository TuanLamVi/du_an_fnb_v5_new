# Cửa Ngõ Nguồn Làm Việc (Working Source Gateway) — F&B SMART V5.1

Tài liệu này xác lập cổng kiểm soát và định nghĩa nghiêm ngặt nguồn làm việc chính thức duy nhất cho dự án F&B SMART V5.1, đảm bảo tính nhất quán và bảo mật thông tin.

## 1. Nguồn Hồ Sơ Chính Thức (Official Documentation Source)
Toàn bộ tài liệu, quy định, thiết kế, và hồ sơ dự án phải được đọc và tham chiếu từ:
`C:\Users\Admin\Desktop\Android\ho so du an fnb`

## 2. Nguồn Source Ứng Dụng Chính Thức (Official Application Source Code)
Toàn bộ mã nguồn ứng dụng (application source code) được đặt tại:
`C:\Users\Admin\Desktop\Android\fnb-smart-v5`

## 3. Nguồn Cũ — Ngoài Phạm Vi (Out of Scope Legacy Sources)
Mọi tài liệu, kho lưu trữ (repository), hoặc mã nguồn cũ trước đây, đặc biệt bao gồm:
`TuanLamVi/boquytacfnb`
và bất kỳ tài liệu/source cũ nào ngoài hai đường dẫn tại mục 1 và mục 2 đều được phân loại là **ngoài phạm vi làm việc**.

**Quy định:**
- Không đọc, không tìm kiếm, không tham chiếu, không sử dụng nguồn cũ.
- Không dùng nguồn cũ để lấp chỗ trống khi thiếu thông tin.
- Không đồng bộ thay đổi vào nguồn cũ.

## 4. Quy Tắc Đọc Trước (Read-First Rule)
Trước khi bắt đầu bất kỳ Work Item (nhiệm vụ công việc) hoặc thao tác nào, hệ thống AI (Codex/Gemini) phải:
1. Đọc bộ hồ sơ mới tại `ho so du an fnb`.
2. Xác định tài liệu liên quan trực tiếp đến công việc.
3. Đọc các quy định bắt buộc (Mandatory Regulations) trước khi thực hiện.
4. Xác nhận rõ nguồn thông tin đang sử dụng thuộc phạm vi chính thức.

## 5. Quy Tắc Khi Thiếu Thông Tin (Missing Information Protocol)
Nếu bộ hồ sơ mới không chứa đủ thông tin cần thiết để thực hiện công việc:
- Trạng thái: **CHƯA ĐỦ THÔNG TIN** (`UNPROVEN / BLOCKED`).
- Dừng ngay phần công việc phụ thuộc vào thông tin đó.
- Báo cáo rõ ràng đang thiếu tài liệu hoặc thông số nào.
- Chờ Product Owner (PO - Người quyết định sản phẩm) là anh Tuấn quyết định hoặc bổ sung.
- Nghiêm cấm tự suy đoán hoặc quay lại nguồn cũ để lấy thông tin.

## 6. Quy Tắc Khi Phát Hiện Xung Đột (Conflict Resolution Protocol)
Nếu phát hiện mâu thuẫn giữa hồ sơ mới và source mới, hoặc giữa các tài liệu chính thức với nhau (`Hồ sơ mới ≠ source mới`):
- **DỪNG ngay lập tức.**
- Không tự ý chọn một bên hay tự sửa đổi.
- Báo cáo chi tiết theo biểu mẫu xung đột để PO xem xét và quyết định.

## 7. Quy Tắc Về Thay Đổi Phạm Vi (Scope Change Control)
Mọi yêu cầu thay đổi phạm vi (Scope Change), thay đổi cấu trúc, hoặc bổ sung chức năng ngoài baseline (đường cơ sở) hiện hành bắt buộc phải có sự phê duyệt trực tiếp từ PO (Tuấn). AI không được tự ý quyết định.
