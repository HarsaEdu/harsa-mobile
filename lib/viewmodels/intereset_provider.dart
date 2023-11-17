import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<String> allCategories = [
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'Komputer',
    'ui/ux',
  ];
  List<String> displayedCategories = [];

  CategoryProvider() {
    displayedCategories = allCategories;
  }

  void filterCategories(String query) {
    displayedCategories = allCategories
        .where((category) =>
            category.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}