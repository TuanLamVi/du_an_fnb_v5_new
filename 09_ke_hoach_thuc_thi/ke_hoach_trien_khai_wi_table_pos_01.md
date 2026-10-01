# KẾ HOẠCH TRIỂN KHAI WI-TABLE-01 / WI-POS-01 (RÀ SOÁT CHÍNH THỨC)

## 1. CANONICAL TABLE STATE
- States: `available`, `occupied`, `cleaning`.
- Transition T1 (`openTableOrder`): Chuyển từ `available` sang `occupied` khi tạo Order đầu tiên cho bàn. Trạng thái thực tế được quản lý tại `/stores/{storeId}/tableStates/{tableId}` và `/stores/{storeId}/tables/{tableId}`.

## 2. CANONICAL ORDER STATE
- Logical States: `active_unfenced`, `active_fenced`, `finalized`, `closed`, `cancelled`.
- Order bắt đầu ở trạng thái `active_unfenced` (với các line ở state `draft`).

## 3. CANONICAL ORDER LINE STATE
- States: `draft`, `submitted`, `preparing`, `ready`, `served`, `draft_cancelled`.
- Order Line mới bắt đầu ở state `draft`. Khi thêm vào giỏ và submit/dispatch, chuyển sang `submitted` (hoặc xử lý qua KDS/Kitchen ở WI-KDS-01). Trong phạm vi WI-POS-01, tạo line ở state `draft` / `submitted`.

## 4. CANONICAL FIRESTORE PATHS
- `/stores/{storeId}/zones/{zoneId}`
- `/stores/{storeId}/tables/{tableId}`
- `/stores/{storeId}/tableStates/{tableId}`
- `/stores/{storeId}/orders/{orderId}`
- `/stores/{storeId}/orders/{orderId}/lines/{lineId}`

## 5. NAVIGATION SCOPE
- Dashboard → Table Map (Sơ đồ bàn) → POS Ordering (Màn hình gọi món khi chọn một bàn cụ thể).

## 6. TABLE SCOPE (WI-TABLE-01)
- Hiển thị danh sách Khu vực (Zones) và 10 bàn starter ("Bàn 01" → "Bàn 10") được tạo từ Quick Setup ở trạng thái `available`.
- Real-time stream trạng thái bàn từ `/tableStates/{tableId}` và `/tables/{tableId}`.

## 7. POS SCOPE (WI-POS-01)
- Chọn bàn từ Table Map → Mở Order.
- Đọc Store Menu Categories & Products từ `/stores/{storeId}/categories` và `/stores/{storeId}/products`.
- Chọn kích thước (`sizes`), topping số lượng (`[-] N [+]`), và tùy chọn (`options`).
- Quản lý giỏ hàng (Cart) & Order Lines (`draft` / `submitted`).
- Gửi đơn (Submit Order) lên Firestore tại `/stores/{storeId}/orders` và subcollection `lines`.

## 8. KITCHEN SCOPE (OUT OF SCOPE)
- Kitchen Dispatch (`Gửi bếp`, chuyển trạng thái `queued → acknowledged → preparing → ready → served` trên KDS) thuộc Work Item **WI-KDS-01**.

## 9. PAYMENT SCOPE (OUT OF SCOPE)
- Thanh toán, tách hóa đơn, PayOS QR, Cash Drawer, ghi nợ (Debt Lite) thuộc Work Item **WI-PAY-01**.

## 10. FIRESTORE RULES SCOPE
- Bổ sung match rules cho `tableStates`, `orders`, và `lines` dưới `/stores/{storeId}` cho phép Active Members đọc/ghi theo đúng tenant isolation và permission dictionary.

## 11. DEPENDENCIES
- WI-AUTH-01 (LOCKED): Active membership & session.
- WI-SETUP-01 (LOCKED): `zones`, `tables`, `categories`, `products`.

## 12. PROTECTED SCOPE
- WI-AUTH-01 (`AuthStartupGateway`, Phone Auth, session persistence).
- WI-SETUP-01 (Quick Setup wizard, 20 models, menu cloning, 10 starter tables).

## 13. IMPLEMENTATION ORDER (THỨ TỰ THỰC HIỆN AN TOÀN)
1. Data Models (`TableStateModel`, `OrderModel`, `OrderLineModel`).
2. Firestore Security Rules alignment (`tableStates`, `orders`, `lines`).
3. Repositories (`TableRepository`, `OrderRepository`).
4. Table Map UI View (`TableMapView`, `TableGridWidget`).
5. POS Ordering UI View (`PosOrderingView`, `MenuCatalogWidget`, `ProductDetailModal`, `CartWidget`).
6. Navigation integration từ Dashboard.
7. Analyze, test, build debug APK, deploy và verify thực tế trên thiết bị.

## 14. PO TEST PLAN
- Đăng nhập Chủ quán → Mở Table Map → Thấy 10 bàn `available` → Tap Bàn 01 → Mở POS Ordering → Chọn món mẫu từ Menu Cà phê / Bún Phở → Chọn size & topping `[-] N [+]` → Submit Order → Bàn 01 chuyển sang trạng thái `occupied`.

## 15. STATUS
READY FOR PO APPROVAL — CHƯA CODE
