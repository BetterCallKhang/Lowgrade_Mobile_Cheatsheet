import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../utils/database_helper.dart';
import '../models/item_example.dart';

// 1. DÒNG BẮT BUỘC: Liên kết file sinh mã tự động
part 'item_provider.g.dart';

// 2. Annotation @riverpod: Tự động sinh ra itemNotifierProvider
@riverpod
class ItemNotifier extends _$ItemNotifier {
  // Hàm build() bất đồng bộ: Riverpod sẽ tự quản lý trạng thái Loading/Error/Data
  @override
  Future<List<ItemModel>> build() async {
    final rawData = await DatabaseHelper.instance.getAllItems();
    return rawData.map((e) => ItemModel.fromMap(e)).toList();
  }

  // Thêm một item mới
  Future<void> addItem(ItemModel item) async {
    await DatabaseHelper.instance.insertItem(item.toMap());
    // Làm mới lại danh sách -> UI tự động cập nhật
    ref.invalidateSelf();
    await future;
  }

  // Cập nhật một item theo ID
  Future<void> updateItem(ItemModel item) async {
    if (item.id == null) return;
    await DatabaseHelper.instance.updateItem(item.id!, item.toMap());
    ref.invalidateSelf();
    await future;
  }

  // Xóa một item theo ID
  Future<void> deleteItem(int id) async {
    await DatabaseHelper.instance.deleteItem(id);
    ref.invalidateSelf();
    await future;
  }
}