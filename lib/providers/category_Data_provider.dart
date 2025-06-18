import 'package:cartify/data/mock_data.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryDataProvider with ChangeNotifier {
  List<Category> _categories = mockCategories;

  List<Category> get categories => _categories;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void removeCategory(String id) {
    _categories.removeWhere((c) => c.id == id);
    notifyListeners();
  }
}
