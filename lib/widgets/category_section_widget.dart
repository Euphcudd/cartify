import 'package:cartify/screens/customer/cart%20screen/widgetn/addtocart_widget.dart';
import 'package:cartify/widgets/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';
import '../models/category_model.dart';
import '../models/plant_model.dart';
import '../providers/planta_provider.dart';
import '../screens/customer/storescreen/plants_details_screen.dart';
import '../screens/customer/storescreen/plants_variety_gridscreen.dart';

class CategorySectionVertical extends StatelessWidget {
  final Category category;

  const CategorySectionVertical({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Plant> plants = List.from(
      context.watch<PlantProvider>().getPlantsByCategory(category.id),
    )..sort((a, b) => a.isOutOfStock ? 1 : -1); // stock first

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
    final bool isOutOfStock = plant.isOutOfStock;
    final bool hasVarieties = plant.hasVarieties;

    return GestureDetector(
      onTap: () {
        if (hasVarieties) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PlantVarietyGridScreen(plant: plant),
            ),
          );
        } else {
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
                // 🌱 Image (main image of plant)
                CachedImage(
                  imageUrl: plant.imageMain,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(AppSizes.radiusS),
                ),
                const SizedBox(width: AppSizes.spacingM),

                // 🪴 Name + Price + Button
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
                        '₹${plant.price.toStringAsFixed(0)}',
                        style: AppFonts.subText.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingS),

                      // Add to Cart (only for plants with no varieties & in stock)
                    ],
                  ),
                ),
                if (!hasVarieties && !isOutOfStock)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Builder(
                      builder: (context) {
                        double screenWidth = MediaQuery.of(context).size.width;

                        // Define width & height based on screen size
                        double buttonWidth;
                        double buttonHeight;

                        if (screenWidth < 600) {
                          // Mobile
                          buttonWidth = 90;
                          buttonHeight = 36;
                        } else if (screenWidth < 1024) {
                          // Tablet
                          buttonWidth = 140;
                          buttonHeight = 42;
                        } else {
                          // Web/Desktop
                          buttonWidth = 120;
                          buttonHeight = 48;
                        }

                        return SizedBox(
                          width: buttonWidth,
                          height: buttonHeight,
                          child: ElevatedButton(
                            onPressed: () {
                              addPlantToCart(context, plant);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusS,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Add"),
                                SizedBox(width: 6),
                                Icon(Icons.add_shopping_cart, size: 18),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          // 🔴 Out of Stock Overlay
          if (!hasVarieties && isOutOfStock)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.65),
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

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../constants/app_colors.dart';
// import '../constants/app_fonts.dart';
// import '../constants/app_sizes.dart';
// import '../models/category_model.dart';
// import '../models/plant_model.dart';
// import '../providers/planta_provider.dart';
// import '../screens/customer/plants_details_screen.dart';
// import '../screens/customer/plants_variety_gridscreen.dart';

// class CategorySectionVertical extends StatelessWidget {
//   final Category category;

//   const CategorySectionVertical({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     final List<Plant> plants = context
//         .watch<PlantProvider>()
//         .getPlantsByCategory(category.id);

//     if (plants.isEmpty) return const SizedBox();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // 🌸 Category Title
//         Padding(
//           padding: const EdgeInsets.fromLTRB(
//             AppSizes.paddingM,
//             AppSizes.paddingL,
//             AppSizes.paddingM,
//             AppSizes.paddingS,
//           ),
//           child: Text(category.name, style: AppFonts.headline2),
//         ),

//         // 🌿 Plant List
//         ...plants.map((plant) => _buildPlantCard(context, plant)).toList(),
//       ],
//     );
//   }

//   Widget _buildPlantCard(BuildContext context, Plant plant) {
//     final bool outOfStock = plant.isOutOfStock;

//     return GestureDetector(
//       onTap: () {
//         if (!outOfStock) {
//           if (plant.hasVarieties) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => PlantVarietyGridScreen(plant: plant),
//               ),
//             );
//           } else {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => PlantDetailsScreen(plant: plant)),
//             );
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Sorry, this plant is out of stock')),
//           );
//         }
//       },
//       child: Stack(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(
//               horizontal: AppSizes.paddingM,
//               vertical: AppSizes.paddingS,
//             ),
//             padding: const EdgeInsets.all(AppSizes.paddingM),
//             decoration: BoxDecoration(
//               color: AppColors.surface,
//               borderRadius: BorderRadius.circular(AppSizes.radiusM),
//               border: Border.all(color: AppColors.border),
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.shadow,
//                   blurRadius: 4,
//                   offset: const Offset(1, 1),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 // 🌿 Plant Image
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(AppSizes.radiusS),
//                   child: Image.network(
//                     plant.imageUrl.isNotEmpty
//                         ? plant.imageUrl
//                         : 'https://via.placeholder.com/80x80.png?text=No+Image',
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: AppSizes.spacingM),

//                 // 📄 Plant Info
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         plant.name,
//                         style: AppFonts.bodyText.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: AppSizes.spacingXS),
//                       Text(
//                         '₹${plant.price}',
//                         style: AppFonts.subText.copyWith(
//                           color: AppColors.textPrimary,
//                         ),
//                       ),
//                       const SizedBox(height: AppSizes.spacingS),

//                       // 🛒 Add to Cart Button (only if no varieties and plant is available)
//                       if (!plant.hasVarieties && !outOfStock)
//                         SizedBox(
//                           height: 36,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // TODO: Add to cart logic
//                             },
//                             child: const Text("Add to Cart"),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // 🚫 Out of Stock Overlay
//           if (outOfStock) ...[
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(AppSizes.radiusM),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Out of Stock",
//                   style: AppFonts.bodyText.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
