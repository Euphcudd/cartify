import 'package:cartify/data/mock_data.dart';
import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class PlantProvider with ChangeNotifier {
  final List<Plant> _plants = mockPlants;

  List<Plant> get plants => _plants;

  List<Plant> getPlantsByCategory(String categoryId) {
    return _plants.where((plant) => plant.categoryId == categoryId).toList();
  }
}
