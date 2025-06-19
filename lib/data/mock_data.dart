import 'package:cartify/models/category_model.dart';
import 'package:cartify/models/plant_model.dart';

final mockCategories = [
  Category(id: '1', name: '🌸 Flowering', icon: '🌸'),
  Category(id: '2', name: '🌿 Leafy', icon: '🌿'),
];

final mockPlants = [
  // ✅ ROSE - with 2 varieties
  Plant(
    id: 'rose',
    name: 'Rose',
    price: 99,
    categoryId: '1',
    imageMain:
        'https://images.unsplash.com/photo-1504196606672-aef5c9cefc92', // plant tile
    varieties: [
      PlantVariety(
        name: 'Red Rose',
        price: 99,
        isAvailable: true,
        image1: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb',
        thumbnailImage: null, // fallback to image1
        additionalImages: [
          LabeledImage(
            url: 'https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
            label: 'Plant Size: Medium',
          ),
          LabeledImage(
            url:
                'https://images.unsplash.com/photo-1504196606672-aef5c9cefc92?3',
            label: 'Flower Color: Deep Red',
          ),
        ],
      ),
      PlantVariety(
        name: 'Pink Rose',
        price: 109,
        isAvailable: true,
        image1: 'https://images.unsplash.com/photo-1610011518770-82ac53b9c1c1',
        thumbnailImage:
            'https://images.unsplash.com/photo-1609381294307-f1bb0a2b6e88',
        additionalImages: [
          LabeledImage(
            url:
                'https://images.unsplash.com/photo-1609381294307-f1bb0a2b6e88?2',
            label: 'Flower Color: Light Pink',
          ),
        ],
      ),
    ],
  ),

  // ✅ HIBISCUS - no variety, out of stock
  Plant(
    id: 'hibiscus',
    name: 'Hibiscus',
    price: 109,
    categoryId: '1',
    imageMain: 'https://images.unsplash.com/photo-1615485929486-7e9a0ff5c040',
    image1: 'https://images.unsplash.com/photo-1615485929486-7e9a0ff5c040',
    isAvailable: false,
  ),

  // ✅ MARIGOLD - no variety
  Plant(
    isAvailable: false,
    id: 'marigold',
    name: 'Marigold',
    price: 59,
    categoryId: '1',
    imageMain: 'https://images.unsplash.com/photo-1596788065905-9e3d4d4f4cf6',
    image1: 'https://images.unsplash.com/photo-1596788065905-9e3d4d4f4cf6',
    additionalImages: [],
  ),

  // ✅ MONEY PLANT - no variety
  Plant(
    id: 'moneyPlant',
    name: 'Money Plant',
    price: 49,
    categoryId: '2',
    imageMain: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb',
    image1: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb',
  ),

  // ✅ SNAKE PLANT - no variety
  Plant(
    id: 'snakePlant',
    name: 'Snake Plant',
    price: 89,
    categoryId: '2',
    imageMain: 'https://images.unsplash.com/photo-1583337130417-3346a1d3a46b',
    image1: 'https://images.unsplash.com/photo-1583337130417-3346a1d3a46b',
    additionalImages: [],
  ),
];
