import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/user_courses_model.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/services/feedback_services.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class NonLoginClassProvider with ChangeNotifier {
  LoadingState loadingState = LoadingState.initial;
  CourseDetailsModel? courseDetailsModel;
  CourseFeedbackModel? courseFeedbackModel;
  UserCoursesModel? userCoursesModel;

  

  void getCourseFeedbacks({required int courseId}) async {
    try {
      loadingState = LoadingState.loading;
      courseFeedbackModel = null;

      final feedbacks =
          await FeedbackServices.getCourseFeedbacks(courseId: courseId);

      courseFeedbackModel = feedbacks;
      loadingState = LoadingState.success;
      notifyListeners();
    } on DioException catch (_) {
      loadingState = LoadingState.failed;
      courseFeedbackModel = null;
      notifyListeners();

      rethrow;
    }
  }
}
