import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseHelper {
  static const String _dbName = 'exam_app.db';
  static const int _dbVersion = 1;

  static const String tableUsers = 'users';
  static const String tableItems = 'items';

  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (kIsWeb) {
      final dbFactory = databaseFactoryFfiWeb;
      return await dbFactory.openDatabase(
        _dbName,
        options: OpenDatabaseOptions(
          version: _dbVersion,
          onCreate: _onCreate,
        ),
      );
    } else {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, _dbName);
      return await openDatabase(
        path,
        version: _dbVersion,
        onCreate: _onCreate,
      );
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    // 1. Tạo bảng Users
    await db.execute('''
      CREATE TABLE $tableUsers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE NOT NULL,
        email TEXT,
        password TEXT NOT NULL
      )
    ''');

    // 2. Tạo bảng Items chính của đề bài (Tranh, Sách, Sinh viên...)
    await db.execute('''
      CREATE TABLE $tableItems (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtitle TEXT,
        category TEXT,
        price REAL,
        userId INTEGER
      )
    ''');

    // 3. Tạo sẵn 1 tài khoản mặc định để vào thi đăng nhập được ngay
    await db.insert(tableUsers, {
      'username': 'admin',
      'password': '123456',
      'email': 'admin@gmail.com',
    });

    // 4. TỰ ĐỘNG NẠP DỮ LIỆU TỪ FILE JSON TRONG ASSETS (Không cần gõ tay)
    await _seedDataFromJson(db, 'assets/data.json');
  }

  // =========================================================================
  // HÀM NẠP DỮ LIỆU TỰ ĐỘNG TỪ FILE JSON (Cực tiện cho đề cấp sẵn file JSON)
  // =========================================================================
  Future<void> _seedDataFromJson(Database db, String assetPath) async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final dynamic decoded = jsonDecode(jsonString);

      // Nếu file JSON là danh sách [...]
      final List<dynamic> list = (decoded is List) ? decoded : (decoded['items'] ?? []);

      for (var item in list) {
        if (item is Map<String, dynamic>) {
          await db.insert(tableItems, item);
        }
      }
    } catch (e) {
      // Nếu đề thi không có file json thì bỏ qua, không gây crash app
      debugPrint('Chưa có file $assetPath hoặc lỗi đọc JSON: $e');
    }
  }

  // =========================================================================
  // BỘ HÀM BẮT BUỘC (LOGIN + GET LIST + INSERT + DELETE)
  // =========================================================================
  // 1. Đăng nhập: Trả về thông tin User nếu đúng, null nếu sai
  Future<Map<String, dynamic>?> loginUser(String username, String password) async {
    final db = await database;
    final res = await db.query(
      tableUsers,
      where: 'username = ? AND password = ?',
      whereArgs: [username.trim(), password.trim()],
    );
    if (res.isNotEmpty) return res.first;
    return null;
  }

  // 2. Lấy toàn bộ danh sách Items hiển thị lên Home
  Future<List<Map<String, dynamic>>> getAllItems() async {
    final db = await database;
    return await db.query(tableItems, orderBy: 'id DESC');
  }

  // 3. Thêm một Item mới (Task Add Screen)
  Future<int> insertItem(Map<String, dynamic> itemMap) async {
    final db = await database;
    return await db.insert(tableItems, itemMap);
  }

  // 4. Xóa một Item theo ID (Task Delete Item)
  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete(
      tableItems,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DÙNG KHI: Đề có Task User Registration (Đăng ký tài khoản)
  Future<bool> isUsernameExists(String username) async {
    final db = await database;
    final res = await db.query(
      tableUsers,
      where: 'username = ?',
      whereArgs: [username.trim()],
    );
    return res.isNotEmpty;
  }

  Future<int> registerUser(Map<String, dynamic> userMap) async {
    final db = await database;
    return await db.insert(tableUsers, userMap);
  }

  // DÙNG KHI: Đề có Task Edit / Update Item
  Future<int> updateItem(int id, Map<String, dynamic> itemMap) async {
    final db = await database;
    return await db.update(
      tableItems,
      itemMap,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DÙNG KHI: Đề có ô Search nhập từ khóa tìm kiếm theo tiêu đề
  Future<List<Map<String, dynamic>>> searchItems(String keyword) async {
    final db = await database;
    return await db.query(
      tableItems,
      where: 'title LIKE ?',
      whereArgs: ['%$keyword%'],
      orderBy: 'id DESC',
    );
  }

  // DÙNG KHI: Đề có Dropdown chọn lọc theo thể loại (Category)
  Future<List<Map<String, dynamic>>> getItemsByCategory(String category) async {
    final db = await database;
    return await db.query(
      tableItems,
      where: 'category = ?',
      whereArgs: [category],
      orderBy: 'id DESC',
    );
  }
}