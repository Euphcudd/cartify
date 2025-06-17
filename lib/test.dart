import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';

class TestConstantsScreen extends StatelessWidget {
  const TestConstantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cartify Constants Test')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('🎨 Core Colors'),
            Wrap(
              spacing: AppSizes.spacingM,
              runSpacing: AppSizes.spacingM,
              children: [
                _colorBox('Primary', AppColors.primary),
                _colorBox('Secondary', AppColors.secondary),
                _colorBox('Accent', AppColors.accent),
                _colorBox('Background', AppColors.background),
                _colorBox('Surface', AppColors.surface),
                _colorBox('Surface Variant', AppColors.surfaceVariant),
              ],
            ),

            const SizedBox(height: AppSizes.spacingL),
            _sectionTitle('🖋️ Text & Border Colors'),
            Wrap(
              spacing: AppSizes.spacingM,
              runSpacing: AppSizes.spacingM,
              children: [
                _colorBox('Text Primary', AppColors.textPrimary),
                _colorBox('Text Secondary', AppColors.textSecondary),
                _colorBox('Border', AppColors.border),
                _colorBox('Divider', AppColors.divider),
                _colorBox('Shadow', AppColors.shadow),
              ],
            ),

            const SizedBox(height: AppSizes.spacingL),
            _sectionTitle('✅ Status Colors'),
            Wrap(
              spacing: AppSizes.spacingM,
              runSpacing: AppSizes.spacingM,
              children: [
                _colorBox('Error', AppColors.error),
                _colorBox('Success', AppColors.success),
                _colorBox('Warning', AppColors.warning),
                _colorBox('Info', AppColors.info),
              ],
            ),

            const SizedBox(height: AppSizes.spacingL),
            _sectionTitle('🧪 Inputs'),
            Wrap(
              spacing: AppSizes.spacingM,
              runSpacing: AppSizes.spacingM,
              children: [
                _colorBox('Input Fill', AppColors.inputFill),
                _colorBox('Input Border', AppColors.inputBorder),
              ],
            ),

            const SizedBox(height: AppSizes.spacingL),
            _sectionTitle('🌈 Gradient Preview'),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppSizes.radiusL),
              ),
              alignment: Alignment.center,
              child: Text(
                'Cartify Gradient',
                style: AppFonts.headline2.copyWith(color: Colors.white),
              ),
            ),

            const SizedBox(height: AppSizes.spacingXL),
            _sectionTitle('🔤 Text Styles'),
            const SizedBox(height: AppSizes.spacingS),
            Text(
              'Headline1 - ${AppFonts.headline1.fontSize}',
              style: AppFonts.headline1,
            ),
            Text(
              'Headline2 - ${AppFonts.headline2.fontSize}',
              style: AppFonts.headline2,
            ),
            Text(
              'BodyText - ${AppFonts.bodyText.fontSize}',
              style: AppFonts.bodyText,
            ),
            Text(
              'SubText - ${AppFonts.subText.fontSize}',
              style: AppFonts.subText,
            ),
            Text(
              'Input Text - ${AppFonts.input.fontSize}',
              style: AppFonts.input,
            ),
            Text('Caption - ${AppSizes.fontS}', style: AppFonts.caption),
            const SizedBox(height: AppSizes.spacingM),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button Text', style: AppFonts.button),
            ),

            const SizedBox(height: AppSizes.spacingXL),
            _sectionTitle('📏 Size Preview'),
            Wrap(
              spacing: AppSizes.spacingM,
              children: [
                _sizeBox('Padding S', AppSizes.paddingS),
                _sizeBox('Padding M', AppSizes.paddingM),
                _sizeBox('Padding L', AppSizes.paddingL),
                _sizeBox('Spacing XL', AppSizes.spacingXL),
                _sizeBox('Radius M', AppSizes.radiusM),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorBox(String label, Color color) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        const SizedBox(height: AppSizes.spacingS),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spacingS),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppSizes.fontXL,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _sizeBox(String label, double size) {
    return Column(
      children: [
        Container(
          width: size * 2,
          height: 20,
          color: AppColors.primary.withOpacity(0.3),
        ),
        const SizedBox(height: 4),
        Text('$label ($size)', style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
