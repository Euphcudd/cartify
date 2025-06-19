import 'package:cartify/widgets/cached_image_widget.dart';
import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final bool showAddToCartButton;

  const PlantCard({
    super.key,
    required this.plant,
    this.onTap,
    this.onAddToCart,
    this.showAddToCartButton = true,
  });

  @override
  Widget build(BuildContext context) {
    // If plant has varieties, take the first one to show its price & thumbnail
    final PlantVariety? firstVariety = plant.varieties.isNotEmpty
        ? plant.varieties[0]
        : null;

    final String imageUrl =
        firstVariety?.thumbnailImage ?? firstVariety?.image1 ?? plant.imageMain;
    final double price = firstVariety?.price ?? plant.price;
    final bool isOutOfStock = plant.isOutOfStock;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 🌱 Image
                CachedImage(
                  imageUrl: imageUrl,
                  height: 140,
                  fit: BoxFit.cover,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),

                // 🪴 Name, 💰 Price, 🛒 Add to Cart
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "₹${price.toStringAsFixed(0)}",
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),

                      if (showAddToCartButton && !isOutOfStock)
                        ElevatedButton(
                          onPressed: onAddToCart,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            minimumSize: const Size.fromHeight(36),
                          ),
                          child: const Text("Add to Cart"),
                        )
                      else if (showAddToCartButton && isOutOfStock)
                        const SizedBox(height: 36), // same space placeholder
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🚫 Out of Stock Overlay
          if (isOutOfStock)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Out of Stock',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
