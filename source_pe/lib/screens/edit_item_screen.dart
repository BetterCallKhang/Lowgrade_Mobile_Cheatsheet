import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item_example.dart';
import '../providers/item_provider.dart';
import '../utils/app_validator.dart';

class EditItemScreen extends ConsumerStatefulWidget {
  final ItemModel item;

  const EditItemScreen({super.key, required this.item});

  @override
  ConsumerState<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends ConsumerState<EditItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _priceController = TextEditingController();

  String _selectedCategory = 'Loại A';
  final List<String> _categories = ['Loại A', 'Loại B', 'Loại C'];

  @override
  void initState() {
    super.initState();
    // Nạp sẵn dữ liệu cũ vào các ô nhập
    _titleController.text = widget.item.title;
    _subtitleController.text = widget.item.subtitle;
    _priceController.text = widget.item.price?.toString() ?? '';
    if (_categories.contains(widget.item.category)) {
      _selectedCategory = widget.item.category!;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final title = _titleController.text.trim();
    final subtitle = _subtitleController.text.trim();
    final price = double.tryParse(_priceController.text.trim()) ?? 0.0;

    // CẬP NHẬT (EDIT): Giữ nguyên ID cũ
    final updatedItem = ItemModel(
      id: widget.item.id,
      title: title,
      subtitle: subtitle,
      category: _selectedCategory,
      price: price,
    );

    await ref.read(itemProvider.notifier).updateItem(updatedItem);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cập nhật thành công!')),
    );

    // Quay trở về màn hình trước (HomeScreen/DetailScreen tự động cập nhật)
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Field 1: Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => AppValidator.required(val, 'Tiêu đề'),
              ),
              const SizedBox(height: 16),

              // Field 2: Description / Subtitle
              TextFormField(
                controller: _subtitleController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => AppValidator.required(val, 'Mô tả'),
              ),
              const SizedBox(height: 16),

              // Field 3: Category Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories.map((cat) {
                  return DropdownMenuItem(value: cat, child: Text(cat));
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedCategory = val);
                },
              ),
              const SizedBox(height: 16),

              // Field 4: Price (Số thực dương)
              TextFormField(
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => AppValidator.positiveDouble(val, 'Giá tiền'),
              ),
              const SizedBox(height: 24),

              // Nút Lưu thay đổi
              ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'LƯU THAY ĐỔI',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

