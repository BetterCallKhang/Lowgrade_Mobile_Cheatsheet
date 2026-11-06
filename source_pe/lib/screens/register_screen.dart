import 'package:flutter/material.dart';
import '../utils/database_helper.dart';
import '../utils/app_validator.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    // 1. Kiểm tra toàn bộ validators của Form
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      // 2. Kiểm tra tài khoản đã tồn tại trong CSDL chưa
      final isExists = await DatabaseHelper.instance.isUsernameExists(username);
      if (isExists) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tên đăng nhập đã tồn tại trong CSDL!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // 3. Thêm tài khoản mới vào SQLite
      await DatabaseHelper.instance.registerUser({
        'username': username,
        'email': email,
        'password': password,
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng ký tài khoản thành công!'),
          backgroundColor: Colors.green,
        ),
      );

      // 4. Điều hướng sang màn hình LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Field 1: Username
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: AppValidator.registerUsername,
              ),
              const SizedBox(height: 16),

              // Field 2: Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: AppValidator.email,
              ),
              const SizedBox(height: 16),

              // Field 3: Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: AppValidator.registerPassword,
              ),
              const SizedBox(height: 16),

              // Field 4: Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    AppValidator.confirmPassword(value, _passwordController.text),
              ),
              const SizedBox(height: 20),

              // Nút Đăng ký
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('REGISTER', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 12),
              // Nút quay lại màn hình Đăng nhập
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: const Text('Đã có tài khoản? Đăng nhập ngay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}