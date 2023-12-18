import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';

import 'package:harsa_mobile/models/classes_models.dart/user_courses_model.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class ClassFollowedProvider with ChangeNotifier {
  ClassFollowedProvider() {
    focusNode.addListener(notifyListeners);
    getUserClasses();
  }

  UserCoursesModel? coursesModel;
  CourseDetailsData? courseDetailsData;
  List<UserCoursesData> data = [];
  FocusNode focusNode = FocusNode();
  List<UserCoursesData> filteredData = [];
  String searchQuery = '';

  LoadingState loadingState = LoadingState.initial;

  void getUserClasses() async {
    try {
      loadingState = LoadingState.loading;
      final coursesModel = await CoursesService.getUserCourses(filter: "");

      data.addAll(coursesModel!.data);
      filteredData.addAll(coursesModel.data);
      loadingState = LoadingState.success;
      notifyListeners();
    } on DioException catch (_) {
      loadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  void filterByStatus(String status) {
    filteredData = data.where((classFollowed) {
      return classFollowed.status.toLowerCase() == status.toLowerCase();
    }).toList();
    notifyListeners();
  }

  void searchClassFollowed(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      filteredData = data;
    } else {
      filteredData = data.where((classFollowed) {
        return classFollowed.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void tapCourse(BuildContext context, {required int courseId}) async {
    try {
      loadingState = LoadingState.loading;

      final response =
          await CoursesService.getCourseDetails(courseId: courseId);
      courseDetailsData = response!.data;

      loadingState = LoadingState.success;
      notifyListeners();

      if (context.mounted) {
        Navigator.pushNamed(
          context,
          "/kelasscreen",
          arguments: courseDetailsData,
        );
      }
    } catch (_) {
      loadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
