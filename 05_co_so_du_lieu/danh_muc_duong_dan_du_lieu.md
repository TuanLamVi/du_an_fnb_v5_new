# DANH MỤC ĐƯỜNG DẪN DỮ LIỆU (CANONICAL DATA PATHS CATALOG) F&B SMART V5.1

Catalog chuẩn hóa các Canonical Paths trong Cloud Firestore:

| Path ID | Domain | Canonical Path | Parent | Child | Read Owner | Write Owner | Source |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **PATH-STORE** | Store | `/stores/{storeId}` | Root | Tables, Products, Orders | All Roles | Owner | `DATABASE_SCHEMA` |
| **PATH-TABLE** | Table | `/stores/{storeId}/tables/{tableId}` | Store | None | Staff / Manager | Manager / Staff | `TABLE_MANAGEMENT` |
| **PATH-MENU** | Menu | `/stores/{storeId}/products/{productId}` | Store | None | Staff / Customer | Owner / Manager | `BUSINESS_MODELS` |
| **PATH-ORD** | Order | `/stores/{storeId}/orders/{orderId}` | Store | Items | Staff / Kitchen | Staff / Manager | `POS_ORDERING` |
| **PATH-ITEM** | Order Line | `/stores/{storeId}/orders/{orderId}/items/{itemId}` | Order | None | Staff / Kitchen | Staff | `POS_ORDERING` |
| **PATH-SHIFT** | Shift | `/stores/{storeId}/shifts/{shiftId}` | Store | None | Manager / Staff | Staff / Manager | `SHIFT_MANAGEMENT` |
