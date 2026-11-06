import 'package:flutter/material.dart';
import '../models/item_example.dart';

class ItemCardWidget extends StatelessWidget {
  final ItemModel item;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onTap;

  const ItemCardWidget({
    super.key,
    required this.item,
    required this.index,
    required this.onDelete,
    this.onEdit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        // Bên trái: Vòng tròn số thứ tự
        leading: CircleAvatar(
          child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
        ),

        // Ở giữa: Tiêu đề in đậm
        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),

        // Dòng phụ: Thể loại & Giá tiền
        subtitle: Text(
          '${item.category ?? 'Chung'} • \$${item.price ?? 0.0}',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
        ),

        // Bên phải: Nút Sửa xanh & Nút Xóa đỏ
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onEdit != null)
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                tooltip: 'Chỉnh sửa',
                onPressed: onEdit,
              ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Xóa mục này',
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}