import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/services/feedback_services.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class DaftarKelasProvider with ChangeNotifier {
  LoadingState loadingState = LoadingState.initial;

  CourseFeedbackModel? courseFeedbackModel;

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
