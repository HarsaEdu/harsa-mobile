import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/user_courses_model.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class MenuKelasProvider with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  String _filter = ''; // Menyimpan nilai filter

  String get filter => _filter;

  late LoadingState loadingState;
  UserCoursesModel? userCoursesModel;
  List<UserCoursesData>? originalCourses;
  List<UserCoursesData>? searchCourses;
  CourseDetailsModel? courseDetailsModel;

  void searchKelas(String value) {
    originalCourses = userCoursesModel!.data;

    searchCourses = originalCourses!
        .where(
            (kelas) => kelas.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void getUserCourses({
    required String filter,
  }) async {
    try {
      loadingState = LoadingState.loading;

      final courses = await CoursesService.getUserCourses(filter: filter);

      userCoursesModel = courses;
      loadingState = LoadingState.success;
    } on DioException catch (e) {
      if (e.response!.statusCode! == 404) {
        userCoursesModel = null;
        loadingState = LoadingState.failed;
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

  void checkSubs(BuildContext context, int courseId) async {
    try {
      loadingState = LoadingState.loading;

      final courses = await CoursesService.getCourseDetails(courseId: courseId);

      courseDetailsModel = courses;
      loadingState = LoadingState.success;
      notifyListeners();
      if (context.mounted) {
        Navigator.pushNamed(
          context,
          '/kelasscreen',
          arguments: courseDetailsModel!.data,
        );
      }
    } on DioException catch (_) {
      loadingState = LoadingState.failed;
      notifyListeners();
      if (context.mounted) {
        Navigator.pushNamed(
          context,
          '/daftarkelas',
          arguments: courseDetailsModel!.data,
        );
      }
      rethrow;
    }
  }
}
