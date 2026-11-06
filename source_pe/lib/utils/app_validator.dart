class AppValidator {
  // =========================================================================
  // 1. KIỂM TRA BẮT BUỘC NHẬP (Dùng chung cho bất kỳ ô TextField nào)
  // =========================================================================
  static String? required(String? value, [String fieldName = 'Trường này']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    return null;
  }

  // =========================================================================
  // 2. DÀNH CHO MÀN LOGIN
  // Cách dùng trong TextFormField: validator: AppValidator.loginUsername
  // =========================================================================
  static String? loginUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  static String? loginPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    return null;
  }

  // =========================================================================
  // 3. DÀNH CHO MÀN REGISTER (ĐĂNG KÝ)
  // Cách dùng: validator: AppValidator.registerUsername / registerPassword
  // =========================================================================
  static String? registerUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Tên đăng nhập không được để trống';
    }
    if (value.trim().length < 3) {
      return 'Tên đăng nhập phải có ít nhất 3 ký tự';
    }
    return null;
  }

  static String? registerPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (value.trim().length < 6) {
      return 'Mật khẩu phải từ 6 ký tự trở lên';
    }
    return null;
  }

  // 4. So khớp Confirm Password (truyền giá trị confirm và giá trị password gốc)
  // Cách dùng trong TextFormField:
  // validator: (value) => AppValidator.confirmPassword(value, _passwordController.text)
  static String? confirmPassword(String? confirmValue, String originalPassword) {
    if (confirmValue == null || confirmValue.trim().isEmpty) {
      return 'Vui lòng xác nhận mật khẩu';
    }
    if (confirmValue != originalPassword) {
      return 'Mật khẩu xác nhận không trùng khớp';
    }
    return null;
  }

  // DÙNG KHI: Đề yêu cầu nhập Email đúng định dạng
  // Cách dùng: validator: AppValidator.email
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email không được để trống';
    }
    if (!_emailRegExp.hasMatch(value.trim())) {
      return 'Email không hợp lệ (ví dụ: user@gmail.com)';
    }
    return null;
  }

  // DÙNG KHI: Đề có ô Số điện thoại (10 chữ số bắt đầu bằng 0)
  // Cách dùng: validator: AppValidator.phone
  static final RegExp _phoneRegExp = RegExp(r'^0[0-9]{9}$');

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Số điện thoại không được để trống';
    }
    if (!_phoneRegExp.hasMatch(value.trim())) {
      return 'Số điện thoại phải gồm 10 chữ số và bắt đầu bằng số 0';
    }
    return null;
  }

  // DÙNG KHI: Đề yêu cầu nhập Năm xuất bản, Số lượng kho, Tuổi...
  // Cách dùng: validator: (val) => AppValidator.positiveInteger(val, 'Năm xuất bản')
  static String? positiveInteger(String? value, [String fieldName = 'Giá trị']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    final number = int.tryParse(value.trim());
    if (number == null) {
      return '$fieldName phải là số nguyên';
    }
    if (number <= 0) {
      return '$fieldName phải lớn hơn 0';
    }
    return null;
  }

  // DÙNG KHI: Đề yêu cầu nhập Giá tiền (Price), Điểm GPA...
  // Cách dùng: validator: (val) => AppValidator.positiveDouble(val, 'Giá tiền')
  static String? positiveDouble(String? value, [String fieldName = 'Giá tiền']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    final number = double.tryParse(value.trim());
    if (number == null) {
      return '$fieldName phải là số hợp lệ';
    }
    if (number <= 0) {
      return '$fieldName phải lớn hơn 0';
    }
    return null;
  }
}