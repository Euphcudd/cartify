import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_sizes.dart';

class AppFonts {
  static const TextStyle bodyTextBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle headline1 = GoogleFonts.poppins(
    fontSize: AppSizes.fontXXL, // 24
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final TextStyle headline2 = GoogleFonts.poppins(
    fontSize: AppSizes.fontXL, // 20
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyText = GoogleFonts.poppins(
    fontSize: AppSizes.fontL, // 16
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static final TextStyle subText = GoogleFonts.poppins(
    fontSize: AppSizes.fontM, // 14
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static final TextStyle button = GoogleFonts.poppins(
    fontSize: AppSizes.fontL, // 16
    fontWeight: FontWeight.w600,
    color: AppColors.surface,
  );

  static final TextStyle input = GoogleFonts.poppins(
    fontSize: AppSizes.fontL, // 16
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static final TextStyle caption = GoogleFonts.poppins(
    fontSize: AppSizes.fontS, // 12
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
