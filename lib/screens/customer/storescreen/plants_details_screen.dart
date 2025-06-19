import 'package:cartify/screens/customer/cart%20screen/widgetn/addtocart_widget.dart';
import 'package:cartify/widgets/cached_image_widget.dart';
import 'package:cartify/widgets/swipeArrow_widget.dart';
import 'package:flutter/material.dart';
import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_fonts.dart';
import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/models/plant_model.dart';

class PlantDetailsScreen extends StatefulWidget {
  final Plant plant;
  final PlantVariety? variety;

  const PlantDetailsScreen({super.key, required this.plant, this.variety});

  @override
  State<PlantDetailsScreen> createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  List<String> get imageList {
    final variety = widget.variety;
    if (variety != null) {
      return [variety.image1, ...?variety.additionalImages?.map((e) => e.url)];
    } else {
      return widget.plant.fallbackImageGallery;
    }
  }

  String? getLabelAt(int index) {
    final variety = widget.variety;
    if (variety != null) {
      return variety.labelAt(index);
    } else {
      return widget.plant.fallbackLabelAt(index);
    }
  }

  void _openFullImage(int initialIndex) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black,
      builder: (_) {
        int currentIndex = initialIndex;
        final controller = PageController(initialPage: initialIndex);
        final scrollController = ScrollController();

        void scrollToIndex(int index) {
          final offset = (index * 70.0) - 100.0;
          scrollController.animateTo(
            offset.clamp(0, scrollController.position.maxScrollExtent),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }

        return SafeArea(
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return GestureDetector(
                onTap: () {},
                child: Dialog(
                  backgroundColor: Colors.black,
                  insetPadding: EdgeInsets.zero,
                  elevation: 0,
                  shape: null,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: controller,
                                  itemCount: imageList.length,
                                  onPageChanged: (i) {
                                    setModalState(() => currentIndex = i);
                                    scrollToIndex(i);
                                  },
                                  itemBuilder: (_, index) {
                                    final label = getLabelAt(index);
                                    return Stack(
                                      children: [
                                        InteractiveViewer(
                                          panEnabled: true,
                                          minScale: 1,
                                          maxScale: 4,
                                          child: CachedImage(
                                            imageUrl: imageList[index],
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                            height: double.infinity,
                                            borderRadius: BorderRadius.zero,
                                          ),
                                        ),

                                        if (label != null)
                                          Positioned(
                                            bottom:
                                                20, // 🔽 moved from top to bottom
                                            left: 20,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(
                                                  0.6,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                label,
                                                style: AppFonts.caption
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),

                                // ⬅️ Left Arrow
                                if (currentIndex > 0)
                                  SwipeArrowWidget(
                                    isLeft: true,
                                    onTap: () {
                                      controller.previousPage(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.easeOut,
                                      );
                                    },
                                  ),

                                // ➡️ Right Arrow
                                if (currentIndex < imageList.length - 1)
                                  SwipeArrowWidget(
                                    isLeft: false,
                                    onTap: () {
                                      controller.nextPage(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.easeOut,
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),

                          // 🔳 Thumbnails
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              AppSizes.spacingS,
                              0,
                              20,
                            ), // ⬅️ added 20 bottom padding
                            child: SizedBox(
                              height: 60,
                              child: SingleChildScrollView(
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(imageList.length, (
                                    index,
                                  ) {
                                    final isSelected = index == currentIndex;
                                    return GestureDetector(
                                      onTap: () {
                                        controller.jumpToPage(index);
                                        setModalState(
                                          () => currentIndex = index,
                                        );
                                        scrollToIndex(index);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isSelected
                                                ? AppColors.inputBorder
                                                : Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            AppSizes.radiusXS,
                                          ),
                                        ),
                                        child: CachedImage(
                                          imageUrl: imageList[index],
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          borderRadius: BorderRadius.circular(
                                            AppSizes.radiusXS,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ❌ Close Button
                      Positioned(
                        top: 20,
                        left: 20,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: AppSizes.iconM,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final plant = widget.plant;
    final variety = widget.variety;

    final displayName = variety?.name ?? plant.name;
    final displayPrice = variety?.price ?? plant.price;
    final isAvailable = variety?.isAvailable ?? plant.isAvailable;
    final isWide = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(displayName, style: AppFonts.headline2),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        child: isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: _buildImageSwiper(),
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacingL),
                  Expanded(
                    flex: 5,
                    child: _buildDetails(
                      displayName,
                      displayPrice,
                      isAvailable,
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AspectRatio(aspectRatio: 1, child: _buildImageSwiper()),
                    const SizedBox(height: AppSizes.spacingL),
                    _buildDetails(displayName, displayPrice, isAvailable),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildImageSwiper() {
    final scrollController = ScrollController();

    void scrollToIndex(int index) {
      final offset = (index * 70.0) - 100.0;
      scrollController.animateTo(
        offset.clamp(0, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 🖼️ Main Image with arrow navigation
        SizedBox(
          height: MediaQuery.of(context).size.width > 600 ? 400 : 280,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: imageList.length,

                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                  scrollToIndex(index);
                },
                itemBuilder: (_, index) {
                  final label = getLabelAt(index);
                  return GestureDetector(
                    onTap: () => _openFullImage(index),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        CachedImage(
                          imageUrl: imageList[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(AppSizes.radiusS),
                        ),
                        if (label != null)
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              label,
                              style: AppFonts.caption.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),

              // ⬅️ Arrow - Previous
              if (_currentIndex > 0)
                SwipeArrowWidget(
                  isLeft: true,

                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),

              // ➡️ Arrow - Next
              if (_currentIndex < imageList.length - 1)
                SwipeArrowWidget(
                  isLeft: false,
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),
            ],
          ),
        ),

        const SizedBox(height: AppSizes.spacingM),

        // 🔳 Thumbnail strip without labels
        SizedBox(
          height: 60,
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(imageList.length, (index) {
                final isSelected = index == _currentIndex;
                return GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(index);
                    setState(() => _currentIndex = index);
                    scrollToIndex(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                    ),
                    child: CachedImage(
                      imageUrl: imageList[index],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(
    String displayName,
    double displayPrice,
    bool isAvailable,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          displayName,
          style: AppFonts.headline2.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.spacingS),
        Text(
          '₹${displayPrice.toStringAsFixed(0)}',
          style: AppFonts.headline2.copyWith(
            color: AppColors.success,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.spacingXL),
        isAvailable
            ? SizedBox(
                height: AppSizes.buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.variety != null) {
                      addVarietyToCart(context, widget.plant, widget.variety!);
                    } else {
                      addPlantToCart(context, widget.plant);
                    } //  Add to cart
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                  ),
                  child: const Text("Add to Cart"),
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingL,
                  vertical: AppSizes.paddingS,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Text(
                  "Out of Stock",
                  style: AppFonts.bodyText.copyWith(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
        const SizedBox(height: AppSizes.spacingXL),
        Text(
          "This beautiful plant is perfect for your home or garden. It thrives in well-lit areas and adds natural charm to any space.",
          style: AppFonts.bodyText,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: AppSizes.spacingXL),
      ],
    );
  }
}
