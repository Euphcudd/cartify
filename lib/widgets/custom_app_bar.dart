import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

import '../constants/app_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: theme.appBarTheme.backgroundColor ?? AppColors.surface,
      foregroundColor: theme.appBarTheme.foregroundColor ?? AppColors.primary,
      elevation: theme.appBarTheme.elevation ?? AppSizes.elevationBase,

      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingS),
            child: Image.asset(
              'assets/icon.png',
              height: AppSizes.iconL, // 🌱 32.0
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppSizes.paddingS),
            child: Image.asset(
              'assets/txt.png',
              height:
                  70, // Logo text height can be fixed or added to AppSizes if reused
            ),
          ),
          const Spacer(),
          // Add actions or icons here later
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
