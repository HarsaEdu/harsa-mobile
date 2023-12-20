import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/category_models/category_content.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_no_login_model.dart';
import 'package:harsa_mobile/services/category_service.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/views/screens/login_reminder_screen/login_reminder_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  CourseDetailsNoLoginData? noLoginData;

  void navigateTo(BuildContext context, int courseId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null || token == '') {
      try {
        final responseNoLogin =
            await CoursesService.getCourseDetailsNoLogin(courseId: courseId);
        noLoginData = responseNoLogin!.data;
        if (context.mounted) {
          Navigator.pushNamed(context, '/nonloginkelas',
              arguments: noLoginData);
        }
        notifyListeners();
      } catch (e) {
        throw Exception("Error: $e");
      }

      return;
    }

    try {
      final responseLogin =
          await CoursesService.getCourseDetails(courseId: courseId);
      courseDetailsData = responseLogin?.data;
      notifyListeners();

      if (context.mounted) {
        Navigator.pushNamed(
          context,
          "/daftarkelas",
          arguments: courseDetailsData,
        );
      }
      notifyListeners();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
