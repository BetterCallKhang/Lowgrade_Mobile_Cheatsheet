import 'package:flutter/material.dart';
import '../models/item_example.dart';
import 'item_list_card_widget.dart';

class ItemListWidget extends StatelessWidget {
  final List<ItemModel> items;
  final void Function(ItemModel item) onDelete;
  final void Function(ItemModel item)? onEdit;
  final void Function(ItemModel item)? onTap;

  const ItemListWidget({
    super.key,
    required this.items,
    required this.onDelete,
    this.onEdit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemCardWidget(
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

