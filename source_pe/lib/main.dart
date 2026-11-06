import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/register_screen.dart';
import 'services/session_service.dart';
import 'screens/home_screen.dart';
import 'providers/theme_provider.dart';
import 'utils/app_theme.dart';

void main() async {
  // 1. BẮT BUỘC: Khởi tạo engine Flutter trước khi gọi bất kỳ hàm async nào (SQLite / SharedPreferences)
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Kiểm tra cờ trạng thái đăng nhập từ Session
  final bool isLoggedIn = await SessionService.isLoggedIn();

  // 3. Khởi chạy ứng dụng bọc trong ProviderScope của Riverpod
  runApp(
    ProviderScope(
      child: MyApp(startAtHome: isLoggedIn),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final bool startAtHome;
  const MyApp({super.key, required this.startAtHome});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Exam Practical App',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // Phân luồng điều hướng: Đã đăng nhập -> Home, chưa đăng nhập -> Login
      home: startAtHome ? const HomeScreen() : const RegisterScreen(),
    );
  }
}