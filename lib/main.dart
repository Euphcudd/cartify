import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_theme.dart';
import 'package:cartify/providers/category_Data_provider.dart';
import 'package:cartify/providers/navigation_provider.dart';
import 'package:cartify/providers/planta_provider.dart';
import 'package:cartify/routes/app_routes.dart';
import 'package:cartify/utils/scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => CategoryDataProvider()),
        ChangeNotifierProvider(create: (_) => PlantProvider()),
      ],
      child: ScrollConfiguration(
        behavior: const CustomScrollBehavior(),
        child: MaterialApp(
          title: 'Cartify',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme.copyWith(
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) =>
                    AppColors.primary.withAlpha(180), // semi-transparent
              ),
              radius: const Radius.circular(8),
              minThumbLength: 1,
              thickness: WidgetStateProperty.all(4),
            ),
          ),
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
