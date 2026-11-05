function copyCode(btn) {
  const wrapper = btn.closest('.code-wrapper');
  const codeEl = wrapper ? wrapper.querySelector('pre code') : null;
  if (!codeEl) return;

  navigator.clipboard.writeText(codeEl.innerText).then(() => {
    const oldText = btn.innerText;
    btn.innerText = 'Đã copy';
    btn.style.backgroundColor = '#3fb950';
    btn.style.color = '#000';
    setTimeout(() => {
      btn.innerText = oldText;
      btn.style.backgroundColor = '';
      btn.style.color = '';
    }, 1600);
  });
}

function filterPageContent(query) {
  const q = query.trim().toLowerCase();
  const blocks = document.querySelectorAll('.card, .code-wrapper, .table-wrap, .callout, .step-box, .def');
  if (!q) {
    blocks.forEach((b) => (b.style.display = ''));
    return;
  }
  blocks.forEach((b) => {
    const text = b.innerText.toLowerCase();
    b.style.display = text.includes(q) ? '' : 'none';
  });
}

function toggleNavGroup(header) {
  const group = header.closest('.nav-group');
  if (group) {
    group.classList.toggle('collapsed');
    
    // Lưu trạng thái đóng/mở vào localStorage theo tên nhóm
    try {
      const groupName = header.getAttribute('data-group') || header.innerText.trim();
      const savedState = JSON.parse(localStorage.getItem('sidebar_group_state') || '{}');
      savedState[groupName] = group.classList.contains('collapsed');
      localStorage.setItem('sidebar_group_state', JSON.stringify(savedState));
    } catch (e) {
      console.warn('Cannot save sidebar state:', e);
    }
  }
}

