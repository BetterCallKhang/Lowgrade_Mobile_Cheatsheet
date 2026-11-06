import 'package:flutter/material.dart';
import '../models/item_example.dart';

class ItemGridCardWidget extends StatelessWidget {
  final ItemModel item;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onTap;

  const ItemGridCardWidget({
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hàng trên: Số thứ tự & Tag phân loại (Category)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (item.category != null && item.category!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item.category!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Tiêu đề
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 2),

              // Dòng phụ / Mô tả ngắn
              Expanded(
                child: Text(
                  item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ),

              // Giá tiền
              Text(
                '\$${item.price ?? 0.0}',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const Divider(height: 10),

              // Hàng nút: Chỉnh sửa & Xóa
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onEdit != null)
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
                      visualDensity: VisualDensity.compact,
                      tooltip: 'Chỉnh sửa',
                      onPressed: onEdit,
                    ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                    visualDensity: VisualDensity.compact,
                    tooltip: 'Xóa mục này',
                    onPressed: onDelete,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

