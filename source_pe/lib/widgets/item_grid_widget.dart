import 'package:flutter/material.dart';
import '../models/item_example.dart';
import 'item_grid_card_widget.dart';

class ItemGridWidget extends StatelessWidget {
  final List<ItemModel> items;
  final void Function(ItemModel item) onDelete;
  final void Function(ItemModel item)? onEdit;
  final void Function(ItemModel item)? onTap;

  /// Cố định số cột (nếu truyền vào thì bỏ qua responsive)
  final int? crossAxisCount;

  /// Số cột khi màn hình DỌC (Portrait) - mặc định là 2
  final int portraitCount;

  /// Số cột khi màn hình NGANG (Landscape) - mặc định là 3
  final int landscapeCount;

  /// Tỉ lệ chiều rộng / chiều cao của mỗi item
  final double? childAspectRatio;

  const ItemGridWidget({
    super.key,
    required this.items,
    required this.onDelete,
    this.onEdit,
    this.onTap,
    this.crossAxisCount,
    this.portraitCount = 2,
    this.landscapeCount = 3,
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    // Kiểm tra hướng màn hình hiện tại
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Responsive: Dọc = 2 cột, Ngang = 3 cột (hoặc lấy crossAxisCount cố định nếu được truyền)
    final int effectiveCrossAxisCount = crossAxisCount ?? (isLandscape ? landscapeCount : portraitCount);

    // Tỉ lệ kích thước item: Ngang cần tỉ lệ cao hơn để card không bị kéo dài quá mức
    final double effectiveAspectRatio = childAspectRatio ?? (isLandscape ? 0.95 : 0.8);

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: effectiveCrossAxisCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: effectiveAspectRatio,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemGridCardWidget(
          item: item,
          index: index,
          onDelete: () => onDelete(item),
          onEdit: onEdit != null ? () => onEdit!(item) : null,
          onTap: onTap != null ? () => onTap!(item) : null,
        );
      },
    );
  }
}
