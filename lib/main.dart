import 'package:cartify/constants/app_theme.dart';
import 'package:cartify/providers/navigation_provider.dart';
import 'package:cartify/routes/app_routes.dart';
import 'package:cartify/screens/splash_screen.dart';
// ignore: unused_import
import 'package:cartify/test.dart';
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
      providers: [ChangeNotifierProvider(create: (_) => NavigationProvider())],
      child: MaterialApp(
        title: 'Cartify',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
