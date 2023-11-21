import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/category_card_model.dart';

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

  CategoryCardModel getCategoryCardModel(int index) {
    return CategoryCardModel(
      title: 'UI/UX: Becoming Professional',
      subtitle: 'Bagus Adhi Laksana',
      rating: 4.5,
      imageUrl: 'https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2021/08/learn-coding-online-for-free.webp',
    );
  }
}
