Đúng. Tôi hiểu rất rõ yêu cầu:

> **Bây giờ chỉ lập KẾ HOẠCH để xây dựng bộ hồ sơ F&B SMART hoàn chỉnh.**
>
> **Chưa xây hồ sơ. Chưa sửa tài liệu. Chưa viết prompt Codex. Chưa triển khai code.**

Tôi đã đối chiếu các tài liệu hiện có. Bộ tài liệu hiện tại đã có **khung 10 nhóm DOC-00 → DOC-10**, và tài liệu `FNB_SMART_V5.1_PRODUCT_DEVELOPMENT_DOCUMENTATION_MASTER` cũng đã quy định cấu trúc từ Product → UX/UI → Business → Architecture → Database → Security → Test → Release → Traceability → Work Item. 

## KẾ HOẠCH XÂY DỰNG BỘ HỒ SƠ F&B SMART V5.1

### Giai đoạn 0 — Khóa phạm vi công việc

**Mục tiêu:** Không cho việc xây hồ sơ biến thành việc phát triển phần mềm.

Kết quả cần đạt:

* Đóng băng triển khai code.
* Không tạo Work Item implementation mới.
* Không PO_VERIFIED cho code mới.
* Xác định đây là **Documentation Completion Project**.
* Xác định Governance Repository là nguồn quản trị.
* Xác định bộ hồ sơ sản phẩm là nguồn mô tả sản phẩm.

---

# Giai đoạn 1 — Kiểm kê toàn bộ hồ sơ hiện có

Không viết tài liệu mới ngay.

Trước tiên lập một **Document Inventory**.

Kiểm tra:

* Tài liệu nào đã có.
* Tài liệu nào đang thiếu.
* Tài liệu nào là bản nháp.
* Tài liệu nào đã được PO xác nhận.
* Tài liệu nào trùng nhau.
* Tài liệu nào mâu thuẫn.
* Tài liệu nào đã lỗi thời.
* Tài liệu nào đang nằm sai vị trí.
* Tài liệu nào thuộc Governance.
* Tài liệu nào thuộc Product Specification.
* Tài liệu nào chỉ là Discovery.
* Tài liệu nào là Evidence.

**Đầu ra của giai đoạn này:**

> Bản đồ hiện trạng hồ sơ.

Chưa sửa bất cứ tài liệu nào.

---

# Giai đoạn 2 — Xác lập “Nguồn sự thật” cho từng loại hồ sơ

Đây là bước cực kỳ quan trọng.

Không thể để:

> Chat → một cách hiểu
> Discovery → cách khác
> Roadmap → cách khác
> Codex → cách khác.

Cần xác định:

| Loại thông tin | Nguồn chính thức                        |
| -------------- | --------------------------------------- |
| Governance     | KIM CHỈ NAM                             |
| Product        | Product Charter / Product Specification |
| Requirements   | PRD                                     |
| UX/UI          | UX/UI Specification                     |
| Business       | Business Rules                          |
| State          | State Machines                          |
| Database       | Database Schema                         |
| Security       | Security Specification                  |
| Work           | Roadmap + Work Item Contract            |
| Test           | Test & PO Acceptance                    |
| Traceability   | Feature Traceability                    |
| Release        | Release Operations                      |
| Lịch sử        | Work Item History                       |
| Quyết định PO  | PO Decision Register                    |

Điểm này phù hợp trực tiếp với Master Index hiện tại, trong đó đã quy định thứ tự ưu tiên giữa Governance, Product Specification, Database/State/Security, Roadmap/Work Item và các tài liệu cấp thấp hơn. 

---

# Giai đoạn 3 — Xây “kiến trúc bộ hồ sơ”

Đây **không phải viết nội dung**.

Chỉ quyết định:

> Bộ hồ sơ hoàn chỉnh của F&B SMART sẽ gồm những nhóm nào và mỗi nhóm trả lời câu hỏi gì.

Tôi đề xuất giữ khung **10 DOC hiện tại** làm xương sống:

### DOC-00 — Master Index

Bộ hồ sơ nằm ở đâu?

### DOC-01 — Product Requirements

Ứng dụng phải làm gì?

### DOC-02 — UX/UI

Người dùng nhìn thấy và thao tác thế nào?

### DOC-03 — Business Rules & State

Hệ thống phải xử lý thế nào?

### DOC-04 — Architecture

Hệ thống được xây như thế nào?

### DOC-05 — Database & Data Contract

Dữ liệu nằm ở đâu và cấu trúc thế nào?

### DOC-06 — Security & Permission

Ai được làm gì?

### DOC-07 — Test & PO Acceptance

Làm sao chứng minh đúng?

