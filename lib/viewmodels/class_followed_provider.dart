import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/classes_models.dart/user_courses_model.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class ClassFollowedProvider with ChangeNotifier {
  ClassFollowedProvider() {
    focusNode.addListener(notifyListeners);
    getUserClasses();
  }

  UserCoursesModel? coursesModel;
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

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
