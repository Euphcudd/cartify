class PlantVariety {
  final String name;
  final double price;
  final bool isAvailable;

  final String? thumbnailImage; // Used in grid
  final String image1; // Required
  final List<LabeledImage>? additionalImages; // Optional

  PlantVariety({
    required this.name,
    required this.price,
    required this.isAvailable,
    required this.image1,
    this.thumbnailImage,
    this.additionalImages,
  });

  /// Complete gallery: image1 + additional images
  List<String> get allImages => [
    image1,
    ...?additionalImages?.map((e) => e.url),
  ];

  /// Label for image at given index
  String? labelAt(int index) {
    if (index == 0) return null;
    if (additionalImages != null && index - 1 < additionalImages!.length) {
      return additionalImages![index - 1].label;
    }
    return null;
  }
}

class LabeledImage {
  final String url;
  final String label;

  LabeledImage({required this.url, required this.label});
}

class Plant {
  final String id;
  final String name;
  final double price;

  final String imageMain; // Used in store grid
  final String? image1; // For plant with no varieties
  final List<LabeledImage>? additionalImages; // Optional for no-variety

  final String categoryId;
  final List<PlantVariety> varieties;

  final bool isAvailable;

  Plant({
    required this.id,
    required this.name,
    required this.price,
    required this.imageMain,
    this.image1,
    this.additionalImages,
    required this.categoryId,
    this.varieties = const [],
    this.isAvailable = true,
  }) : assert(
         varieties.isNotEmpty || image1 != null,
         'image1 is required if the plant has no varieties',
       );

  bool get hasVarieties => varieties.isNotEmpty;

  bool get isOutOfStock {
    if (hasVarieties) {
      return varieties.every((v) => !v.isAvailable);
    } else {
      return !isAvailable;
    }
  }

  String get fallbackImage1 => image1 ?? imageMain;

  List<String> get fallbackImageGallery => [
    fallbackImage1,
    ...?additionalImages?.map((e) => e.url),
  ];

  /// Label at index (used only in details page for no-variety)
  String? fallbackLabelAt(int index) {
    if (index == 0) return null;
    if (additionalImages != null && index - 1 < additionalImages!.length) {
      return additionalImages![index - 1].label;
    }
    return null;
  }
}
