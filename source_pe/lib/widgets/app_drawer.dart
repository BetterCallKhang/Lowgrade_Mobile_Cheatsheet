import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';
import '../services/session_service.dart';
import '../screens/login_screen.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: Column(
        children: [
          // Header của Drawer
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: colorScheme.primary,
                    child: Icon(
                      Icons.person,
                      size: 36,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FutureBuilder<String>(
                    future: SessionService.getUsername(),
                    builder: (context, snapshot) {
                      final username = snapshot.data ?? 'Người dùng';
                      return Text(
                        'Xin chào, $username!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Nút gạt chuyển đổi Theme Sáng / Tối
          SwitchListTile(
            secondary: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: isDark ? Colors.blue : Colors.deepOrange,
            ),
            title: const Text(
              'Chế độ tối',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              isDark ? 'Giao diện Đen - Xanh biển' : 'Giao diện Kem - Cam',
              style: const TextStyle(fontSize: 12),
            ),
            value: isDark,
            onChanged: (bool value) {
              ref.read(themeProvider.notifier).toggleTheme(value);
            },
          ),

          const Divider(),

          // Menu Trang chủ
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Trang chủ'),
            onTap: () {
              Navigator.pop(context); // Đóng drawer
            },
          ),

          const Spacer(),
          const Divider(),

          // Nút Đăng xuất
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Đăng xuất',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              await SessionService.clearSession();
              if (!context.mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

