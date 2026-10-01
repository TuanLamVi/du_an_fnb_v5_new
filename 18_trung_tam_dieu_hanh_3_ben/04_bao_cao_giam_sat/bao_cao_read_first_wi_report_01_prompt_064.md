===== BÁO CÁO READ-FIRST & CHUẨN BỊ PO TEST WI-REPORT-01 (PROMPT-064) =====

1. WORK ITEM IDENTIFICATION
- Work Item ID: `WI-REPORT-01 / WI-ANALYTICS-01`
- Work Item Name: `Today's Summary & Reports (Tổng quan hôm nay, Báo cáo Doanh thu & Két tiền)`
- Historical Alias: `A7 / Reports`
- Status: `IMPLEMENTED — PENDING PO TEST & CLOSE-OUT`

2. READ-FIRST CHECK
- AGENTS.md, CURRENT_STATE, ROADMAP, WORK ITEM HISTORY, Master Specification V5.1 (§18), Reports Analytics Discovery (Prompt 099) reviewed.
- Verified that WI-AUTH-01, WI-SETUP-01, WI-TABLE-01/POS-01, WI-KDS-01, WI-PAY-01, and WI-DEBT-01 are fully implemented, tested, and protected.

3. BUILD & APK VERIFICATION
- Repository Branch: `main`
- HEAD: `e3a7cab` (or latest synchronized commit)
- Working Tree: Clean
- APK Path: `build/app/outputs/flutter-apk/app-debug.apk`
- APK SHA256: `F5B71DEA95CE4C2025F686A4DD86FAE2EC3F5E5A93BA9DBACD75C0AEFFA68F8E`
- Devices Ready: Samsung Galaxy Note 8 (`988e50385a3931435330`) & Samsung Galaxy M51 (`RF8NC11QQVM`).

4. PO TEST CHECKLIST (WI-REPORT-01)
1. Mở app → Đăng nhập → Vào Dashboard → Nhấn nút **BÁO CÁO CHI TIẾT**.
2. Kiểm tra màn hình **TỔNG QUAN HÔM NAY** mở bình thường với 4 nhóm thẻ (Doanh thu & Thu tiền, Két tiền mặt A6, Bàn & Đơn, Ca hiện tại).
3. Kiểm tra công thức Doanh thu = Subtotal - Discounts (Không tính nhầm Debt vào doanh thu).
4. Kiểm tra Đã thu (Cash + QR) tách biệt hoàn toàn với Ghi nợ (Debt).
5. Kiểm tra Két tiền mặt đồng bộ theo công thức A6.
6. Kiểm tra Bàn & Đơn (Occupied, Cleaning, Available, Total Orders).
7. Kiểm tra Lịch sử nợ (Debt History) trên từng khách hàng.
8. Kiểm tra định dạng tiền tệ (`formatCurrency` hàng nghìn phân cách bằng dấu chấm, kèm đ).

5. STATUS
- READ-FIRST: PASS
- BUILD: PASS
- PO TEST: PENDING
