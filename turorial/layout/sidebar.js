// Sidebar Component - Lowgrade Mobile Cheatsheet
(function () {
  const menuConfig = [
    {
      group: null, // Standalone item
      items: [
        { title: "Trang chủ & Mục lục", href: "index.html", id: "home" }
      ]
    },
    {
      group: "📘 Nền tảng",
      items: [
        { title: "1. Setup, Format, Cấu trúc", href: "01_nen_tang/01_setup_format_cautruc.html" },
        { title: "2. Debug và lỗi thường gặp", href: "01_nen_tang/02_debug_loi.html" },
        { title: "3. Dart cơ bản & Luồng xử lý", href: "01_nen_tang/03_dart_co_ban.html" },
        { title: "4. Tập dữ liệu & Generics", href: "01_nen_tang/04_collections.html" },
        { title: "5. OOP & Model JSON", href: "01_nen_tang/05_oop_model.html" },
        { title: "6. Bất đồng bộ (Future & Stream)", href: "01_nen_tang/06_async_future_stream.html" }
      ]
    },
    {
      group: " Flutter Căn Bản & Giao Diện",
      items: [
        { title: "1. Toàn diện về Flutter Widgets", href: "02_flutter_can_ban/01_widgets_can_ban.html" },
        { title: "2. ThemeData và Drawer", href: "02_flutter_can_ban/02_theme_drawer.html" },
        { title: "3. Navigation & Route", href: "02_flutter_can_ban/03_navigation_route.html" },
        { title: "4. Layout & Responsive Design", href: "02_flutter_can_ban/04_layout_responsive.html" },
        { title: "5. Form, Controller & Validation", href: "02_flutter_can_ban/05_form_validation.html" },
        { title: "6. Call REST API với http", href: "02_flutter_can_ban/06_call_api_http.html" },
        { title: "7. Quản lý State Riverpod", href: "02_flutter_can_ban/07_riverpod_state.html" },
        { title: "8. Local Storage & Prefs", href: "02_flutter_can_ban/08_local_storage_prefs.html" },
        { title: "9. SQLite Local & CRUD", href: "02_flutter_can_ban/09_sqlite_database_crud.html" }
      ]
    },
    {
      group: " Cheat Sheet Phòng Thi",
      items: [
        { title: "1. Thư viện & Cấu trúc dự án sẵn", href: "03_cheat_sheet/01_setup_libraries_project_structure.html" },
        { title: "2. Database & Static Validators Helper", href: "03_cheat_sheet/02_database_validator_helper.html" },
        { title: "3. Mẫu Register Screen (Đăng ký)", href: "03_cheat_sheet/03_register_screen.html" },
        { title: "4. Mẫu Login & Logout Screens", href: "03_cheat_sheet/04_login_logout_screen.html" },
        { title: "5. Mẫu Danh Sách ListView (Riverpod Code Gen)", href: "03_cheat_sheet/05_item_list_screens.html" },
        { title: "6. Mẫu Màn Hình Thêm & Sửa (Add / Edit)", href: "03_cheat_sheet/06_add_edit_screen.html" },
        { title: "7. Mẫu Màn Hình Chi Tiết (Detail Screen)", href: "03_cheat_sheet/07_detail_screen.html" },
        { title: "8. Tra Cứu Colors, Icons & Widgets", href: "03_cheat_sheet/08_common_widgets_reference.html" }
      ]
    },
    {
      group: " Giải Đề Mẫu 1 (Art Gallery)",
      items: [
        { title: "Bước 1. Khởi tạo & Thư viện dùng chung", href: "04_giai_de_mau_1/01_setup_project_libraries.html" },
        { title: "Bước 2. Phân tích & Tạo Data Models", href: "04_giai_de_mau_1/02_data_models.html" },
        { title: "Bước 3. Tầng CSDL DatabaseHelper", href: "04_giai_de_mau_1/03_database_helper.html" },
        { title: "Bước 4. Màn hình Đăng ký (Task 1)", href: "04_giai_de_mau_1/04_register_screen.html" },
        { title: "Bước 5. Quản lý Session (Task 3)", href: "04_giai_de_mau_1/05_session_service.html" },
        { title: "Bước 6. Màn hình Đăng nhập (Task 2)", href: "04_giai_de_mau_1/06_login_screen.html" },
        { title: "Bước 7. Màn hình Home & Xóa (Task 4 & 7)", href: "04_giai_de_mau_1/07_home_screen.html" },
        { title: "Bước 8. Màn hình Thêm tác phẩm (Task 5)", href: "04_giai_de_mau_1/08_add_screen.html" },
        { title: "Bước 9. Màn hình Chi tiết (Task 6)", href: "04_giai_de_mau_1/09_detail_screen.html" },
        { title: "Bước 10. Khởi chạy main.dart & Nộp bài", href: "04_giai_de_mau_1/10_main_entry.html" }
      ]
    }
  ];

  function renderSidebar() {
    // Determine relative root prefix
    // If current path includes subfolder like 01_nen_tang, 02_flutter_can_ban, or 03_exam_cheatsheet, prefix is '../'
    // Else it is ''
    const currentPath = window.location.pathname.replace(/\\/g, '/');
    let prefix = '';
    if (currentPath.includes('/01_nen_tang/') || currentPath.includes('/02_flutter_can_ban/') || currentPath.includes('/03_cheat_sheet/') || currentPath.includes('/04_giai_de_mau_1/')) {
      prefix = '../';
    }

    // Determine current file name or relative match
    const filename = currentPath.substring(currentPath.lastIndexOf('/') + 1) || 'index.html';

    let html = `
    <div class="sidebar-header">
      <h1>Flutter Cheatsheet</h1>
      <p>Dart + Flutter + Android Studio</p>
    </div>
    <div class="search-box">
      <input type="text" placeholder="Lọc nhanh trong trang..." oninput="filterPageContent(this.value)" />
    </div>
    <nav class="nav-menu">
    `;

    // Đọc trạng thái đóng/mở đã lưu từ localStorage
    let savedState = {};
    try {
      savedState = JSON.parse(localStorage.getItem('sidebar_group_state') || '{}');
    } catch (e) {
      savedState = {};
    }

    menuConfig.forEach(section => {
      if (!section.group) {
        html += `<div class="nav-group">`;
        section.items.forEach(item => {
          const itemHref = prefix + item.href;
          const targetFilename = item.href.substring(item.href.lastIndexOf('/') + 1);
          const isActive = (filename === targetFilename) || (item.id === 'home' && (filename === '' || filename === 'index.html'));
          const activeClass = isActive ? ' active' : '';
          html += `<a class="nav-item${activeClass}" href="${itemHref}"><span>${item.title}</span></a>`;
        });
        html += `</div>`;
        return;
      }

      // Kiểm tra xem nhóm này có chứa trang hiện tại không
      const hasActiveChild = section.items.some(item => {
        const targetFilename = item.href.substring(item.href.lastIndexOf('/') + 1);
        return filename === targetFilename;
      });

      // Nếu chứa trang hiện tại -> luôn mở để người dùng biết mình đang ở đâu
      // Nếu không chứa trang hiện tại -> tôn trọng trạng thái lưu trong localStorage (nếu người dùng đã đóng)
      const isSavedCollapsed = Boolean(savedState[section.group]);
      const isCollapsed = hasActiveChild ? false : isSavedCollapsed;
      const collapsedClass = isCollapsed ? ' collapsed' : '';

      html += `<div class="nav-group${collapsedClass}">`;
      html += `<div class="nav-group-header" data-group="${section.group}" onclick="toggleNavGroup(this)">${section.group}</div>`;
      html += `<div class="nav-group-content">`;

      section.items.forEach(item => {
        if (item.disabled) {
          html += `<span class="nav-item disabled"><span>${item.title}</span><span class="nav-badge">${item.badge || 'chưa soạn'}</span></span>`;
        } else {
          const itemHref = prefix + item.href;
          const targetFilename = item.href.substring(item.href.lastIndexOf('/') + 1);
          const isActive = (filename === targetFilename) || (item.id === 'home' && (filename === '' || filename === 'index.html'));
          const activeClass = isActive ? ' active' : '';

          html += `<a class="nav-item${activeClass}" href="${itemHref}"><span>${item.title}</span></a>`;
        }
      });

      html += `</div>`;
      html += `</div>`;
    });

    html += `</nav>`;

    let sidebarEl = document.querySelector('aside.sidebar');
    if (!sidebarEl) {
      sidebarEl = document.createElement('aside');
      sidebarEl.className = 'sidebar';
      document.body.insertAdjacentElement('afterbegin', sidebarEl);
    }
    sidebarEl.innerHTML = html;
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', renderSidebar);
  } else {
    renderSidebar();
  }
})();

