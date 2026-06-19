<div align="center">
  <img src="assets/images/unico.png" alt="UniFines Mascot Unico" width="120"/>

  # UniFines - Trợ lý Tài chính Thông minh

  <p align="center">
    Một ứng dụng quản lý tài chính cá nhân đột phá tích hợp AI, được thiết kế để giúp người dùng theo dõi chi tiêu, tiết kiệm thông minh và đạt được các mục tiêu tài chính với niềm vui và động lực.
  </p>

  <!-- Badges -->
  <p align="center">
    <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter"></a>
    <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"></a>
    <a href="https://riverpod.dev"><img src="https://img.shields.io/badge/Riverpod-State_Management-blue?style=for-the-badge" alt="Riverpod"></a>
    <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="Giấy phép: MIT"></a>
  </p>
</div>

---

## 📋 Mục lục
- [✨ Tính năng nổi bật](#-tính-năng-nổi-bật)
- [🎨 Thiết kế & Công nghệ](#-thiết-kế--công-nghệ)
- [🚀 Hướng dẫn Cài đặt](#-hướng-dẫn-cài-đặt)
- [🛠 Ghi chú Phát triển](#-ghi-chú-phát-triển)
- [🤝 Đóng góp](#-đóng-góp)
- [📄 Giấy phép](#-giấy-phép)

---

## ✨ Tính năng nổi bật

### 1. Theo dõi Chi tiêu Thông minh
- **Quét Hóa đơn AI**: Trích xuất ngay lập tức thông tin giao dịch từ hình ảnh sử dụng Google ML Kit.
- **Nhập liệu bằng Giọng nói**: Nói tự nhiên để ghi lại chi tiêu (Tích hợp Speech-to-Text).
- **Phân loại Tự động**: Tự động phân nhóm các giao dịch (Ăn uống, Di chuyển, Mua sắm, v.v.).

### 2. Trợ lý Tài chính AI (Unico)
- **Trò chuyện Theo ngữ cảnh**: Một người bạn AI thân thiện hiểu rõ tình hình tài chính của bạn.
- **Phân tích Ngân sách Thời gian thực**: Đặt các câu hỏi như "Tháng này tôi đã tiêu bao nhiêu tiền cho việc ăn uống?" và nhận được câu trả lời ngay lập tức.
- **Động lực & Lời khuyên**: Nhận những lời nhắn nhủ động viên và lời khuyên tài chính được cá nhân hóa.

### 3. Đặt Mục tiêu & Tiết kiệm
- **Hũ Tiết kiệm Trực quan**: Thiết lập các hũ tiết kiệm sinh động cho từng mục tiêu cụ thể (VD: "Laptop mới", "Du lịch").
- **Theo dõi Tiến độ**: Quan sát tiến độ của bạn bằng những thanh trạng thái và hiệu ứng đẹp mắt.
- **Phần thưởng Game hóa**: Nhận điểm thưởng và quà tặng khi duy trì thói quen tốt.

### 4. Chi tiêu Nhóm (Quỹ Chung)
- **Ngân sách Nhóm**: Tạo và tham gia các nhóm để chia sẻ chi phí (VD: "Tiền trọ", "Hội bạn thân").
- **Quản lý Phân quyền**: Gán các vai trò (Trưởng nhóm, Quản trị, Thành viên) với quyền hạn khác nhau.
- **Minh bạch**: Theo dõi các khoản chi tiêu chung và phần đóng góp của từng thành viên theo thời gian thực.

### 5. Hệ thống Ví Thông minh
- **Đa Tài khoản**: Quản lý nhiều nguồn quỹ (Ví chính, Sổ tiết kiệm, Thẻ tín dụng).
- **Phân tích Giao dịch AI**: Tự động xử lý và quản lý lịch sử giao dịch.
- **Giao dịch Định kỳ**: Thiết lập thanh toán tự động và các khoản đăng ký trả phí (Subscription).

## 🎨 Thiết kế & Công nghệ

### Tech Stack
- **Ngôn ngữ**: [Dart](https://dart.dev/)
- **Framework**: [Flutter 3.x](https://flutter.dev/)
- **Quản lý Trạng thái**: [Riverpod](https://riverpod.dev/)
- **Điều hướng (Navigation)**: [GoRouter](https://pub.dev/packages/go_router)
- **Hiệu ứng**: [flutter_animate](https://pub.dev/packages/flutter_animate)
- **AI/ML**:
  - Speech-to-Text (Google ML Kit)
  - Text Recognition (Google ML Kit)
  - Sẵn sàng tích hợp Gemini API cho Trợ lý Trò chuyện.

### Triết lý Thiết kế
- **Phong cách Kawaii**: Linh vật cực kỳ dễ thương ("Unico") cùng các thành phần UI tươi sáng.
- **Glassmorphism**: Sử dụng hiệu ứng kính mờ (frosted glass) kết hợp các dải màu gradient sống động.
- **Chế độ Tối (Dark Mode)**: Giao diện "Galaxy" huyền ảo giúp làm dịu mắt khi sử dụng vào ban đêm.
- **Hiệu ứng Liquid**: Các chuyển động mượt mà, tự nhiên mang lại cảm giác ứng dụng luôn "sống".

## 🚀 Hướng dẫn Cài đặt

### Yêu cầu Hệ thống
- Flutter SDK `3.0.0` trở lên
- Android Studio / VS Code
- Một thiết bị Android thật để cấp quyền sử dụng Camera & Micro

### Cài đặt
1. Clone mã nguồn:
   ```bash
   git clone https://github.com/your-username/unifines_app.git
   cd unifines_app
   ```

2. Tải các thư viện phụ thuộc:
   ```bash
   flutter pub get
   ```

3. Cấu hình Quyền AI (Android):
   - Đảm bảo các quyền `INTERNET`, `CAMERA`, và `RECORD_AUDIO` đã được khai báo trong `android/app/src/main/AndroidManifest.xml`.

4. Chạy ứng dụng:
   ```bash
   flutter run
   ```

## 🛠 Ghi chú Phát triển

### Hạn chế & Bản vá Tạm thời
- **Speech-to-Text**: Tạm thời vô hiệu hóa trong `pubspec.yaml` do lỗi biên dịch KGP (Kotlin Gradle Plugin) trên Windows.
- **Text Recognition**: Tạm thời vô hiệu hóa do lỗi R8 Minification (ProGuard) khi biên dịch bản Release.
- **Widget Testing**: Đã cập nhật lại file test bỏ qua `pumpAndSettle` để tránh lỗi Timeout do các vòng lặp animation chạy liên tục.

### Cấu trúc Thư mục
- `lib/main.dart`: Điểm bắt đầu của ứng dụng và cấu hình GoRouter.
- `lib/core/`: Các tiện ích cốt lõi, theme, và hằng số (constants).
- `lib/features/`: Mã nguồn chia theo từng module tính năng.
  - `dashboard/`: Trang Tổng quan chính.
  - `expenses/`: Quản lý giao dịch.
  - `assistant/`: Trợ lý AI Trò chuyện và Unico.
  - `planning/`: Ngân sách và Mục tiêu tiết kiệm.
  - `shared_funds/`: Theo dõi chi tiêu nhóm.
  - `gamification/`: Các thử thách và Phần thưởng.

## 🤝 Đóng góp

Sự đóng góp của cộng đồng mã nguồn mở là điều làm cho mọi thứ trở nên tuyệt vời. Bất kỳ đóng góp nào của bạn đều **rất được trân trọng**.

1. Fork Dự án
2. Tạo Feature Branch của bạn (`git checkout -b feature/TinhNangMoi`)
3. Commit các Thay đổi (`git commit -m 'Thêm một TinhNangMoi'`)
4. Push lên Branch (`git push origin feature/TinhNangMoi`)
5. Mở một Pull Request

## 📄 Giấy phép

Được phân phối dưới Giấy phép MIT. Xem `LICENSE` để biết thêm thông tin.

<p align="center">
  Được phát triển với ❤️ bởi Đội ngũ UniFines
</p>