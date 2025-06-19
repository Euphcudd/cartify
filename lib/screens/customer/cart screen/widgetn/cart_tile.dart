// widgets/cart_item_tile.dart
import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/models/carTtem_model.dart';
import 'package:cartify/providers/cart_provider.dart';
import 'package:cartify/widgets/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          CachedImage(
            imageUrl: item.imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(AppSizes.radiusS),
          ),

          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Delete
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${item.name}${item.varietyName != null ? ' (${item.varietyName})' : ''}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => cart.removeItem(item.id),
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),

                // Quantity & Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity buttons
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: AppSizes.iconS),
                          onPressed: () => cart.decrement(item.id),
                        ),
                        Text('${item.quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add, size: AppSizes.iconS),
                          onPressed: () => cart.increment(item.id),
                        ),
                      ],
                    ),
                    // Price
                    Text('₹${(item.price * item.quantity).toStringAsFixed(0)}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
