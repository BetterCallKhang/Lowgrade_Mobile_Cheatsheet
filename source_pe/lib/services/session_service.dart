import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const String keyIsLoggedIn = 'isLoggedIn';
  static const String keyUsername = 'username';

  // Lưu cờ đăng nhập thành công
  static Future<void> saveSession(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsLoggedIn, true);
    await prefs.setString(keyUsername, username);
  }

  // Kiểm tra trạng thái đã đăng nhập chưa
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLoggedIn) ?? false;
  }

  // Lấy tên người dùng hiện tại
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUsername) ?? 'User';
  }

  // Xóa cờ khi Logout
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}