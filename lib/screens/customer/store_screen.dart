// import 'package:cartify/providers/categorimport 'package:flutter/material.dart';
import 'package:cartify/providers/category_Data_provider.dart';
import 'package:cartify/widgets/category_section_widget.dart';
import 'package:cartify/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryDataProvider>();

    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
        itemCount: categoryProvider.categories.length,
        itemBuilder: (context, index) {
          final category = categoryProvider.categories[index];
          return CategorySection(category: category);
        },
      ),
    );
  }
}
