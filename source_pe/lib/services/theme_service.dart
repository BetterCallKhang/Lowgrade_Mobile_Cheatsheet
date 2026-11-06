import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String keyIsDarkMode = 'is_dark_mode';

  // Lưu trạng thái theme (true: dark, false: light)
  static Future<void> saveThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsDarkMode, isDark);
  }

  // Đọc trạng thái theme từ SharedPreferences
  static Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsDarkMode) ?? false;
  }
}

