# 📱 Flutter & Dart Mobile Cheatsheet

> **Cẩm nang thực hành, tra cứu cú pháp, cấu trúc code mẫu và hướng dẫn giải đề PE (Practical Exam) / Đồ án Lập trình Di động Flutter từ cơ bản đến thực chiến.**

---

## 📌 1. Giới thiệu Repo

**Lowgrade Mobile Cheatsheet** là bộ tài liệu tổng hợp toàn diện dành cho sinh viên và lập trình viên học **Flutter & Dart**, đặc biệt tối ưu cho việc ôn luyện và thi thực hành môn Mobile (PE - Practical Exam). 

Tài liệu được xây dựng dưới dạng **Website tra cứu Offline** giao diện trực quan (hỗ trợ Dark Mode, tìm kiếm toàn trang, nút copy code 1-chạm) đi kèm **Mã nguồn dự án mẫu hoàn chỉnh (source_pe)** và **Đề thi thực tế (test_example)** giúp bạn vừa học lý thuyết, vừa tra cứu siêu tốc trong phòng thi, vừa thực hành giải đề trọn vẹn.

---

## 🚀 2. Hướng dẫn sử dụng

### 🌐 2.1. Sử dụng Website Cheatsheet Tra Cứu

Website tài liệu được lưu trữ trong thư mục `turorial/` hoàn toàn dưới dạng **HTML tĩnh thuần túy (Static Offline Web)** — không cần server, không cần cài đặt môi trường hay chạy bất kỳ tool nào:

* **Mở trực tiếp:** Nhấp đúp chuột hoặc mở file `turorial/index.html` bằng bất kỳ trình duyệt nào (Chrome, Edge, Firefox, Brave...).
* **Mở trong VS Code:** Nếu bạn đang mở thư mục trên VS Code, có thể chuột phải vào file `turorial/index.html` chọn **Open with Live Server** hoặc mở bằng trình duyệt mặc định.

> [!TIP]
> **Mẹo phòng thi:**
> * Sử dụng ô **"Lọc nhanh trong trang..."** ở thanh sidebar bên trái để tìm kiếm tức thì mọi hàm, cú pháp hoặc từ khoá.
> * Mỗi khối code đều có nút **Copy** ở góc trên bên phải để copy nhanh vào Android Studio / VS Code.
> * Dùng tổ hợp phím <kbd>Ctrl</kbd> + <kbd>F</kbd> (Mac: <kbd>Cmd</kbd> + <kbd>F</kbd>) để tìm nhanh nội dung chi tiết trong từng trang.

---

### 💻 2.2. Chạy Dự Án Mẫu (`source_pe`)

Thư mục `source_pe/` là một ứng dụng Flutter hoàn chỉnh được cấu hình sẵn toàn bộ thư viện cần thiết cho bài thi thực hành (SQLite, Riverpod, SharedPreferences, HTTP, Form Validation).

1. **Di chuyển vào thư mục dự án và tải thư viện:**
   ```bash
   cd source_pe
   flutter pub get
   ```

2. **Chạy ứng dụng:**
   * **Chạy trên trình duyệt Chrome (Đặc biệt khuyến nghị khi máy ảo Android bị chậm):**
     ```bash
     flutter run -d chrome --web-port=8080
     ```
     *(Cố định port `8080` để giữ nguyên dữ liệu SQLite IndexedDB của Web Browser qua các lần khởi động lại)*.
   * **Chạy trên máy ảo / thiết bị thật Android:**
     ```bash
     flutter run
     ```

3. **Sinh mã tự động cho Riverpod (nếu có chỉnh sửa provider):**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

---

## 📂 3. Cấu trúc thư mục Repository

