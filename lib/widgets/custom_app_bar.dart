import 'package:cartify/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: false,

      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      elevation: theme.appBarTheme.elevation ?? 0,
      title: Row(
        children: [
          Image.asset('assets/icon.png', height: 32),
          Padding(
            padding: const EdgeInsets.all(AppSizes.paddingS),
            child: SizedBox(child: Image.asset('assets/txt.png', height: 70)),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
