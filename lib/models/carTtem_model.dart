class CartItem {
  final String id; // unique id per cart item (plantId + varietyName if any)
  final String plantId;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  final String? varietyName;

  CartItem({
    required this.id,
    required this.plantId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    this.varietyName,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      plantId: plantId,
      name: name,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity ?? this.quantity,
      varietyName: varietyName,
    );
  }
}
