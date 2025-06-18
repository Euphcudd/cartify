class Plant {
  final String id;
  final String name;
  final int price; // Optional: base price (or lowest price among varieties)
  final String imageUrl;
  final String categoryId; // links to the category like "Flowering"
  final List<PlantVariety> varieties;

  Plant({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.varieties,
  });

  factory Plant.fromMap(Map<String, dynamic> map, String docId) {
    return Plant(
      id: docId,
      name: map['name'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      categoryId: map['categoryId'],
      varieties:
          (map['varieties'] as List<dynamic>?)
              ?.map((v) => PlantVariety.fromMap(v))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'varieties': varieties.map((v) => v.toMap()).toList(),
    };
  }
}

class PlantVariety {
  final String name; // e.g., "Red Rose"
  final int price; // e.g., ₹99
  final bool isAvailable; // true or false

  PlantVariety({
    required this.name,
    required this.price,
    required this.isAvailable,
  });

  factory PlantVariety.fromMap(Map<String, dynamic> map) {
    return PlantVariety(
      name: map['name'],
      price: map['price'],
      isAvailable: map['isAvailable'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price, 'isAvailable': isAvailable};
  }
}
