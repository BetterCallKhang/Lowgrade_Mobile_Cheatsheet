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
      group: "Nền tảng",
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
      group: "Flutter Căn Bản & Giao Diện",
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
      group: "Cheat Sheet Phòng Thi",
      items: [
        { title: "1. Thư viện & Cấu trúc dự án sẵn", href: "03_cheat_sheet/01_setup_libraries_project_structure.html" },
        { title: "2. Database & Static Validators Helper", href: "03_cheat_sheet/02_database_validator_helper.html" },
        { title: "3. Mẫu Register Screen (Đăng ký)", href: "03_cheat_sheet/03_register_screen.html" },
        { title: "4. Mẫu Login & Logout Screens", href: "03_cheat_sheet/04_login_logout_screen.html" },
        { title: "5. Mẫu Màn Hình Home (HomeScreen)", href: "03_cheat_sheet/05_home_screen.html" },
        { title: "6. Mẫu Hộp Thoại Xác Nhận Xóa (DeleteDialog)", href: "03_cheat_sheet/06_delete_dialog.html" },
        { title: "7. Mẫu Màn Hình Thêm Mới (AddItemScreen)", href: "03_cheat_sheet/07_add_item_screen.html" },
        { title: "8. Mẫu Màn Hình Chỉnh Sửa (EditItemScreen)", href: "03_cheat_sheet/08_edit_item_screen.html" },
        { title: "9. Mẫu Màn Hình Chi Tiết (Detail Screen)", href: "03_cheat_sheet/09_detail_screen.html" },
        { title: "10. Mẫu Drawer, Theme & Đổi Giao Diện", href: "03_cheat_sheet/10_drawer_theme_service.html" },
        { title: "11. Tra Cứu Colors, Icons & Widgets", href: "03_cheat_sheet/11_common_widgets_reference.html" },
        { title: "12. Chạy Cố Định Port & Luồng Component", href: "03_cheat_sheet/12_run_flow_architecture_guide.html" }
      ]
    },
    {
      group: "Giải Đề Mẫu 1 (Art Gallery)",
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

  // Xác định tiền tố tương đối tới thư mục gốc
  const currentPath = window.location.pathname.replace(/\\/g, '/');
  let prefix = '';
  if (
    currentPath.includes('/01_nen_tang/') ||
    currentPath.includes('/02_flutter_can_ban/') ||
    currentPath.includes('/03_cheat_sheet/') ||
    currentPath.includes('/04_giai_de_mau_1/')
  ) {
    prefix = '../';
  }

  // Tên file hiện tại
  const filename = currentPath.substring(currentPath.lastIndexOf('/') + 1) || 'index.html';

  // Lấy trạng thái accordion từ localStorage
  function getSavedState() {
    try {
      return JSON.parse(localStorage.getItem('sidebar_group_state') || '{}');
    } catch (e) {
      return {};
    }
  }

  // Chuẩn hóa tiếng Việt bỏ dấu và chuyển chữ thường
  function removeVietnameseTones(str) {
    if (!str) return '';
    return str
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/đ/g, 'd')
      .replace(/Đ/g, 'd')
      .toLowerCase();
  }

  // Đếm số lần xuất hiện của chuỗi tìm kiếm trong văn bản
  function countOccurrences(text, searchStr) {
    if (!text || !searchStr) return 0;
    let count = 0;
    let pos = 0;
    const step = searchStr.length;
    while ((pos = text.indexOf(searchStr, pos)) !== -1) {
      count++;
      pos += step;
    }
    return count;
  }

  // Tiền xử lý index để tìm kiếm siêu tốc
  let indexPrepared = false;
  function prepareIndex() {
    if (indexPrepared || !window.CHEATSHEET_SEARCH_INDEX) return;
    for (const key in window.CHEATSHEET_SEARCH_INDEX) {
      const entry = window.CHEATSHEET_SEARCH_INDEX[key];
      const headingsText = Array.isArray(entry.headings) ? entry.headings.join(' ') : '';
      const rawText = (entry.title || '') + ' ' + headingsText + ' ' + (entry.content || '');
      entry._rawLower = rawText.toLowerCase();
      entry._norm = removeVietnameseTones(rawText);
      entry._titleNorm = removeVietnameseTones(entry.title || '');
      entry._headingsNorm = removeVietnameseTones(headingsText);
    }
    indexPrepared = true;
  }

  // Đảm bảo file search-index.js đã nạp
  function ensureSearchIndexLoaded() {
    if (window.CHEATSHEET_SEARCH_INDEX) {
      prepareIndex();
      return;
    }
    if (document.querySelector('script[data-search-index]')) return;

    const script = document.createElement('script');
    script.setAttribute('data-search-index', 'true');
    script.src = prefix + 'layout/search-index.js';
    script.async = true;
    script.onload = function () {
      prepareIndex();
      const input = document.getElementById('sidebar-search-input');
      if (input && input.value.trim()) {
        performSearch(input.value);
      }
    };
    document.head.appendChild(script);
  }

  // Kiểm tra độ khớp của 1 trang với từ khóa tìm kiếm
  // Trả về số điểm / số lần khớp (> 0 là khớp, 0 là không khớp)
  function matchPage(href, title, groupName, qRaw, qNorm, qTerms) {
    let score = 0;

    // 1. Kiểm tra tiêu đề trang và tên nhóm (ngay cả khi chưa tải index)
    const titleNorm = removeVietnameseTones(title);
    const groupNorm = removeVietnameseTones(groupName || '');

    if (titleNorm.includes(qNorm)) score += 20;
    if (groupNorm && groupNorm.includes(qNorm)) score += 5;

    // 2. Tìm kiếm toàn diện trong index nội dung
    if (window.CHEATSHEET_SEARCH_INDEX && window.CHEATSHEET_SEARCH_INDEX[href]) {
      const entry = window.CHEATSHEET_SEARCH_INDEX[href];
      if (!entry._norm) prepareIndex();

      const rawQ = qRaw.toLowerCase();

      // Đếm số lần xuất hiện cụm từ chính xác
      const normMatches = countOccurrences(entry._norm, qNorm);
      const rawMatches = countOccurrences(entry._rawLower, rawQ);
      const occurrences = Math.max(normMatches, rawMatches);

      if (occurrences > 0) {
        score += occurrences;
        if (entry._headingsNorm && entry._headingsNorm.includes(qNorm)) {
          score += 10;
        }
      } else if (qTerms.length > 1) {
        // Nếu không khớp cả cụm, kiểm tra nếu tất cả các từ đơn đều xuất hiện
        const allTermsMatch = qTerms.every(term => entry._norm.includes(term) || entry._rawLower.includes(term));
        if (allTermsMatch) {
          score += 1;
        }
      }
    }

    return score;
  }

  // Thực hiện tìm kiếm và cập nhật giao diện sidebar
  function performSearch(query) {
    const trimmed = (query || '').trim();
    const clearBtn = document.getElementById('search-clear-btn');
    const statusEl = document.getElementById('search-status');
    const emptyStateEl = document.getElementById('sidebar-empty-search');
    const savedState = getSavedState();

    if (clearBtn) {
      clearBtn.style.display = trimmed ? 'flex' : 'none';
    }

    // ==========================================
    // TRƯỜNG HỢP 1: BÌNH THƯỜNG (Ô tìm kiếm trống)
    // Hiện đầy đủ tất cả các trang và khôi phục trạng thái đóng/mở
    // ==========================================
    if (!trimmed) {
      if (statusEl) {
        statusEl.style.display = 'none';
        statusEl.innerHTML = '';
      }
      if (emptyStateEl) {
        emptyStateEl.style.display = 'none';
      }

      // Khôi phục tất cả nav-item
      const items = document.querySelectorAll('.nav-menu .nav-item');
      items.forEach(it => {
        it.style.display = '';
        const searchBadge = it.querySelector('.search-badge');
        if (searchBadge) searchBadge.remove();
        // Khôi phục badge gốc nếu có
        const origBadge = it.querySelector('.nav-badge-original');
        if (origBadge) {
          origBadge.style.display = '';
        }
      });

      // Khôi phục tất cả nav-group
      const groups = document.querySelectorAll('.nav-menu .nav-group');
      groups.forEach(g => {
        g.style.display = '';
        const header = g.querySelector('.nav-group-header');
        if (header) {
          const groupName = header.getAttribute('data-group') || header.innerText.trim();
          const isSavedCollapsed = Boolean(savedState[groupName]);
          const hasActiveChild = g.querySelector('.nav-item.active') !== null;

          if (hasActiveChild) {
            g.classList.remove('collapsed');
          } else if (isSavedCollapsed) {
            g.classList.add('collapsed');
          } else {
            g.classList.remove('collapsed');
          }
        }
      });

      return;
    }

    // ==========================================
    // TRƯỜNG HỢP 2: ĐANG TÌM KIẾM
    // Chỉ hiện các trang liên quan, tự mở rộng nhóm có kết quả
    // ==========================================
    if (window.CHEATSHEET_SEARCH_INDEX && !indexPrepared) {
      prepareIndex();
    }

    const qRaw = trimmed;
    const qNorm = removeVietnameseTones(trimmed);
    const qTerms = qNorm.split(/\s+/).filter(Boolean);

    let totalMatchedPages = 0;

    const groups = document.querySelectorAll('.nav-menu .nav-group');
    groups.forEach(groupEl => {
      const header = groupEl.querySelector('.nav-group-header');
      const groupName = header ? (header.getAttribute('data-group') || header.innerText.trim()) : '';
      const items = groupEl.querySelectorAll('.nav-item');
      let groupMatchCount = 0;

      items.forEach(itemEl => {
        const href = itemEl.getAttribute('data-href');
        const title = itemEl.getAttribute('data-title') || itemEl.innerText.trim();

        const matchScore = matchPage(href, title, groupName, qRaw, qNorm, qTerms);

        if (matchScore > 0) {
          itemEl.style.display = 'flex';
          groupMatchCount++;
          totalMatchedPages++;

          // Ẩn badge gốc khi tìm kiếm
          const origBadge = itemEl.querySelector('.nav-badge:not(.search-badge)');
          if (origBadge) {
            origBadge.classList.add('nav-badge-original');
            origBadge.style.display = 'none';
          }

          // Cập nhật hoặc tạo badge hiển thị độ khớp
          let searchBadge = itemEl.querySelector('.search-badge');
          if (!searchBadge) {
            searchBadge = document.createElement('span');
            searchBadge.className = 'nav-badge search-badge';
            itemEl.appendChild(searchBadge);
          }
          searchBadge.innerText = matchScore > 1 ? `${matchScore} khớp` : 'khớp';
        } else {
          itemEl.style.display = 'none';
          const searchBadge = itemEl.querySelector('.search-badge');
          if (searchBadge) searchBadge.remove();
        }
      });

      if (groupMatchCount > 0) {
        // Nhóm có chứa trang khớp: Hiển thị và tự động mở ra
        groupEl.style.display = '';
        groupEl.classList.remove('collapsed');
      } else {
        // Nhóm không có trang nào khớp: Ẩn hoàn toàn
        groupEl.style.display = 'none';
      }
    });

    // Cập nhật thông báo trạng thái tìm kiếm
    if (statusEl) {
      statusEl.style.display = 'flex';
      if (totalMatchedPages > 0) {
        statusEl.className = 'search-status has-results';
        statusEl.innerHTML = `<span><span class="status-count">${totalMatchedPages}</span> trang phù hợp</span><span>Nhấn Esc để hủy</span>`;
      } else {
        statusEl.className = 'search-status no-results';
        statusEl.innerHTML = `<span>Không tìm thấy trang nào</span>`;
      }
    }

    // Hiển thị khung thông báo trống nếu không có kết quả nào
    if (emptyStateEl) {
      if (totalMatchedPages === 0) {
        emptyStateEl.style.display = 'block';
        const safeQuery = trimmed.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
        emptyStateEl.innerHTML = `
          <div class="empty-icon">🔍</div>
          <div class="empty-title">Không tìm thấy kết quả</div>
          <div class="empty-desc">Không có trang nào chứa từ khóa "<strong>${safeQuery}</strong>"</div>
          <button type="button" class="empty-reset-btn" onclick="clearSidebarSearch()">Xem lại tất cả trang</button>
        `;
      } else {
        emptyStateEl.style.display = 'none';
      }
    }
  }

  // Phơi ra các hàm điều khiển tìm kiếm toàn cục
  window.handleSidebarSearch = function (value) {
    performSearch(value);
  };

  window.clearSidebarSearch = function () {
    const input = document.getElementById('sidebar-search-input');
    if (input) {
      input.value = '';
      performSearch('');
      input.focus();
    }
  };

  // Đóng/mở nhóm accordion và lưu vào localStorage
  window.toggleNavGroup = function (header) {
    const group = header.closest('.nav-group');
    if (group) {
      group.classList.toggle('collapsed');
      try {
        const groupName = header.getAttribute('data-group') || header.innerText.trim();
        const savedState = getSavedState();
        savedState[groupName] = group.classList.contains('collapsed');
        localStorage.setItem('sidebar_group_state', JSON.stringify(savedState));
      } catch (e) {
        console.warn('Cannot save sidebar state:', e);
      }
    }
  };

  // Lắng nghe phím tắt: Esc để xóa tìm kiếm, '/' để focus vào ô tìm kiếm
  document.addEventListener('keydown', function (e) {
    const searchInput = document.getElementById('sidebar-search-input');
    if (!searchInput) return;

    if (e.key === 'Escape' && document.activeElement === searchInput) {
      window.clearSidebarSearch();
    } else if (
      e.key === '/' &&
      document.activeElement.tagName !== 'INPUT' &&
      document.activeElement.tagName !== 'TEXTAREA'
    ) {
      e.preventDefault();
      searchInput.focus();
      searchInput.select();
    }
  });

  // Render HTML cho Sidebar
  function renderSidebar() {
    let html = `
    <div class="sidebar-header">
      <h1>Flutter Cheatsheet</h1>
      <p>Dart + Flutter + Android Studio</p>
    </div>
    <div class="search-box">
      <div class="search-input-wrap">
        <span class="search-icon">
          <svg viewBox="0 0 16 16" width="13" height="13" fill="currentColor">
            <path d="M10.68 11.74a6 6 0 0 1-7.922-8.98 6 6 0 0 1 8.98 7.922l3.04 3.04a.749.749 0 0 1-.326 1.275.749.749 0 0 1-.734-.215ZM11.5 7a4.499 4.499 0 1 0-8.997 0A4.499 4.499 0 0 0 11.5 7Z"></path>
          </svg>
        </span>
        <input
          type="text"
          id="sidebar-search-input"
          placeholder="Tìm từ khóa, widget, code trong mọi trang... (/)"
          autocomplete="off"
          spellcheck="false"
          oninput="handleSidebarSearch(this.value)"
        />
        <button
          type="button"
          class="search-clear-btn"
          id="search-clear-btn"
          onclick="clearSidebarSearch()"
          title="Xóa tìm kiếm (Esc)"
          aria-label="Xóa tìm kiếm"
          style="display:none;"
        >&times;</button>
      </div>
      <div class="search-status" id="search-status" style="display:none;"></div>
    </div>
    <nav class="nav-menu">
    `;

    const savedState = getSavedState();

    menuConfig.forEach(section => {
      if (!section.group) {
        html += `<div class="nav-group">`;
        section.items.forEach(item => {
          const itemHref = prefix + item.href;
          const targetFilename = item.href.substring(item.href.lastIndexOf('/') + 1);
          const isActive = (filename === targetFilename) || (item.id === 'home' && (filename === '' || filename === 'index.html'));
          const activeClass = isActive ? ' active' : '';
          const escapedTitle = item.title.replace(/"/g, '&quot;');
          html += `<a class="nav-item${activeClass}" href="${itemHref}" data-href="${item.href}" data-title="${escapedTitle}"><span>${item.title}</span></a>`;
        });
        html += `</div>`;
        return;
      }

      // Kiểm tra xem nhóm này có chứa trang hiện tại không
      const hasActiveChild = section.items.some(item => {
        const targetFilename = item.href.substring(item.href.lastIndexOf('/') + 1);
        return filename === targetFilename;
      });

      // Nếu chứa trang hiện tại -> luôn mở
      // Nếu không chứa -> theo localStorage
      const isSavedCollapsed = Boolean(savedState[section.group]);
      const isCollapsed = hasActiveChild ? false : isSavedCollapsed;
      const collapsedClass = isCollapsed ? ' collapsed' : '';

      html += `<div class="nav-group${collapsedClass}">`;
      html += `<div class="nav-group-header" data-group="${section.group}" onclick="toggleNavGroup(this)">${section.group}</div>`;
      html += `<div class="nav-group-content">`;

      section.items.forEach(item => {
        const escapedTitle = item.title.replace(/"/g, '&quot;');
        if (item.disabled) {
          html += `<span class="nav-item disabled" data-href="${item.href || ''}" data-title="${escapedTitle}"><span>${item.title}</span><span class="nav-badge">${item.badge || 'chưa soạn'}</span></span>`;
        } else {
          const itemHref = prefix + item.href;
          const targetFilename = item.href.substring(item.href.lastIndexOf('/') + 1);
          const isActive = (filename === targetFilename) || (item.id === 'home' && (filename === '' || filename === 'index.html'));
          const activeClass = isActive ? ' active' : '';

          html += `<a class="nav-item${activeClass}" href="${itemHref}" data-href="${item.href}" data-title="${escapedTitle}"><span>${item.title}</span></a>`;
        }
      });

      html += `</div>`;
      html += `</div>`;
    });

    html += `<div class="sidebar-empty-search" id="sidebar-empty-search" style="display:none;"></div>`;
    html += `</nav>`;

    let sidebarEl = document.querySelector('aside.sidebar');
    if (!sidebarEl) {
      sidebarEl = document.createElement('aside');
      sidebarEl.className = 'sidebar';
      document.body.insertAdjacentElement('afterbegin', sidebarEl);
    }
    sidebarEl.innerHTML = html;

    // Đảm bảo search index được nạp
    ensureSearchIndexLoaded();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', renderSidebar);
  } else {
    renderSidebar();
  }
})();
