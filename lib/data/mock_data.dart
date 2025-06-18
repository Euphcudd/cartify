// lib/mock_data.dart

import 'package:cartify/models/category_model.dart';
import 'package:cartify/models/plant_model.dart';

final mockCategories = [
  Category(id: '1', name: '🌸 Flowering', icon: '🌸'),
  Category(id: '2', name: '🌿 Leafy', icon: '🌿'),
  Category(id: '3', name: '🌵 Succulent', icon: '🌵'),
  Category(id: '4', name: '🏠 Indoor', icon: '🏠'),
  Category(id: '5', name: '☀️ Outdoor', icon: '☀️'),
  Category(id: '6', name: '🪴 Herbs', icon: '🪴'),
  Category(id: '7', name: '🌾 Bonsai', icon: '🌾'),
];

final mockPlants = [
  // 🌸 Flowering
  Plant(
    id: 'rose',
    name: 'Rose',
    price: 99,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Rose',
    categoryId: '1',
    varieties: [
      PlantVariety(name: 'Red Rose', price: 99, isAvailable: true),
      PlantVariety(name: 'Pink Rose', price: 109, isAvailable: true),
    ],
  ),
  Plant(
    id: 'hibiscus',
    name: 'Hibiscus',
    price: 109,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Hibiscus',
    categoryId: '1',
    varieties: [],
  ),
  Plant(
    id: 'marigold',
    name: 'Marigold',
    price: 59,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Marigold',
    categoryId: '1',
    varieties: [],
  ),

  // 🌿 Leafy
  Plant(
    id: 'moneyPlant',
    name: 'Money Plant',
    price: 49,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Money+Plant',
    categoryId: '2',
    varieties: [],
  ),
  Plant(
    id: 'snakePlant',
    name: 'Snake Plant',
    price: 89,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Snake+Plant',
    categoryId: '2',
    varieties: [],
  ),
  Plant(
    id: 'luckyBamboo',
    name: 'Lucky Bamboo',
    price: 79,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Lucky+Bamboo',
    categoryId: '2',
    varieties: [],
  ),

  // 🌵 Succulent
  Plant(
    id: 'aloeVera',
    name: 'Aloe Vera',
    price: 69,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Aloe+Vera',
    categoryId: '3',
    varieties: [],
  ),
  Plant(
    id: 'jadePlant',
    name: 'Jade Plant',
    price: 99,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Jade+Plant',
    categoryId: '3',
    varieties: [],
  ),
  Plant(
    id: 'echeveria',
    name: 'Echeveria',
    price: 89,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Echeveria',
    categoryId: '3',
    varieties: [],
  ),

  // 🏠 Indoor
  Plant(
    id: 'zzPlant',
    name: 'ZZ Plant',
    price: 149,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=ZZ+Plant',
    categoryId: '4',
    varieties: [],
  ),
  Plant(
    id: 'arecaPalm',
    name: 'Areca Palm',
    price: 189,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Areca+Palm',
    categoryId: '4',
    varieties: [],
  ),
  Plant(
    id: 'spiderPlant',
    name: 'Spider Plant',
    price: 69,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Spider+Plant',
    categoryId: '4',
    varieties: [],
  ),

  // ☀️ Outdoor
  Plant(
    id: 'sunflower',
    name: 'Sunflower',
    price: 49,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Sunflower',
    categoryId: '5',
    varieties: [],
  ),
  Plant(
    id: 'bougainvillea',
    name: 'Bougainvillea',
    price: 89,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Bougainvillea',
    categoryId: '5',
    varieties: [],
  ),

  // 🪴 Herbs
  Plant(
    id: 'tulsi',
    name: 'Tulsi',
    price: 29,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Tulsi',
    categoryId: '6',
    varieties: [],
  ),
  Plant(
    id: 'mint',
    name: 'Mint',
    price: 19,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Mint',
    categoryId: '6',
    varieties: [],
  ),

  // 🌾 Bonsai
  Plant(
    id: 'ficusBonsai',
    name: 'Ficus Bonsai',
    price: 249,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Ficus+Bonsai',
    categoryId: '7',
    varieties: [],
  ),
  Plant(
    id: 'jadeBonsai',
    name: 'Jade Bonsai',
    price: 219,
    imageUrl: 'https://via.placeholder.com/150x150.png?text=Jade+Bonsai',
    categoryId: '7',
    varieties: [],
  ),
];
