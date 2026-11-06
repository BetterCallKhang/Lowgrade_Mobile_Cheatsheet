class ItemModel {
  final int? id;
  final String title;
  final String subtitle;
  final String? category;
  final double? price;

  ItemModel({
    this.id,
    required this.title,
    required this.subtitle,
    this.category,
    this.price,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? map['description'] ?? '',
      category: map['category'],
      price: map['price'] != null ? (map['price'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'category': category,
      'price': price,
    };
    if (id != null) map['id'] = id;
    return map;
  }
}