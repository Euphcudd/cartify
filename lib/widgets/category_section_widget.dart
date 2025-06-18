import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';
import '../models/category_model.dart';
import '../models/plant_model.dart';
import '../providers/planta_provider.dart';
import '../screens/customer/plants_details_screen.dart';
import '../screens/customer/plants_variety_gridscreen.dart';

class CategorySectionVertical extends StatelessWidget {
  final Category category;

  const CategorySectionVertical({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Plant> plants = context
        .watch<PlantProvider>()
        .getPlantsByCategory(category.id);

    if (plants.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🌸 Category Title
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.paddingM,
            AppSizes.paddingL,
            AppSizes.paddingM,
            AppSizes.paddingS,
          ),
          child: Text(category.name, style: AppFonts.headline2),
        ),

        // 🌿 Plant List
        ...plants.map((plant) => _buildPlantCard(context, plant)).toList(),
      ],
    );
  }

  Widget _buildPlantCard(BuildContext context, Plant plant) {
    final bool outOfStock = !plant.hasVarieties && !plant.isAvailable;

    return GestureDetector(
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
            margin: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingM,
              vertical: AppSizes.paddingS,
            ),
            padding: const EdgeInsets.all(AppSizes.paddingM),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 4,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                // 🌿 Plant Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radiusS),
                  child: Image.network(
                    plant.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: AppSizes.spacingM),

                // 📄 Plant Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.name,
                        style: AppFonts.bodyText.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingXS),
                      Text(
                        '₹${plant.price}',
                        style: AppFonts.subText.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingS),

                      // 🛒 Add to Cart Button (if in stock & no varieties)
                      if (!plant.hasVarieties && plant.isAvailable)
                        SizedBox(
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Add to cart
                            },
                            child: const Text("Add to Cart"),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🚫 Out of Stock Banner
          if (outOfStock)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
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