```text
Lowgrade_Mobile_Cheatsheet/
├── README.md                      # Tài liệu hướng dẫn tổng quan của repository
│
├── turorial/                      # Website Cheatsheet tra cứu kiến thức & phòng thi
│   ├── index.html                 # Trang chủ & Mục lục toàn bộ cẩm nang
│   ├── style.css                  # Giao diện Dark Theme hiện đại, tối ưu tra cứu
│   ├── common.js                  # Xử lý các tương tác UI, copy code, theme
│   │
│   ├── 01_nen_tang/               # [Nhóm 1] Nền tảng công cụ, môi trường & ngôn ngữ Dart
│   │   ├── 01_setup_format_cautruc.html   # Setup SDK, Android Studio, phím tắt, cấu trúc thư mục
│   │   ├── 02_debug_loi.html              # Đọc log, fix lỗi màn hình đỏ, overflow, lỗi Gradle build
│   │   ├── 03_dart_co_ban.html            # Null Safety, String Interpolation, If-Else, Switch, Loop, Hàm
│   │   ├── 04_collections.html            # Generics, List, Set, Map, Spread operator, Collection-if/for
│   │   ├── 05_oop_model.html              # Constructor, Inheritance, Mixin, Extension, fromJson/toJson
│   │   └── 06_async_future_stream.html    # Event Loop, Future, async/await, Stream, async*
│   │
│   ├── 02_flutter_can_ban/        # [Nhóm 2] Giao diện, State & Cơ sở dữ liệu Flutter
│   │   ├── 01_widgets_can_ban.html        # StatelessWidget, StatefulWidget, Lifecycle, Layout widgets, Inputs
│   │   ├── 02_theme_drawer.html           # ThemeData, ColorScheme.fromSeed, Drawer chọn Theme, Dark Mode
│   │   ├── 03_navigation_route.html       # Navigator LIFO stack, Named Routes, truyền nhận tham số 2 chiều
│   │   ├── 04_layout_responsive.html      # BoxConstraints, Row/Column, GridView, Expanded, Responsive vs Adaptive
│   │   ├── 05_form_validation.html        # Form, GlobalKey<FormState>, TextEditingController, Regex validators
│   │   ├── 06_call_api_http.html          # Gọi REST API (GET, POST), Model mapping, HTTP status codes, Dio
│   │   ├── 07_riverpod_state.html         # Quản lý State với Riverpod Generator (@riverpod, AsyncNotifier)
│   │   ├── 08_local_storage_prefs.html    # Lưu trữ Shared Preferences (Session, Auth Token, Dark Mode)
│   │   └── 09_sqlite_database_crud.html   # SQLite cục bộ trọn bộ CRUD, Singleton DatabaseHelper
│   │
│   ├── 03_cheat_sheet/            # [Nhóm 3] Cheat Sheet Phòng Thi (Code mẫu Copy & Paste)
│   │   ├── 01_setup_libraries_project_structure.html # pubspec.yaml chuẩn 100%, cấu trúc thư mục lib/
│   │   ├── 02_database_validator_helper.html        # Models mẫu, DatabaseHelper đa nền tảng, Static AppValidator
│   │   ├── 03_register_screen.html                  # Mẫu giao diện và logic Đăng ký tài khoản
│   │   ├── 04_login_logout_screen.html              # Mẫu giao diện Đăng nhập & Xử lý Session Logout
│   │   ├── 05_home_screen.html                      # Mẫu Home chuyển đổi ListView / Responsive GridView
│   │   ├── 06_delete_dialog.html                    # Hộp thoại xác nhận xóa (AlertDialog) & SnackBar
│   │   ├── 07_add_item_screen.html                  # Màn hình thêm mới dữ liệu kèm Dropdown & Validate
│   │   ├── 08_edit_item_screen.html                 # Màn hình chỉnh sửa nạp dữ liệu cũ initState()
│   │   ├── 09_detail_screen.html                    # Màn hình chi tiết sản phẩm / thực thể
│   │   ├── 10_drawer_theme_service.html             # Mẫu Drawer đổi theme Sáng/Tối qua SharedPreferences
│   │   ├── 11_common_widgets_reference.html         # Bảng tra cứu Colors, Icons và Widget parameters
│   │   └── 12_run_flow_architecture_guide.html      # Hướng dẫn cố định Port Web 8080 & sơ đồ luồng dữ liệu
│   │
│   ├── 04_giai_de_mau_1/          # [Nhóm 4] Hướng Dẫn Giải Đề Mẫu Chi Tiết (Art Gallery Manager)
│   │   ├── 01_setup_project_libraries.html          # Bước 1: Khởi tạo dự án và khai báo thư viện
│   │   ├── 02_data_models.html                      # Bước 2: Phân tích đề & xây dựng UserModel, ArtworkModel
│   │   ├── 03_database_helper.html                  # Bước 3: DatabaseHelper, Seeding dữ liệu mẫu ban đầu
│   │   ├── 04_register_screen.html                  # Bước 4: Hoàn thiện Task 1 - Màn hình Đăng ký
│   │   ├── 05_session_service.html                  # Bước 5: Hoàn thiện Task 3 - SessionService
│   │   ├── 06_login_screen.html                     # Bước 6: Hoàn thiện Task 2 - Màn hình Đăng nhập
│   │   ├── 07_home_screen.html                      # Bước 7: Hoàn thiện Task 4 & 7 - Danh sách Home & Xóa
│   │   ├── 08_add_screen.html                       # Bước 8: Hoàn thiện Task 5 - Màn hình Thêm tác phẩm
│   │   ├── 09_detail_screen.html                    # Bước 9: Hoàn thiện Task 6 - Màn hình Chi tiết tác phẩm
│   │   └── 10_main_entry.html                       # Bước 10: main.dart, phân luồng Auth & kiểm thử 7 Tasks
│   │
│   └── layout/                    # Thành phần hệ thống của Cheatsheet
│       ├── generate_search_index.py                 # Script tự động trích xuất nội dung HTML thành search index
│       ├── search-index.js                          # Dữ liệu chỉ mục tìm kiếm
│       └── sidebar.js                               # Sidebar động tự động render cho tất cả các trang
│
├── source_pe/                     # Full Source Code dự án Flutter hoàn chỉnh (Chuẩn hóa cho bài thi PE)
│   ├── lib/
│   │   ├── main.dart              # Entrypoint điều hướng Session Gatekeeper
│   │   ├── models/                # User model, Item model
│   │   ├── providers/             # Riverpod State Notifiers & Providers (.g.dart)
│   │   ├── screens/               # Register, Login, Home, Add, Edit, Detail
│   │   ├── services/              # SessionService, ThemeService
│   │   ├── utils/                 # DatabaseHelper, AppValidator, AppTheme
│   │   └── widgets/               # AppDrawer, DeleteDialog, Card & Grid Widgets
│   ├── pubspec.yaml               # Danh sách packages chuẩn
│   └── web/                       # Hỗ trợ chạy SQLite trên nền Web WebAssembly (Wasm)
│
└── test_example/                  # Đề thi thực hành mẫu và tư liệu
    ├── no_1/                      # Đề mẫu số 1 (Art Gallery Manager)
    │   ├── exam_paper/            # Ảnh chụp các trang đề bài (no_1.png -> no_6.png)
    │   ├── material/              # Dữ liệu đề bài cung cấp (banner.jpg, dataSample.txt)
    │   └── src.zip                # File nén source khởi tạo từ giám thị
    └── no_2/                      # Đề mẫu số 2 (dự phòng / mở rộng)
```

