import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cartify/widgets/category_section_widget.dart';
import 'package:cartify/widgets/custom_app_bar.dart';
import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/providers/category_Data_provider.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryDataProvider>();
    final categories = categoryProvider.categories;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
      body: categories.isEmpty
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: AppSizes.spacingXXL),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategorySectionVertical(category: category);
              },
            ),
    );
  }
}
