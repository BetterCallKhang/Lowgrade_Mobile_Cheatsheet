import 'package:flutter/material.dart';
import '../models/item_example.dart';
import 'edit_item_screen.dart'; // Mở màn Sửa nếu cần

class DetailScreen extends StatelessWidget {
  final ItemModel item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết'),
        centerTitle: true,
        actions: [
          // Nút bấm chuyển sang màn hình Chỉnh sửa
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Chỉnh sửa mục này',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditItemScreen(item: item),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thẻ Card lớn chứa toàn bộ thông tin chi tiết
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Avatar hoặc Biểu tượng lớn
                    CircleAvatar(
                      radius: 36,
                      child: Text(
                        item.title.isNotEmpty ? item.title[0].toUpperCase() : '?',
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tiêu đề
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    // Giá tiền
                    Text(
                      '\$${item.price ?? 0.0}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const Divider(height: 32),

                    // Thông tin dạng bảng dòng
                    _buildInfoRow('Mã định danh (ID):', '#${item.id ?? 0}'),
                    const SizedBox(height: 12),
                    _buildInfoRow('Thể loại (Category):', item.category ?? 'Mặc định'),
                    const SizedBox(height: 16),

                    // Mô tả chi tiết
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mô tả chi tiết:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.subtitle.isNotEmpty ? item.subtitle : 'Không có mô tả chi tiết.',
                        style: TextStyle(color: Colors.grey.shade800, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Nút Quay lại
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('QUAY LẠI DANH SÁCH', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  // Widget phụ tạo dòng thông tin hai bên
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}