---

## 📚 4. Nội dung chi tiết trong tài liệu

Bộ tài liệu được chia làm **4 nhóm chuyên đề lớn**:

### 1️⃣ Nhóm 1: Nền tảng Công cụ & Ngôn ngữ Dart (`01_nen_tang`)
* **Setup & Format**: Quy chuẩn đặt tên, phím tắt thiết yếu trong Android Studio/VS Code, kiến trúc thư mục chuẩn.
* **Debug & Lỗi thường gặp**: Đọc hiểu Stack Trace, bắt lỗi RenderFlex Overflow (vạch vàng đen), lỗi đỏ `setState() called after dispose()`, sửa lỗi Gradle build Android.
* **Dart Core**: Null Safety (`?`, `!`, `??`, `late`), chuỗi, toán tử, cú pháp Switch Expression mới nhất của Dart 3.
* **Collections**: Thao tác chuyên sâu trên `List`, `Set`, `Map`, các phương thức `.map()`, `.where()`, `.reduce()`, cú pháp `...` (Spread).
* **OOP & JSON Model**: Kế thừa, Interface, Mixin, Extension Methods, tự viết hàm `toMap()` và `fromMap()` chuẩn xác để lưu trữ CSDL.
* **Bất đồng bộ**: Hiểu bản chất Event Loop, xử lý Microtask, `Future`, `async/await`, và dòng dữ liệu `Stream` với `async*` / `yield`.

