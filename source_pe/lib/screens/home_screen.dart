import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/item_example.dart';
import '../providers/item_provider.dart';
import '../services/session_service.dart';
import '../widgets/delete_dialog.dart'; // Import Dialog xóa tách riêng
import '../widgets/item_list_widget.dart'; // Widget hiển thị dạng ListView tách riêng
import '../widgets/item_grid_widget.dart'; // Widget hiển thị dạng GridView tách riêng
import '../widgets/app_drawer.dart'; // Widget Drawer thanh menu bên hông
import 'add_item_screen.dart'; // Màn Thêm mới
import 'edit_item_screen.dart'; // Màn Chỉnh sửa
import 'detail_screen.dart'; // Màn Chi tiết
import 'login_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // Xử lý Xóa phần tử & Hiển thị SnackBar thông báo thành công
  Future<void> _handleDelete(BuildContext context, WidgetRef ref, ItemModel item) async {
    // 1. Mở dialog xác nhận xóa đã tách riêng ở file DeleteDialog
    final bool confirm = await DeleteDialog.show(context, item.title);

    if (confirm && item.id != null) {
      // 2. Gọi Riverpod xóa item
      await ref.read(itemProvider.notifier).deleteItem(item.id!);

      if (!context.mounted) return;
      // 3. HIỆN SNACKBAR THÔNG BÁO XÓA THÀNH CÔNG
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xóa "${item.title}" thành công!'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'ĐÓNG',
            textColor: Colors.amber,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future<void> _logout(BuildContext context) async {
    await SessionService.clearSession();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
    );
  }

  void _navigateToEdit(BuildContext context, ItemModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditItemScreen(item: item)),
    );
  }

  void _navigateToDetail(BuildContext context, ItemModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(item: item)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(itemProvider);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Danh sách'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      // Xử lý 3 trạng thái với .when: loading, error, data (kèm xử lý rỗng)
      body: asyncItems.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
        data: (items) {
          // TRẠNG THÁI KHÔNG CÓ DỮ LIỆU (EMPTY STATE)
          if (items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'Chưa có dữ liệu nào',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '(No items found)',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // ===================================================================
          // CHEAT SHEET PHÒNG THI - TÙY BIẾN HIỂN THỊ LISTVIEW / GRIDVIEW:
          // ===================================================================
          // [TRƯỜNG HỢP 1] Đề bắt: "Dọc là List, Ngang là Grid" (Mặc định bên dưới)
          // [TRƯỜNG HỢP 2] Đề bắt: "Dọc là Grid, Ngang là List":
          //    -> Chỉ cần đổi: if (isPortrait) return ItemGridWidget(...)
          //                    else return ItemListWidget(...)
          // [TRƯỜNG HỢP 3] Đề chỉ bắt duy nhất ListView:
          //    -> Xóa OrientationBuilder, return ItemListWidget(...)
          // [TRƯỜNG HỢP 4] Đề chỉ bắt duy nhất GridView:
          //    -> Xóa OrientationBuilder, return ItemGridWidget(...)
          // ===================================================================
          return OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = orientation == Orientation.portrait;

              // 1. Màn hình DỌC (Portrait) -> Mặc định là ListView
              if (isPortrait) {
                return ItemListWidget(
                  items: items,
                  onDelete: (item) => _handleDelete(context, ref, item),
                  onEdit: (item) => _navigateToEdit(context, item),
                  onTap: (item) => _navigateToDetail(context, item),
                );
              }

              // 2. Màn hình NGANG (Landscape) -> Mặc định là GridView (3 cột)
              return ItemGridWidget(
                items: items,
                landscapeCount: 3, // Tùy chỉnh số cột khi xoay ngang
                onDelete: (item) => _handleDelete(context, ref, item),
                onEdit: (item) => _navigateToEdit(context, item),
                onTap: (item) => _navigateToDetail(context, item),
              );
            },
          );
        },
      ),
      // Nút Thêm mới dẫn sang AddItemScreen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddItemScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}