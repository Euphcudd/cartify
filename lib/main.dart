import 'package:cartify/constants/app_theme.dart';
import 'package:cartify/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: TestConstantsScreen(),
    );
  }
}
