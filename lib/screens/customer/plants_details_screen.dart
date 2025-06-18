import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_fonts.dart';
import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/models/plant_model.dart';
import 'package:flutter/material.dart';

class PlantDetailsScreen extends StatelessWidget {
  final Plant plant;
  final PlantVariety? variety;

  const PlantDetailsScreen({super.key, required this.plant, this.variety});

  @override
  Widget build(BuildContext context) {
    final displayName = variety?.name ?? plant.name;
    final displayPrice = variety?.price ?? plant.price;
    final displayImage = variety?.imageUrl ?? plant.imageUrl;
    final isAvailable = variety?.isAvailable ?? plant.isAvailable;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(displayName, style: AppFonts.headline2),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 📷 Image
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                child: Image.network(displayImage, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: AppSizes.spacingL),

            // 🪴 Name
            Text(
              displayName,
              style: AppFonts.headline2.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.spacingS),

            // 💰 Price
            Text(
              '₹$displayPrice',
              style: AppFonts.headline2.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.spacingXL),

            // 🛒 Add to Cart / Out of Stock
            isAvailable
                ? SizedBox(
                    width: double.infinity,
                    height: AppSizes.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add to cart
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.paddingL,
                          vertical: AppSizes.paddingS,
                        ),
                      ),
                      child: const Text("Add to Cart"),
                    ),
                  )
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingL,
                      vertical: AppSizes.paddingS,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                    child: Text(
                      "Out of Stock",
                      style: AppFonts.bodyText.copyWith(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
