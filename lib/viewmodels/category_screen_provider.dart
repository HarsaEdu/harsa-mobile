import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/category_models/category_content.dart';
import 'package:harsa_mobile/models/category_models/category_home_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_no_login_model.dart';
import 'package:harsa_mobile/services/category_service.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryScreenProvider extends ChangeNotifier {
  bool _isArrowUp = false;
  bool _isCategoryList = true;
  int _lastTabIndex = 0;

  bool get isArrowUp => _isArrowUp;
  bool get isCategoryList => _isCategoryList;
  int get lastTabIndex => _lastTabIndex;

  List<Category> categoryList = [];
  List<CategoryListData> courseData = [];

  CourseDetailsData? courseDetailsData;
  CourseDetailsNoLoginData? noLoginData;

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
      final Categories response =
          await CategoryService().getCategories(limit: 99);
      categoryList = response.categories;
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

  List<CategoryListData> getCategoryCourseList({required int categoryId}) {
    filterCategory(categoryId: categoryId);
    return courseData;
  }

  void filterCategory({required int categoryId}) async {
    final CheckCategory response =
        await CategoryService().getListCategories(id: categoryId);
    courseData = response.data;
    notifyListeners();
  }

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

      final courses = await CoursesService.getUserCourses(filter: '');

      if (courseDetailsData!.isSubscription == true) {
        for (final enrolled in courses!.data) {
          if (courseId == enrolled.courseId) {
            if (context.mounted) {
              Navigator.pushNamed(
                context,
                "/kelasscreen",
                arguments: courseDetailsData,
              );
            }
            return;
          }
        }
      }

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
