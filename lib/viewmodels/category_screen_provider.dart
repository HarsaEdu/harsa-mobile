import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/category_models/category_content.dart';
import 'package:harsa_mobile/services/category_service.dart';

class CategoryScreenProvider extends ChangeNotifier {
  bool _isArrowUp = false;
  bool _isCategoryList = true;
  int _lastTabIndex = 0;

  List<String> categories = [
    'Pemrograman',
    'Robotika',
    'Sosial',
    'Alam',
    'Bisnis',
    'Komputer',
    'Pemrograman',
  ];

  bool get isArrowUp => _isArrowUp;
  bool get isCategoryList => _isCategoryList;
  int get lastTabIndex => _lastTabIndex;

  void toggleArrowDirection() {
    _isArrowUp = !_isArrowUp;

    if (!_isArrowUp) {
      _isCategoryList = true;
    } else {
      _isCategoryList = false;
    }

    notifyListeners();
  }

  void changeTabIndex(int index) {
    _lastTabIndex = index;

    notifyListeners();
  }

  String getCategoryAtIndex(int index) {
    return categories[index];
  }

  int getCategoryCount() {
    return categories.length;
  }

  List<CategoryListData> categoryList = [];

  void fetchCategories() async {
    try {
      final response = await CategoryService().getListCategories();
      categoryList = response.data;
      notifyListeners();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  List<CategoryListData> filteredCategoryList = [];

  void filterCategory(String selectedCategory) {
    filteredCategoryList = categoryList
        .where((category) => category.category.name == selectedCategory)
        .toList();

    notifyListeners();
  }
}
