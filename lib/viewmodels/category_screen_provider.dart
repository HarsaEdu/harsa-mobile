import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/category_models/category_content.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/services/category_service.dart';
import 'package:harsa_mobile/services/courses_service.dart';

class CategoryScreenProvider extends ChangeNotifier {
  bool _isArrowUp = false;
  bool _isCategoryList = true;
  int _lastTabIndex = 0;

  bool get isArrowUp => _isArrowUp;
  bool get isCategoryList => _isCategoryList;
  int get lastTabIndex => _lastTabIndex;

  List<CategoryListData> filteredCategoryList = [];
  List<CategoryListData> categoryList = [];
  CourseDetailsData? courseDetailsData;

  void toggleArrowDirection() {
    _isArrowUp = !_isArrowUp;

    if (!_isArrowUp) {
      _isCategoryList = true;
    } else {
      _isCategoryList = false;
    }

    notifyListeners();
  }

  int getCategoryCount() {
    return categoryList.length;
  }

  void changeTabIndex(int index) {
    _lastTabIndex = index;

    notifyListeners();
  }

  void fetchCategories() async {
    try {
      final response = await CategoryService().getListCategories();
      categoryList = response.data;
      notifyListeners();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  void fetchCourseDetails(int courseId) async {
    try {
      final response =
          await CoursesService.getCourseDetails(courseId: courseId);
      courseDetailsData = response!.data;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  void filterCategory(String selectedCategory) {
    filteredCategoryList = categoryList
        .where((category) => category.courseTitle == selectedCategory)
        .toList();

    notifyListeners();
  }

  void navigateTo(BuildContext context, int courseId) async {
    try {
      final response =
          await CoursesService.getCourseDetails(courseId: courseId);
      courseDetailsData = response!.data;
      notifyListeners();
    } catch (e) {
      throw Exception("Error: $e");
    }

    if (context.mounted) {
      if (courseDetailsData!.isSubscription != true) {
        Navigator.pushNamed(
          context,
          "/kelasscreen",
          arguments: courseDetailsData,
        );
      } else {
        Navigator.pushNamed(
          context,
          "/daftarkelas",
          arguments: courseDetailsData,
        );
      }
    }
  }
}
