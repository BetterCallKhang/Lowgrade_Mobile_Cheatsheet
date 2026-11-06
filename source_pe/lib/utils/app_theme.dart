import 'package:flutter/material.dart';

class AppTheme {
  // Màu kem cho nền theme sáng (Cream color)
  static const Color creamBackground = Color(0xFFFFF8E7);
  // Màu cam cho tiêu đề theme sáng
  static const Color orangePrimary = Colors.deepOrange;

  // Màu đen cho nền theme tối
  static const Color blackBackground = Colors.black;
  // Màu xanh biển cho tiêu đề theme tối
  static const Color bluePrimary = Colors.blue;

  // 1. THEME SÁNG: Tiêu đề màu CAM, nền màu KEM
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: creamBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: orangePrimary,
      brightness: Brightness.light,
      surface: creamBackground,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: creamBackground,
      foregroundColor: orangePrimary,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: orangePrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: orangePrimary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: orangePrimary,
      foregroundColor: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: creamBackground,
    ),
  );

  // 2. THEME TỐI: Tiêu đề màu XANH BIỂN, nền màu ĐEN
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: bluePrimary,
      brightness: Brightness.dark,
      surface: const Color(0xFF1E1E1E),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: blackBackground,
      foregroundColor: bluePrimary,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: bluePrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: bluePrimary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: bluePrimary,
      foregroundColor: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF121212),
    ),
  );
}

