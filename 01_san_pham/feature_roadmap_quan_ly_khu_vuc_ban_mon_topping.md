# FEATURE ROADMAP — QUẢN LÝ KHU VỰC / BÀN / MÓN / TOPPING

> **GHI CHÚ GOVERNANCE:**
> Đây là **FEATURE-SPECIFIC ROADMAP** dành riêng cho phạm vi chức năng "Quản lý Khu vực / Bàn / Món / Topping".
> Feature Roadmap này KHÔNG thay thế Master Roadmap của F&B SMART V5.1 và KHÔNG làm thay đổi lộ trình 6 Phase tổng thể của dự án.

## 1. Tên tính năng & Mục tiêu
- **Tên tính năng:** QUẢN LÝ KHU VỰC / BÀN / MÓN / TOPPING
- **Mục tiêu:** Cho phép Chủ quán / Quản lý quản lý toàn bộ Khu vực, Bàn, Danh mục món, Món ăn, Topping, phân quyền CRUD tương ứng và bảo đảm an toàn dữ liệu lịch sử giao dịch.

## 2. Chi tiết các Phase thuộc Feature Roadmap (5 Phases)

### PHASE 1 — KHU VỰC & BÀN
- **1A — Quản lý Khu vực:**
  - Trạng thái: `PO_VERIFIED` | `COMPLETED` | `PROTECTED` | `LOCKED` (PROMPT-105)
- **1B — Quản lý Bàn:**
  - Trạng thái: `PO_VERIFIED` | `COMPLETED` | `PROTECTED` | `LOCKED` (PROMPT-103)
- **Tổng kết Phase 1:** `COMPLETED` | `PROTECTED` | `LOCKED`

### PHASE 2 — DANH MỤC, MÓN & NƠI CHẾ BIẾN
- **Phạm vi:** Danh mục CRUD, Món CRUD, Nơi chế biến (Production Station) CRUD, liên kết 3 tầng, Firestore Rules, Quick Setup & POS integration.
- **Trạng thái hiện tại:** `PO_VERIFIED` | `COMPLETED` | `PROTECTED` | `LOCKED` (PROMPT-112)

### PHASE 3 — QUẢN LÝ TOPPING
- **Phạm vi:** Topping Library CRUD, Product ↔ Topping Assignment, Pricing & No Double-Count, Order Line Snapshot, KDS & Invoice & Transaction History Topping Display.
- **Trạng thái hiện tại:** `PO_VERIFIED` | `COMPLETED` | `PROTECTED` | `LOCKED` (PROMPT-118)

### PHASE 4 — PHÂN QUYỀN
- **Phạm vi:** Menu UI Grouping ("Cài đặt thực đơn"), Permission Assignment (`PERM-MENU-MGT`), View-level & Firestore Rules enforcement.
- **Trạng thái hiện tại:** `PO_VERIFIED` | `COMPLETED` | `PROTECTED` | `LOCKED` (PROMPT-123)

### PHASE 5 — AN TOÀN DỮ LIỆU
- **Phạm vi:** Soft delete / inactive filtering, Delete Guard cho đơn chưa hoàn tất, Topping cascade sync, Firestore Rules deletion hardening.
- **Trạng thái hiện tại:** `PO_VERIFIED` | `COMPLETED` | `PROTECTED` | `LOCKED` (PROMPT-131)

## 3. Thứ tự thực hiện chính thức
`PHASE 1A` → `PHASE 1B` → `PHASE 2` → `PHASE 3` → `PHASE 4` → `PHASE 5` (TẤT CẢ ĐÃ LOCKED)
