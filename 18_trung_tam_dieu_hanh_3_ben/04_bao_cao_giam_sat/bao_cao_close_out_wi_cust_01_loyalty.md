===== BEGIN FNB SMART MONITORING & CLOSE-OUT REPORT — PROMPT-202 CONTACT PICKER CRASH FIX =====

WORK ITEM:
WI-CUST-01 (Customer Management & Loyalty Lite / GAP-LOYAL-01)

PROMPTS EXECUTED:
- PROMPT-199: Loyalty Lite Core.
- PROMPT-200: Firestore Rules & Customer Search.
- PROMPT-201: Android Contact Picker Intent integration.
- PROMPT-202: Fix contact picker selection crash by explicitly fetching full contact properties via `FlutterContacts.getContact(picked.id)` and adding robust null/empty phone checks.

PO DECISION:
PENDING PO TEST (Chờ Chủ quán Tuấn trực tiếp kiểm tra thực tế trên M51 & Note 8).

STATUS:
* IMPLEMENTED: YES
* TESTED: YES (30/30 unit tests passed)
* ANALYZED: YES (0 issues found)
* BUILT: YES (Debug APK SHA256: `1528E260C5487F0709198681E5BA47237D666313AE26B6A8FAF989460D1297`, Time: 10/1/2026 6:00:48 PM)
* DEPLOYED: YES (Samsung Galaxy M51 `RF8NC11QQVM` & Note 8 `988e50385a3931435330`)
* COMMITTED & PUSHED: YES (Commit `5f6a9e8` to `origin main`)

SUMMARY OF PROMPT-202 WORK COMPLETED:
1. **Root Cause of Crash:** Phương thức `openExternalPick()` trả về một đối tượng `Contact` rút gọn mà trên một số phiên bản Android (như Android 12 M51 / Android 9 Note 8) chưa nạp sẵn dữ liệu phone numbers hoặc trả về danh sách điện thoại trống, dẫn đến ngoại lệ `StateError` khi truy cập trực tiếp `contact.phones.first`.
2. **Surgical Fix (`CustomerSelectDialog`):** Cập nhật hàm `_pickContact()` gọi thêm `FlutterContacts.getContact(picked.id)` để lấy đầy đủ thuộc tính liên lạc một cách an toàn, đồng thời bổ sung kiểm tra `phonesList.isNotEmpty` để tránh hoàn toàn hiện tượng crash app. Nếu contact không có số điện thoại, hiển thị thông báo hướng dẫn nhập thủ công mà không làm thoát ứng dụng.
3. **Multi-Device Verification:** Build APK debug mới, cài đặt và kiểm chứng thành công trên Samsung Galaxy M51 và Note 8.

EVIDENCE:
- Unit Tests: 30/30 passed (`flutter test`).
- Static Analysis: 0 issues (`flutter analyze`).
- Git Commit: `5f6a9e8` (Pushed to GitHub `fnb-smart-v5` main).

NEXT ACTION:
- Chờ PO Tuấn thực hiện PO Test.

===== END FNB SMART MONITORING & CLOSE-OUT REPORT =====
