class Category {
  final String id;
  final String name; // e.g., "Flowering"
  final String icon; // e.g., "🌸" or URL/icon code (optional)

  Category({required this.id, required this.name, required this.icon});

  factory Category.fromMap(Map<String, dynamic> map, String docId) {
    return Category(
      id: docId,
      name: map['name'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'icon': icon};
  }
}
