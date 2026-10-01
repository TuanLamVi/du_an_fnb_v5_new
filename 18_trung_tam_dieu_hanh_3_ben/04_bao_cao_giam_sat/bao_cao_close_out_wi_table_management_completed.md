===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — WI-TABLE-01 COMPLETION =====

WORK ITEM:
WI-TABLE-01 (Table Management & POS Ordering Completion)

PROMPT / TASK:
- Complete Table Management implementation according to official design (`TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `STATE_MACHINES_V0.1.md`).

PO DECISION:
APPROVED — Hoàn thiện toàn bộ Quản lý bàn theo đúng thiết kế gốc trước khi sang WI-CUST-01.

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (19/19 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `D60B3DD3CA7C9A8C292DF492C2A90AF3DDBF835D922E5B6DE5149A26578FC212`, Time: 10/1/2026 3:03:54 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `14f48f8` to `origin main`)

SUMMARY OF WORK COMPLETED:
1. **Table Action Dialog (`TableActionDialog`):** Bổ sung bảng thao tác bàn khi chạm vào bàn (Hỗ trợ đầy đủ các trạng thái: `available`, `reserved`, `occupied`, `cleaning`).
2. **Available Table & Reserved State:** Hỗ trợ gọi món (`PosOrderingView`) và đặt bàn (`reserved`), hủy đặt bàn, nhận bàn.
3. **Occupied Table & Supplementary Ordering:** Thay vì ép mở Checkout ngay, bấm bàn `occupied` mở Table Action Dialog cho phép: Xem bàn, Thanh toán (`CheckoutView`), Gọi thêm món (`PosOrderingView` với `orderId` hiện tại để tạo vòng order/line bổ sung và Kitchen Ticket mới), Đổi bàn (Move Table), và Ghép bàn (Merge Table).
4. **Cleaning State & Mark Clean:** Hỗ trợ trạng thái `cleaning` (Paid ≠ Empty) với thao tác Xác nhận dọn xong (`Cleaning → Available`) và Gọi thêm món khi đang dọn.
5. **Move & Merge Table Repositories:** Triển khai an toàn `moveTable` và `mergeTables` trong `TableRepository` và `OrderRepository.submitSupplementaryOrder`.

EVIDENCE:
- Unit Tests: 19/19 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `14f48f8` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test hoàn thiện Quản lý bàn.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
