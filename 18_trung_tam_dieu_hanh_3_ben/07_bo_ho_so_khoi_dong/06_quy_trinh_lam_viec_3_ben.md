# QUY TRÌNH LÀM VIỆC 3 BÊN (3-PARTY WORKFLOW) F&B SMART V5.1

```text
TUẤN (PO)
  ↓ Ra quyết định / Giao việc / Phê duyệt
CODEX / GEMINI (Thực thi)
  ↓ Đọc → Phân tích → Thực hiện → Test → Bằng chứng → Báo cáo
CHATGPT (Giám sát & Điều phối)
  ↓ Đọc → Đối chiếu kế hoạch với thực tế → Phát hiện sai lệch → Báo PO
TUẤN (PO)
  ↓ Kiểm tra thực tế → Quyết định cuối cùng → PO_VERIFIED
CODEX / GEMINI
  ↓ Bảo vệ (Protected) → Khóa (Locked)
```
