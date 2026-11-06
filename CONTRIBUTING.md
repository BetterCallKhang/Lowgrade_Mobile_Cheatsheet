# 🤝 Hướng Dẫn Đóng Góp (Contributing Guide)

Cảm ơn bạn đã quan tâm và muốn đóng góp cho **Lowgrade Mobile Cheatsheet**! 

Mọi sự đóng góp của bạn — từ việc sửa lỗi chính tả trong tài liệu HTML, tối ưu hoá code mẫu `source_pe`, đến việc bổ sung các đề thi PE thực tế mới — đều giúp tài liệu này ngày càng hữu ích hơn cho cộng đồng sinh viên và lập trình viên Flutter.

---

## ❓ Cơ chế đóng góp mã nguồn mở (Fork & Pull Request)

> **Bạn thắc mắc:** *"Nếu không phải là cộng tác viên (Collaborator) có quyền ghi trực tiếp vào repo, mình sẽ đóng góp bằng cách tạo Fork rồi gửi Pull Request đúng không?"*

👉 **Chính xác 100%!** Đây là quy trình chuẩn (GitHub Fork & PR Workflow) áp dụng cho hầu hết các dự án nguồn mở trên toàn thế giới:
1. Bạn tạo một bản sao riêng của dự án về tài khoản GitHub của bạn (**Fork**).
2. Bạn sửa code trên bản sao đó một cách tự do mà không sợ ảnh hưởng đến dự án gốc.
3. Khi hoàn tất, bạn gửi yêu cầu (**Pull Request - PR**) để chủ dự án xem xét và hợp nhất (Merge) những đóng góp của bạn vào nhánh chính.

---

## 🚀 Quy trình từng bước tạo Fork và gửi PR

