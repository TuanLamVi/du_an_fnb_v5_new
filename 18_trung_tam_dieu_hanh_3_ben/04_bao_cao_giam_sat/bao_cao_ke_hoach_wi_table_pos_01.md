===== BÁO CÁO RÀ SOÁT KẾ HOẠCH WI-TABLE-01 / WI-POS-01 =====

WORK ITEM:
WI-TABLE-01 / WI-POS-01 — Table Management & POS Ordering (Sơ đồ bàn & Gọi món POS)

CANONICAL TABLE STATE:
- States: `available`, `occupied`, `cleaning`.
- Transition T1 (`openTableOrder`): Chuyển từ `available` sang `occupied` khi tạo Order đầu tiên cho bàn.

CANONICAL ORDER STATE:
- Logical States: `active_unfenced`, `active_fenced`, `finalized`, `closed`, `cancelled`.
- Order bắt đầu ở trạng thái `active_unfenced`.

CANONICAL ORDER LINE STATE:
- States: `draft`, `submitted`, `preparing`, `ready`, `served`, `draft_cancelled`.
- Order Line bắt đầu ở trạng thái `draft` / `submitted`.

CANONICAL FIRESTORE PATHS:
- `/stores/{storeId}/zones/{zoneId}`
- `/stores/{storeId}/tables/{tableId}`
- `/stores/{storeId}/tableStates/{tableId}`
- `/stores/{storeId}/orders/{orderId}`
- `/stores/{storeId}/orders/{orderId}/lines/{lineId}`

NAVIGATION SCOPE:
- Dashboard → Table Map (Sơ đồ bàn) → POS Ordering (Màn hình gọi món).

TABLE SCOPE:
- Hiển thị Sơ đồ bàn theo Khu vực (Zones) và 10 bàn starter (`available`).

POS SCOPE:
- Chọn bàn, mở order, đọc Store Menu (`categories`, `products`), chọn `sizes`, topping `[-] N [+]`, `options`, quản lý giỏ hàng và gửi đơn (Submit Order).

KITCHEN SCOPE:
- Out of scope (Thuộc WI-KDS-01).

PAYMENT SCOPE:
- Out of scope (Thuộc WI-PAY-01).

FIRESTORE RULES SCOPE:
- Cập nhật rules bảo vệ `tableStates`, `orders`, `lines` theo tenant isolation.

DEPENDENCIES:
- WI-AUTH-01 (LOCKED), WI-SETUP-01 (LOCKED).

PROTECTED SCOPE:
- WI-AUTH-01 & WI-SETUP-01 hành vi được bảo toàn tuyệt đối.

IMPLEMENTATION ORDER:
1. Data Models -> 2. Firestore Rules -> 3. Repositories -> 4. Table Map UI -> 5. POS Ordering UI -> 6. Navigation -> 7. Analyze, test, build, deploy.

PO TEST PLAN:
- Dashboard → Table Map (10 bàn available) → Tap Bàn 01 → POS Ordering (chọn món, size, topping) → Submit Order → Bàn 01 chuyển `occupied`.

STATUS:
READY FOR PO APPROVAL — CHƯA CODE
