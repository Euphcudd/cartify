import 'package:flutter/material.dart';

class AppColors {
  // App Basic Brand Colors
  static const Color primary = Color(0xFF0A0A0A); // Jet Black
  static const Color secondary = Color(0xFF1C1C1E); // Graphite Grey
  static const Color accent = Color(0xFF007AFF); // iOS Blue

  // Backgrounds
  static const Color background = Color(0xFFF2F2F7); // Ultra Light Gray
  static const Color surface = Color(0xFFFFFFFF); // White (cards, sheets)
  static const Color surfaceVariant = Color(0xFFE5E5EA); // Slight grey

  // Text
  static const Color textPrimary = Color(0xFF0A0A0A); // Dark
  static const Color textSecondary = Color(0xFF8E8E93); // iOS light grey text

  // Borders and Divider
  static const Color border = Color(0xFFD1D1D6); // iOS border grey
  static const Color divider = Color(0xFFE5E5EA);

  // Input Fields
  static const Color inputFill = Color(0xFFF9F9FB);
  static const Color inputBorder = Color(0xFFCCCCCC);

  // Validation & Alerts
  static const Color error = Color(0xFFFF3B30); // iOS Red
  static const Color success = Color(0xFF34C759); // iOS Green
  static const Color warning = Color(0xFFFF9500); // iOS Orange
  static const Color info = Color(0xFF5AC8FA); // iOS Light Blue

  static const Color borderLight = Color(0xFFE0E0E0); // ✅ Add this

  // Shadow
  static const Color shadow = Color(0x1A000000); // 10% black
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      primary, // Jet Black
      secondary, // Graphite Grey
      accent, // iOS Blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