### 🍴 Bước 1: Fork Repository
1. Truy cập vào trang chính của repository: [BetterCallKhang/Lowgrade_Mobile_Cheatsheet](https://github.com/BetterCallKhang/Lowgrade_Mobile_Cheatsheet).
2. Nhấn nút **Fork** ở góc trên cùng bên phải màn hình.
3. Chọn tài khoản GitHub cá nhân của bạn và nhấn **Create fork**.
4. Lúc này bạn đã có một bản sao độc lập tại: `https://github.com/<tai-khoan-cua-ban>/Lowgrade_Mobile_Cheatsheet`.

---

### 📥 Bước 2: Clone Fork về máy tính cá nhân
Mở Terminal / Git Bash trên máy của bạn và chạy:

```bash
# Thay thế <tai-khoan-cua-ban> bằng username GitHub của bạn
git clone https://github.com/<tai-khoan-cua-ban>/Lowgrade_Mobile_Cheatsheet.git

# Di chuyển vào thư mục dự án
cd Lowgrade_Mobile_Cheatsheet

# (Khuyên dùng) Thêm remote upstream để dễ dàng đồng bộ cập nhật từ repo gốc sau này
git remote add upstream https://github.com/BetterCallKhang/Lowgrade_Mobile_Cheatsheet.git
```

---

### 🌿 Bước 3: Tạo nhánh mới (Feature / Fix Branch)
Không nên commit trực tiếp trên nhánh `main` hoặc `dev` cá nhân. Hãy luôn tạo một nhánh riêng cho từng tính năng hoặc nội dung bạn muốn chỉnh sửa:

```bash
# Đảm bảo bạn đang ở nhánh mới nhất
git checkout dev 2>/dev/null || git checkout main

# Tạo và chuyển sang nhánh mới với tên gợi mở
git checkout -b fix/typo-sqlite-guide
# hoặc:
# git checkout -b feature/them-de-pe-so-2
# git checkout -b docs/cap-nhat-widget-cheatsheet
```

---

### ✏️ Bước 4: Thực hiện chỉnh sửa & Kiểm thử
Bạn có thể đóng góp ở nhiều mảng:
* **Sửa / Bổ sung tài liệu HTML (`turorial/`):** Chỉnh sửa cú pháp, bổ sung giải thích, sửa lỗi chính tả. Sau khi sửa, mở trực tiếp file `turorial/index.html` trên trình duyệt để kiểm tra giao diện và hiển thị.
* **Cải tiến mã nguồn mẫu (`source_pe/`):** Tối ưu hóa code Dart, bổ sung widget tiện ích. Hãy đảm bảo chạy thử dự án và kiểm tra cú pháp (`flutter pub get`, `flutter analyze` hoặc chạy thử trên Chrome/máy ảo).
* **Đóng góp đề thi mẫu mới (`test_example/`):** Thêm đề thi mới vào `test_example/no_2/`, `no_3/` kèm hình ảnh đề bài và dữ liệu mẫu (`material/`).

---

### 💾 Bước 5: Commit và Push lên Fork của bạn

1. Kiểm tra lại các file đã thay đổi:
   ```bash
   git status
   ```

2. Thêm file vào danh sách commit:
   ```bash
   git add .
   ```

3. Commit với thông điệp rõ ràng, súc tích (khuyến nghị theo chuẩn [Conventional Commits](https://www.conventionalcommits.org/)):
   ```bash
   git commit -m "docs: sua loi cu phap phan sqlite trong turorial/02_flutter_can_ban"
   ```

4. Đẩy (push) nhánh lên GitHub cá nhân của bạn:
   ```bash
   git push origin <ten-nhanh-cua-ban>
   # Ví dụ: git push origin fix/typo-sqlite-guide
   ```

---

### 📬 Bước 6: Tạo Pull Request (PR)

1. Mở trình duyệt và truy cập vào repository trên GitHub của bạn (`https://github.com/<tai-khoan-cua-ban>/Lowgrade_Mobile_Cheatsheet`).
2. GitHub sẽ tự động hiển thị thanh thông báo màu vàng có nút **Compare & pull request** cho nhánh bạn vừa push. Nhấn vào nút đó (hoặc vào tab **Pull Requests** > **New pull request**).
3. Đảm bảo nhánh gốc nhận PR là `dev` (hoặc `main` nếu dự án chỉ định).
4. Điền tiêu đề và mô tả chi tiết:
   - **Thay đổi những gì?** (What changed?)
   - **Lý do thay đổi?** (Why?)
   - **Ảnh chụp màn hình kết quả (nếu có)** (Screenshots).
5. Nhấn **Create pull request**.

🎉 **Xong!** Chủ sở hữu dự án sẽ nhận được thông báo, review lại code/nội dung của bạn và tiến hành thảo luận hoặc chấp nhận (Merge) vào dự án.

---

## 📌 Quy ước đóng góp

### 1. Quy tắc đặt tên nhánh (Branch naming)
* `fix/<ten-loi>`: Sửa lỗi hiển thị, lỗi cú pháp, link hỏng (ví dụ: `fix/broken-link-navigation`).
* `feat/<tinh-nang>`: Thêm bài học mới, bổ sung màn hình mới trong `source_pe` (ví dụ: `feat/add-search-bar-widget`).
* `docs/<noi-dung>`: Cập nhật tài liệu, README, giải thích kiến thức (ví dụ: `docs/update-riverpod-note`).

### 2. Tiền tố Commit Message
* `feat:` Tính năng mới, màn hình mới hoặc bài hướng dẫn mới.
* `fix:` Sửa lỗi hiển thị HTML, lỗi logic code Dart.
* `docs:` Cập nhật tài liệu, sửa lỗi chính tả.
* `refactor:` Tối ưu cấu trúc code mà không thay đổi tính năng.
* `style:` Chỉnh sửa format, thụt dòng, CSS giao diện.

### 3. Lưu ý an toàn cho bài thi PE
* Giữ nội dung trong `turorial/` ở định dạng **HTML/CSS/JS tĩnh hoàn toàn**, không đưa vào các dependencies bên ngoài yêu cầu server/runtime lạ, đảm bảo người học có thể mở và tra cứu offline một cách an toàn nhất trong phòng thi.

---

## 💖 Cảm ơn bạn!
Mỗi đóng góp của bạn, dù là nhỏ nhất, đều có ý nghĩa rất lớn với cộng đồng người học Flutter!

