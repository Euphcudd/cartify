import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_fonts.dart';
import 'package:cartify/screens/customer/plants_details_screen.dart';
import 'package:cartify/screens/customer/plants_variety_gridscreen.dart';
import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    final bool showOutOfStock = !plant.hasVarieties && !plant.isAvailable;

    return InkWell(
      onTap: () {
        if (plant.hasVarieties) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PlantVarietyGridScreen(plant: plant),
            ),
          );
        } else if (plant.isAvailable) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PlantDetailsScreen(plant: plant)),
          );
        }
      },
      child: Stack(
        children: [
          Container(
            width: 160,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.surface,
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼️ Plant Image
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      plant.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // 🌿 Plant Name
                Text(
                  plant.name,
                  style: AppFonts.bodyText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // 💰 Price
                Text(
                  '₹${plant.price}',
                  style: AppFonts.subText.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 6),

                // 🛒 Add to Cart Button
                if (!plant.hasVarieties && plant.isAvailable)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add to cart logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.surface,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text("Add", style: AppFonts.button),
                    ),
                  ),
              ],
            ),
          ),

          // ❌ Out of Stock overlay
          if (showOutOfStock)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Out of Stock",
                  style: AppFonts.bodyText.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