### DOC-08 — Release & Operations

Build, phát hành và vận hành thế nào?

### DOC-09 — Feature Traceability

Các phần liên kết với nhau thế nào?

### DOC-10 — Work Item Contract

Mỗi Work Item phải tạo ra cái gì?

Khung này đã tồn tại trong `00_DOCUMENTATION_MASTER_INDEX.md`. 

---

# Giai đoạn 4 — Bổ sung lớp Product Discovery

Đây là phần đặc biệt quan trọng đối với F&B SMART.

Không chỉ có:

> “Menu có chức năng gì?”

mà phải xác định toàn bộ nghiệp vụ:

* Store
* Quick Setup
* Business Model
* Menu Template
* Menu
* Category
* Product
* Modifier
* Topping
* Product Options
* Tables
* Orders
* POS
* KDS
* Payment
* Customer
* Debt
* Loyalty
* Shift
* Reports
* Permissions
* v.v.

Ví dụ hiện tại đã có tài liệu riêng về **20 Business Models & Menu Templates**, trong đó còn phân biệt rõ cái nào là MVP và cái nào TBD/deferred. 

Vì vậy giai đoạn này phải gom các Discovery thành **một Product Model thống nhất**.

---

# Giai đoạn 5 — Xây Product Blueprint hoàn chỉnh

Sau khi biết toàn bộ nghiệp vụ, mới xác định:

### Người dùng

Ví dụ:

* Owner
* Manager
* Staff
* Kitchen
* v.v.

### Các module

Ví dụ:

```text
Authentication
Store
Dashboard
Quick Setup
Menu
POS
Tables
KDS
Payment
Customer
Debt
Shift
Reports
Settings
```

### Các luồng chính

Ví dụ:

```text
Tạo Store
   ↓
Quick Setup
   ↓
Chọn Business Model
   ↓
Clone Menu Template
   ↓
Starter Data
   ↓
Ready to Sell
   ↓
POS
   ↓
Order
   ↓
KDS
   ↓
Payment
   ↓
Table
   ↓
Reports
```

**Đây mới là lúc chúng ta có thể xác định chính xác Menu nằm ở đâu trong sản phẩm.**

---

# Giai đoạn 6 — Xây UX/UI Blueprint

Sau Product Blueprint mới xây UX/UI.

Mỗi Feature có giao diện phải xác định tối thiểu:

* Feature ID
* Screen ID
* Actor
* Entry point
* Navigation
* User Flow
* UI components
* Loading
* Empty
* Error
* Success
* Permission
* Acceptance Criteria
* Work Item

Điều này đã được quy định trong Master Documentation và Master Index.

Đây chính là lớp hồ sơ hiện đang cần thiết nhất để tránh tình trạng:

> **Database có → Repository có → Code PASS → nhưng PO mở app không biết vào đâu để sử dụng.**

---

# Giai đoạn 7 — Xây Business + State + Data thống nhất

Ba phần này phải khớp nhau:

```text
Business Rule
      ↓
State Machine
      ↓
Database
```

Ví dụ:

```text
Payment Success
      ↓
Order = Paid
      ↓
Table = Cleaning / Available
      ↓
Revenue / Cash / Debt
      ↓
Reports
```

Không được để mỗi tài liệu mô tả một kiểu.

---

# Giai đoạn 8 — Xây Traceability Matrix

Đây sẽ là **xương sống kiểm soát toàn bộ dự án**.

Mỗi chức năng phải truy được:

```text
Requirement
 ↓
Feature
 ↓
Screen
 ↓
User Flow
 ↓
Business Rule
 ↓
State
 ↓
Database
 ↓
Architecture
 ↓
Work Item
 ↓
Test
 ↓
Build
 ↓
PO Test
 ↓
PO Verified
 ↓
Protected
 ↓
Locked
```

Đây chính là chuỗi mà `00_DOCUMENTATION_MASTER_INDEX.md` yêu cầu. 

---

# Giai đoạn 9 — Xây Roadmap chính thức

**Roadmap phải được làm sau khi Product/UX/Business đã rõ.**

Không làm ngược.

Roadmap phải trả lời:

```text
Làm cái gì?
Làm trước hay sau?
Phụ thuộc cái gì?
Khi nào được mở?
Khi nào được đóng?
PO nghiệm thu cái gì?
```

Tài liệu Development Master hiện cũng yêu cầu Roadmap phải có:

* Phase
* Work Item
* Dependency
* Scope
* Entry condition
* Exit condition. 

Đây là nơi chúng ta sẽ giải quyết dứt điểm vấn đề:

> **A3-01 → A3-02 → A3-03 → ... thực sự phải đi theo thứ tự nào?**

---