### 2️⃣ Nhóm 2: Giao diện (UI), State & Cơ sở dữ liệu (`02_flutter_can_ban`)
* **Flutter Widgets**: Phân biệt StatelessWidget vs StatefulWidget, vòng đời Widget (`initState`, `didUpdateWidget`, `dispose`), các widgets dựng layout và input components.
* **Theme & Drawer**: Tạo ColorScheme, Dark/Light Mode, thanh điều hướng Drawer chuyên nghiệp.
* **Navigation & Routing**: Cơ chế ngăn xếp LIFO, `Navigator.push`, `Navigator.pop`, truyền dữ liệu 2 chiều giữa các màn hình.
* **Layout & Responsive**: BoxConstraints, kết hợp linh hoạt `Row`, `Column`, `Wrap`, `Expanded`, `Flexible`, `GridView`.
* **Form & Validation**: Quản lý `GlobalKey<FormState>`, xử lý `TextEditingController`, regex kiểm tra email, số, password trùng khớp.
* **Call API**: Kết nối mạng với gói `http` và `dio`, xử lý try-catch timeout, status code, decode JSON danh sách.
* **State Management**: Sử dụng **Riverpod 3.x** kết hợp code generation (`@riverpod`, `riverpod_generator`).
* **Lưu trữ CSDL**: Lưu trạng thái phiên với `shared_preferences`; CRUD dữ liệu hoàn chỉnh với `sqflite`.

### 3️⃣ Nhóm 3: Cheat Sheet Phòng Thi (Copy & Paste Thực Chiến) (`03_cheat_sheet`)
* Cung cấp sẵn **khung mã nguồn hoàn chỉnh** cho từng thành phần trong bài thi thực hành:
  * File `pubspec.yaml` đầy đủ dependencies chuẩn phiên bản, không bị xung đột `dependency_overrides`.
  * `DatabaseHelper` chạy tốt trên cả máy thật và Chrome Web (nhờ `sqflite_common_ffi_web`).
  * Màn hình chuẩn: **Login**, **Register**, **Home (ListView + GridView)**, **Add**, **Edit**, **Detail**, **Confirm Delete Modal**, **AppDrawer**.
  * Bảng tra cứu nhanh mã màu và danh sách Icons Material thông dụng trong đề thi.
  * Hướng dẫn chạy cố định port web (`--web-port=8080`) tránh mất dữ liệu SQLite IndexedDB.

---

## 🛠️ 5. Yêu cầu hệ thống

* **Flutter SDK**: `>= 3.13.x` (khuyến nghị Flutter 3.24 trở lên)
* **Dart SDK**: `^3.x`
* **Công cụ lập trình**: Android Studio hoặc Visual Studio Code (đã cài Flutter & Dart extensions)
* **Trình duyệt**: Google Chrome hoặc Microsoft Edge (dùng để xem Cheatsheet và test Web)

---

## 🤝 6. Đóng góp & Bản quyền

Repository được biên soạn và xây dựng nhằm mục đích phi thương mại, phục vụ việc học tập và nghiên cứu công nghệ lập trình di động với Flutter.

Mọi đóng góp (Pull Request, Báo lỗi qua Issue) đều được hoan nghênh để hoàn thiện tài liệu hơn! Vui lòng đọc kỹ [Hướng Dẫn Đóng Góp (CONTRIBUTING.md)](CONTRIBUTING.md) để biết quy trình Fork & Pull Request chi tiết.
