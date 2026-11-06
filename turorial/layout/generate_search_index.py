#!/usr/bin/env python3
"""
Tự động tạo search-index.js cho Flutter Cheatsheet.
Chạy lại script này mỗi khi thêm hoặc sửa nội dung các trang HTML:
    python3 layout/generate_search_index.py
"""

import glob
import html
import json
import os
import re

def build_index():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    pattern = os.path.join(base_dir, '**', '*.html')
    files = sorted(glob.glob(pattern, recursive=True))

    index = {}
    for filepath in files:
        rel = os.path.relpath(filepath, base_dir).replace('\\', '/')

        with open(filepath, 'r', encoding='utf-8') as fp:
            raw = fp.read()

        # Tiêu đề trang
        t_m = re.search(r'<title>(.*?)</title>', raw, re.I | re.S)
        title = t_m.group(1).replace(' - Flutter Cheatsheet', '').strip() if t_m else rel

        # Các tiêu đề mục (h1 -> h4)
        headings = re.findall(r'<h[1-4][^>]*>(.*?)</h[1-4]>', raw, re.I | re.S)
        headings = [re.sub(r'<[^>]+>', ' ', html.unescape(h)).strip() for h in headings]
        headings = [h for h in headings if h]

        # Trích xuất nội dung chính bên trong <main>
        main_m = re.search(r'<main[^>]*>(.*?)</main>', raw, re.I | re.S)
        main_html = main_m.group(1) if main_m else raw

        # Loại bỏ script, style
        clean = re.sub(r'<(script|style)[^>]*>.*?</\1>', ' ', main_html, flags=re.S | re.I)

        # Loại bỏ thẻ HTML và unescape các ký tự đặc biệt
        text = re.sub(r'<[^>]+>', ' ', clean)
        text = html.unescape(text)
        text = re.sub(r'\s+', ' ', text).strip()

        index[rel] = {
            'title': title,
            'headings': headings,
            'content': text
        }

    output_file = os.path.join(base_dir, 'layout', 'search-index.js')
    content = '// Flutter Cheatsheet Search Index\nwindow.CHEATSHEET_SEARCH_INDEX = ' + json.dumps(index, ensure_ascii=False) + ';\n'

    with open(output_file, 'w', encoding='utf-8') as fp:
        fp.write(content)

    print(f"✓ Đã cập nhật {output_file}")
    print(f"  Tổng số trang đã index: {len(index)}")
    print(f"  Dung lượng file: {os.path.getsize(output_file) / 1024:.1f} KB")

if __name__ == '__main__':
    build_index()

