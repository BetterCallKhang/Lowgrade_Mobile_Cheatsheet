// lib/models/user_model.dart

class UserModel {
  final int? id;             // Khóa chính (Primary Key), tự tăng nên có thể null khi đăng ký
  final String username;     // Tên đăng nhập (duy nhất)
  final String email;        // Email người dùng
  final String password;     // Mật khẩu
  // final String? createdAt;   // Ngày tạo tài khoản (tùy chọn: DateTime.now().toIso8601String())

  // 1. Constructor với Named Parameters
  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    // this.createdAt,
  });

  // 2. Chuyển Model thành Map để chèn vào SQLite (insert/update)
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
    if (id != null) map['id'] = id;
    // if (createdAt != null) map['createdAt'] = createdAt;
    return map;
  }

  // 3. Khởi tạo Model từ dữ liệu Map lấy từ SQLite hoặc API
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?,
      username: (map['username'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      // createdAt: map['createdAt'] as String?,
    );
  }

  // 4. copyWith để sao chép đối tượng khi cần cập nhật
  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      // createdAt: createdAt ?? this.createdAt,
    );
  }
}