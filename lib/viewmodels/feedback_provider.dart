import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/models/feedback_models/my_feedback_model.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/services/feedback_services.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FeedbackProvider extends ChangeNotifier {
  final GlobalKey<FormState> ratingFormKey = GlobalKey();
  TextEditingController? ratingController;

  final PanelController _panelController = PanelController();
  PanelController get panelController => _panelController;

  LoadingState loadingState = LoadingState.initial;

  CourseDetailsModel? courseDetailsModel;
  CourseFeedbackModel? courseFeedbackModel;
  MyFeedbackModel? myFeedbackModel;

  late bool isEditing;
  late bool isUpdating;
  late int rating;

  void getCourseDetails({required int courseId}) async {
    try {
      loadingState = LoadingState.loading;
      courseDetailsModel = null;

      final course = await CoursesService.getCourseDetails(courseId: courseId);

      courseDetailsModel = course;
      loadingState = LoadingState.success;
      notifyListeners();
    } on DioException catch (_) {
      courseDetailsModel = null;
      notifyListeners();

      rethrow;
    }
  }

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
      loadingState = LoadingState.success;
      courseFeedbackModel = null;
      notifyListeners();

      rethrow;
    }
  }

  String feedbackSince(DateTime updatedFeedback) {
    DateTime currentDate = DateTime.now();

    Duration difference = currentDate.difference(updatedFeedback);

    if (difference.inMinutes <= 60) {
      return "${difference.inMinutes.toString()} menit lalu";
    } else if (difference.inHours >= 1 && difference.inHours < 24) {
      return "${difference.inHours.toString()} jam lalu";
    } else if (difference.inDays >= 1 && difference.inDays < 30) {
      return "${difference.inDays.toString()} hari lalu";
    }
    return "${updatedFeedback.day}/${updatedFeedback.month}/${updatedFeedback.year}";
  }

  void getMyCourseFeedback({required int courseId}) async {
    try {
      loadingState = LoadingState.loading;
      myFeedbackModel = null;

      final feedbacks =
          await FeedbackServices.getMyCourseFeedback(courseId: courseId);

      myFeedbackModel = feedbacks;
      isEditing = false;
      loadingState = LoadingState.success;
      notifyListeners();
    } on DioException catch (_) {
      loadingState = LoadingState.success;
      myFeedbackModel = null;
      isEditing = true;
      notifyListeners();

      rethrow;
    }
  }

  void editMyFeedback() {
    ratingController!.text = myFeedbackModel!.data.content;
    rating = myFeedbackModel!.data.rating;
    isEditing = true;
    isUpdating = true;
    notifyListeners();
    _panelController.open();
  }

  void rate(int newRating) {
    rating = newRating + 1;
    notifyListeners();
  }

  String? validateRating(String? value) {
    return value == null || value == "" ? "Ulasan wajib diisi" : null;
  }

  void submitMyFeedback({required int courseId}) async {
    if (!ratingFormKey.currentState!.validate() || rating == 0) return;

    try {
      loadingState = LoadingState.loading;
      notifyListeners();

      if (isUpdating) {
        await FeedbackServices.updateMyFeedback(
          courseId: courseId,
          rating: rating,
          feedback: ratingController!.text,
        );
      } else {
        await FeedbackServices.createMyFeedback(
          courseId: courseId,
          rating: rating,
          feedback: ratingController!.text,
        );
      }

      final feedbacks =
          await FeedbackServices.getMyCourseFeedback(courseId: courseId);

      myFeedbackModel = feedbacks;

      isEditing = false;
      loadingState = LoadingState.success;
      notifyListeners();
    } on DioException catch (_) {
      loadingState = LoadingState.failed;
      notifyListeners();
      rethrow;
    }
    _panelController.close();
    // getCourseFeedbacks(courseId: courseId);
  }

  void deleteMyFeedback({required int courseId}) async {
    try {
      loadingState = LoadingState.loading;
      notifyListeners();

      await FeedbackServices.deleteMyFeedback(courseId: courseId);

      final feedbacks =
          await FeedbackServices.getMyCourseFeedback(courseId: courseId);

      myFeedbackModel = feedbacks;

      isEditing = false;
      loadingState = LoadingState.failed;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response!.statusCode! == 404) {
        myFeedbackModel = null;
        rating = 0;
        ratingController!.clear();
        isUpdating = false;
        isEditing = true;
      }
      loadingState = LoadingState.success;
      notifyListeners();
      rethrow;
    } finally {
      _panelController.open();
      notifyListeners();
    }
  }
}
