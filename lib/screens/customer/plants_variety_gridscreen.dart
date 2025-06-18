import 'package:flutter/material.dart';
import 'package:cartify/models/plant_model.dart';
import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/constants/app_fonts.dart';
import 'package:cartify/screens/customer/plants_details_screen.dart';

class PlantVarietyGridScreen extends StatelessWidget {
  final Plant plant;

  const PlantVarietyGridScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    final varieties = plant.varieties;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(plant.name, style: AppFonts.headline2),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        child: GridView.builder(
          itemCount: varieties.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSizes.spacingL,
            crossAxisSpacing: AppSizes.spacingL,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final variety = varieties[index];
            final isAvailable = variety.isAvailable;
            final imageUrl = variety.imageUrl ?? plant.imageUrl;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        PlantDetailsScreen(plant: plant, variety: variety),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🖼 Image
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(AppSizes.radiusM),
                            ),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),

                        // 📄 Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppSizes.paddingS,
                            AppSizes.paddingS,
                            AppSizes.paddingS,
                            0,
                          ),
                          child: Text(
                            variety.name,
                            style: AppFonts.bodyTextBold,
                          ),
                        ),

                        // 💰 Price
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingS,
                          ),
                          child: Text(
                            "₹${variety.price}",
                            style: AppFonts.bodyText,
                          ),
                        ),

                        const SizedBox(height: AppSizes.spacingS),

                        // 🛒 Add to cart button
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingS,
                          ),
                          child: isAvailable
                              ? SizedBox(
                                  height: 32,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // TODO: Add to cart logic
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSizes.radiusS,
                                        ),
                                      ),
                                    ),
                                    child: const Text("Add"),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),

                        const SizedBox(height: AppSizes.spacingS),
                      ],
                    ),
                  ),

                  // ❌ Out of Stock Overlay
                  if (!isAvailable)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Out of Stock",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: AppSizes.fontL,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
