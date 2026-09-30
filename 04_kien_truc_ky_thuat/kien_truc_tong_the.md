# KIẾN TRÚC TỔNG THỂ (OVERALL SYSTEM ARCHITECTURE) F&B SMART V5.1

## 1. Tổng quan hệ thống
Hệ thống F&B SMART V5.1 được thiết kế theo mô hình client-server hiện đại, trong đó ứng dụng di động / đa nền tảng (Flutter / Clean Architecture) đóng vai trò Client, kết nối trực tiếp với backend dịch vụ đám mây (Firebase Services: Firebase Auth, Cloud Firestore, Firebase Storage) để xử lý dữ liệu thời gian thực (real-time data sync).

## 2. Các lớp hệ thống (System Layers)
- **Client Presentation Layer:** Ứng dụng client trên thiết bị POS / Tablet / Mobile (Flutter Clean Architecture).
- **Service & Business Logic Layer:** Xử lý nghiệp vụ tại local client và đồng bộ trạng thái qua Repository pattern.
- **Backend & Storage Layer (Firebase):** 
  - **Firebase Authentication:** Xác thực tài khoản nhân sự và phân quyền.
  - **Cloud Firestore:** Cơ sở dữ liệu NoSQL lưu trữ cấu trúc cửa hàng, thực đơn, đơn hàng, ca làm việc, khách hàng theo mô hình multi-tenant (`storeId`).
  - **Firebase Storage:** Lưu trữ hình ảnh sản phẩm thực đơn (nếu có).

## 3. Multi-Tenant Architecture
- Toàn bộ dữ liệu giao dịch và cấu hình đều được phân tách theo phạm vi cửa hàng (`storeId` / tenant), đảm bảo tính bảo mật và độc lập giữa các chi nhánh.

## 4. Data Flow cấp cao (High-level Data Flow)
```text
[Client UI (POS / KDS)] 
        ↓ (Bloc / State Management)
[Domain / UseCase Layer] 
        ↓ (Repository Interface)
[Data / Repository Layer (Firestore Client)]
        ↓ (Network / Realtime Sync)
[Cloud Firestore (Backend)]
```
