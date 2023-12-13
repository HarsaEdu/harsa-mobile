import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/get_user_courses_model.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class MenuKelasProvider with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  String _filter = ''; // Menyimpan nilai filter

  String get filter => _filter;

  late LoadingState loadingState;
  UserCoursesModel? userCoursesModel;

  getUserCourses({
    required String filter,
  }) async {
    try {
      final courses = await CoursesService.getUserCourses(filter: filter);

      userCoursesModel = courses;
    } on DioException catch (e) {
      if (e.response!.statusCode! == 404) {
        userCoursesModel = null;
      }
      notifyListeners();

      rethrow;
    }

    notifyListeners();
  }

  void setFilter(String value) {
    _filter = value;
    getUserCourses(filter: value);
    notifyListeners();
  }
}