# Giai đoạn 10 — Xây Test & PO Acceptance

Mỗi Feature phải có:

```text
Requirement
↓
Acceptance Criteria
↓
Test Case
↓
Expected Result
↓
PO Test
```

Và phải phân biệt:

* Unit Test
* Integration Test
* E2E
* Regression
* PO Acceptance

Không được dùng:

> “Codex test PASS”

để thay thế:

> “PO đã nghiệm thu Feature”.

Work Item Contract hiện cũng yêu cầu nếu có UI thì Final Report phải nói rõ màn hình, entry point, thao tác PO và UI Acceptance Criteria. 

---

# Giai đoạn 11 — Xây Release & Operations

Sau khi chức năng hoàn chỉnh mới mô tả:

* Development environment
* Build
* Version
* Provenance
* APK
* Deployment
* Rollback
* Production readiness
* Monitoring
* Logging
* Backup
* Recovery
* Incident
* Regression
* Known Issues
* Change Log

Khung này cũng đã được xác định trong tài liệu `FNB V5.1`. 

---

# Giai đoạn 12 — Kiểm tra chéo toàn bộ bộ hồ sơ

Đây là **Documentation Audit**.

Kiểm tra 5 loại lỗi:

### 1. Thiếu

Có Feature nhưng không có Screen.

### 2. Mồ côi

Có Screen nhưng không có Requirement.

### 3. Mâu thuẫn

Business nói một kiểu, Database nói kiểu khác.

### 4. Không có đường triển khai

Feature có nhưng không có Work Item.

### 5. Không thể nghiệm thu

Feature có nhưng PO không biết phải kiểm tra thế nào.

---

# Giai đoạn 13 — Documentation Gate

Chỉ khi toàn bộ bộ hồ sơ vượt qua các kiểm tra trên mới tạo:

> **F&B SMART V5.1 — MASTER PROJECT DOCUMENTATION BASELINE**

Bản này sẽ trở thành bộ hồ sơ chuẩn để phát triển.

Khi đó một người mới vào dự án phải có thể trả lời:

> F&B SMART là gì?

> Có những chức năng nào?

> Người dùng nào sử dụng?

> Màn hình nào?

> Luồng nào?

> Quy tắc nào?

> Dữ liệu nào?

> Kiến trúc nào?

> Work Item nào?

> Test thế nào?

> PO nghiệm thu thế nào?

> Hiện dự án đang ở đâu?

> Tiếp theo làm gì?

---

# Giai đoạn 14 — PO Review

Cuối cùng mới đưa toàn bộ bộ hồ sơ cho **Tuấn — PO** review.

PO không cần đọc từng dòng code.

PO chỉ cần xác nhận:

**“Đây có đúng là sản phẩm tôi muốn xây không?”**

Nếu chưa đúng → quay lại Documentation.

If đúng → mới chuyển sang:

> **Implementation Planning → Work Item Execution → Coding.**

---

# Sơ đồ toàn bộ kế hoạch

```text
        HIỆN TRẠNG
             │
             ▼
   1. KIỂM KÊ HỒ SƠ
             │
             ▼
   2. XÁC ĐỊNH SOURCE OF TRUTH
             │
             ▼
   3. KIẾN TRÚC BỘ HỒ SƠ
             │
             ▼
   4. PRODUCT DISCOVERY
             │
             ▼
   5. PRODUCT BLUEPRINT
             │
             ▼
   6. UX/UI BLUEPRINT
             │
             ▼
   7. BUSINESS + STATE + DATA
             │
             ▼
   8. TRACEABILITY
             │
             ▼
   9. ROADMAP
             │
             ▼
  10. TEST + PO ACCEPTANCE
             │
             ▼
  11. RELEASE + OPERATIONS
             │
             ▼
  12. DOCUMENTATION AUDIT
             │
             ▼
  13. MASTER DOCUMENTATION BASELINE
             │
             ▼
        PO REVIEW
             │
             ▼
       PO APPROVED
             │
             ▼
     MỚI ĐƯỢC TRIỂN KHAI
```

## Quan trọng nhất

**Chúng ta không bắt đầu bằng việc viết tài liệu.**

Thứ tự đúng là:

> **Kiểm kê → xác định nguồn chính thức → thiết kế cấu trúc hồ sơ → xác định khoảng trống → lập kế hoạch xây từng hồ sơ → kiểm tra chéo → tạo baseline → PO duyệt → mới triển khai.**

Và hiện tại **chưa thực hiện bước xây hồ sơ nào cả**.

Tôi đề nghị coi kế hoạch trên là **Documentation Project Plan**, không phải Product Development Roadmap. Hai thứ này phải tách biệt hoàn toàn.
