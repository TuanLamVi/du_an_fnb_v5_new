===== BEGIN FNB SMART FINAL REPORT =====

PROMPT:
IMPLEMENTATION PROMPT — WI-TABLE-01 / WI-POS-01

WORK ITEM:
WI-TABLE-01 / WI-POS-01 — Table Management & POS Ordering (Sơ đồ bàn & Gọi món POS)

FILES CHANGED:
- `firestore.rules` (Added security rules for `tableStates`, `orders`, and `lines`)
- `lib/features/table/models/table_state_model.dart`
- `lib/features/pos/models/order_model.dart`
- `lib/features/pos/models/order_line_model.dart`
- `lib/features/table/data/table_repository.dart`
- `lib/features/pos/data/order_repository.dart`
- `lib/features/table/views/table_map_view.dart`
- `lib/features/pos/views/pos_ordering_view.dart`
- `lib/features/auth/views/dashboard_placeholder_view.dart` (Added Table Map navigation entry)

DATA MODELS:
- `TableStateModel` (`tableId`, `storeId`, `state`, `currentOrderId`, `lastOrderId`, `updatedAt`)
- `OrderModel` (`orderId`, `storeId`, `tableId`, `status`, `totalAmount`, `createdBy`, `createdAt`, `updatedAt`)
- `OrderLineModel` (`lineId`, `orderId`, `storeId`, `productId`, `name`, `unitPrice`, `quantity`, `sizeName`, `sizePriceExtra`, `toppings`, `options`, `subtotal`, `status`, `createdBy`, `createdAt`)

FIRESTORE PATHS:
- `/stores/{storeId}/zones/{zoneId}`
- `/stores/{storeId}/tables/{tableId}`
- `/stores/{storeId}/tableStates/{tableId}`
- `/stores/{storeId}/orders/{orderId}`
- `/stores/{storeId}/orders/{orderId}/lines/{lineId}`

RULES CHANGES & DEPLOYMENT EVIDENCE:
- Added rules for `tableStates`, `orders`, and `lines` under `/stores/{storeId}`.
- Deployed successfully via `npx firebase deploy --only firestore:rules --project fnb-smart`.
- Output: `released rules firestore.rules to cloud.firestore` / `Deploy complete!`.

TABLE MAP EVIDENCE:
- Real-time zone selection and table grid rendering 10 starter tables ("Bàn 01" → "Bàn 10") in "Khu vực 1" with status indicators (`available`, `occupied`).

POS EVIDENCE:
- Category filtering, product catalog grid, modal for sizes, structured toppings `[-] N [+]`, product options, cart subtotal calculation, and order submission.

ORDER / ORDER LINE EVIDENCE:
- Orders created with state `active_unfenced`, order lines created with state `submitted`, and table state updated to `occupied` with `currentOrderId` linkage.

ANALYZE:
PASS (0 issues, 0 warnings)

TEST:
PASS (All unit tests passed)

BUILD:
PASS (Built build\app\outputs\flutter-apk\app-debug.apk)

APK SHA256:
3A6F5E67241D6ED7311042D8B00FFECCC4C4258A0A2C6156CEB7E9D269EC04A6

DEVICE INSTALL EVIDENCE:
- Samsung Galaxy M51 (Device ID: RF8NC11QQVM, Android 12): INSTALL PASS, LAUNCH PASS (PID 20501 running active)
- Samsung Galaxy Note 8 (Device ID: 988e50385a3931435330, Android 9): INSTALL PASS, LAUNCH PASS (PID 9999 running active)

REGRESSION EVIDENCE:
- WI-AUTH-01 (AuthStartupGateway, session persistence) and WI-SETUP-01 (Quick Setup wizard, 20 models, menu cloning, 10 starter tables) fully verified and functional without regression.

GIT COMMIT & PUSH:
- Repository: fnb-smart-v5, Branch: main, Commit: c16143c, Pushed to origin/main successfully.

TECHNICAL IMPLEMENTATION:
PASS

PO TEST:
CHỜ PO TEST

===== END FNB SMART FINAL REPORT =====
