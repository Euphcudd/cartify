class Plant {
  final String id;
  final String name;
  final int price; // Base or lowest price
  final String imageUrl;
  final String categoryId;
  final List<PlantVariety> varieties;

  Plant({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.varieties,
  });

  /// Whether this plant has any varieties
  bool get hasVarieties => varieties.isNotEmpty;

  /// For plants without varieties, this is the stock status
  bool get isAvailable => !hasVarieties || varieties.any((v) => v.isAvailable);

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
  final int price;
  final bool isAvailable;
  final String?
  imageUrl; // Optional per-variety image (else fallback to plant image)

  PlantVariety({
    required this.name,
    required this.price,
    required this.isAvailable,
    this.imageUrl,
  });

  factory PlantVariety.fromMap(Map<String, dynamic> map) {
    return PlantVariety(
      name: map['name'],
      price: map['price'],
      isAvailable: map['isAvailable'],
      imageUrl: map['imageUrl'], // nullable
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'isAvailable': isAvailable,
      'imageUrl': imageUrl,
    };
  }
}
