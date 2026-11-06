import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/theme_service.dart';

// 1. DÒNG BẮT BUỘC: Liên kết file sinh mã tự động
part 'theme_provider.g.dart';

// 2. Annotation @riverpod: Tự động sinh ra themeProvider
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    // Khởi tạo và đọc theme đã lưu từ SharedPreferences
    _loadTheme();
    return ThemeMode.light;
  }

  // Đọc theme đã lưu
  Future<void> _loadTheme() async {
    final isDark = await ThemeService.isDarkMode();
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  // Đổi qua lại giữa theme sáng và tối, đồng thời lưu vào SharedPreferences
  Future<void> toggleTheme(bool isDark) async {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    await ThemeService.saveThemeMode(isDark);
  }
}
