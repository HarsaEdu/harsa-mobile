import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> allCategories = [
    Category(id: 1, name: 'Komputer', imagePath: 'assets/images/komputer.png'),
    Category(id: 2, name: 'Bisnis', imagePath: 'assets/images/bisnis.png'),
    Category(id: 3, name: 'Sosial', imagePath: 'assets/images/sosial.png'),
    Category(id: 4, name: 'UI/UX', imagePath: 'assets/images/ui_ux.png'),
    Category(id: 5, name: 'Desain', imagePath: 'assets/images/desain.png'),
    Category(id: 6, name: 'Animasi', imagePath: 'assets/images/animasi.png'),
    Category(id: 7, name: 'Robotika', imagePath: 'assets/images/robotika.png'),
    Category(id: 8, name: 'Cyber', imagePath: 'assets/images/cyber.png'),
  ];
  List<Category> displayedCategories = [];

  CategoryProvider() {
    displayedCategories = allCategories;
  }

  void filterCategories(String query) {
    displayedCategories = allCategories
        .where(
          (category) =>
              category.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }
}

class Category {
  final int id;
  final String name;
  final String imagePath;

  Category({
    required this.id,
    required this.name,
    required this.imagePath,
  });
}
