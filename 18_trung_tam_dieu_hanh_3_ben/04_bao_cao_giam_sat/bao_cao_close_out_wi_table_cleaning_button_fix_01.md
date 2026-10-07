# BÁO CÁO CLOSE-OUT WORK ITEM: WI-TABLE-CLEANING-BUTTON-FIX-01

- **Work Item ID**: `WI-TABLE-CLEANING-BUTTON-FIX-01`
- **Tên Work Item**: Table Cleaning DỌN BÀN Button Fix
- **Prompt liên quan**: PROMPT-305 / PROMPT-308
- **Phase**: Phase 3 (FEAT-TABLE-01)
- **Application Commit**: `35f3c7df7024b2dd6e29a97e18c1b064f228c9c8` (Repo: `fnb-smart-v5`, Branch: `main`)
- **Trạng thái**: `COMPLETED / PO_VERIFIED / PROTECTED / LOCKED`

---

## 1. MỤC TIÊU & PHẠM VI

- Thêm nút **DỌN BÀN** trực tiếp trong `TableActionDialog` (`lib/features/table/views/table_action_dialog.dart`).
- Cho phép thu ngân / nhân viên dọn bàn trạng thái bẩn (`dirty`) sau khi khách rời bàn, chuyển trạng thái bàn về `empty` sẵn sàng đón khách mới.

## 2. BẰNG CHỨNG THỰC THI (APPLICATION EVIDENCE)

- **Application Commit**: `35f3c7df7024b2dd6e29a97e18c1b064f228c9c8`
- **Tệp thay đổi**: `lib/features/table/views/table_action_dialog.dart` (259 lines changed)
- **Kiểm thử ứng dụng**:
  - Build PASS
  - Install PASS
  - PO Test PASS trực tiếp trên thiết bị Android thật.
- **Trạng thái PO Verification**: PO Tuấn đã nghiệm thu PASS trong PROMPT-308 và yêu cầu chuyển sang trạng thái Locked.

## 3. GOVERNANCE RECONCILIATION

Báo cáo này được lập để khôi phục và phục hồi bản ghi Governance bị thiếu do quá trình chuyển giao trước đây chưa cập nhật đầy đủ lên repository Governance `du_an_fnb_v5_new`.

- Trạng thái ghi nhận chính thức: `COMPLETED / PO_VERIFIED / PROTECTED / LOCKED`
- Ghi chú phục hồi: *"Governance record restored during retrospective reconciliation from verified Application commit and PO verification evidence."*
