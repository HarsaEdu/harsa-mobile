import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/user_courses_model.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/services/feedback_services.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaftarKelasProvider with ChangeNotifier {
  LoadingState loadingState = LoadingState.initial;

  CourseFeedbackModel? courseFeedbackModel;
  UserCoursesModel? userCoursesModel;

  late bool isEnrolled;

  void getEnrolledCourses(
    BuildContext context, {
    required CourseDetailsData data,
  }) async {
    isEnrolled = false;

    try {
      loadingState = LoadingState.loading;
      notifyListeners();

      final courses = await CoursesService.getUserCourses(filter: '');

      for (final enrolled in courses!.data) {
        if (data.course.id == enrolled.courseId) {
          isEnrolled = true;
          break;
        }
      }

      userCoursesModel = courses;
      loadingState = LoadingState.success;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response!.statusCode! == 404) {
        userCoursesModel = null;
        loadingState = LoadingState.failed;
      }
      isEnrolled == false;
      notifyListeners();

      rethrow;
    }

    if (!isEnrolled) return;

    try {
      loadingState = LoadingState.loading;
      notifyListeners();

      final courseDetails =
          await CoursesService.getCourseDetails(courseId: data.course.id);
      courseDetailsModel = courseDetails;

      loadingState = LoadingState.success;
      notifyListeners();

      if (context.mounted) {
        Navigator.pushReplacementNamed(
          context,
          '/kelasscreen',
          arguments: courseDetailsModel!.data,
        );
      }
    } on DioException catch (_) {
      loadingState = LoadingState.failed;
      isEnrolled = false;
      notifyListeners();
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
      loadingState = LoadingState.failed;
      courseFeedbackModel = null;
      notifyListeners();

      rethrow;
    }
  }

  CourseDetailsModel? courseDetailsModel;

  void checkSubs(
    BuildContext context, {
    required int courseId,
    required bool isSubbed,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null || token == "") {
      if (context.mounted) {
        Navigator.pushNamed(context, '/login');
        return;
      }
    }

    if (!isSubbed) {
      if (context.mounted) {
        Navigator.pushNamed(context, '/subscriptionlist');
        return;
      }
    }

    if (!isEnrolled) {
      try {
        loadingState = LoadingState.loading;
        notifyListeners();

        await CoursesService.enrollCourse(courseId: courseId);

        final courseDetails =
            await CoursesService.getCourseDetails(courseId: courseId);
        courseDetailsModel = courseDetails;

        isEnrolled = true;
        loadingState = LoadingState.success;
        notifyListeners();

        if (context.mounted) {
          Navigator.pushReplacementNamed(
            context,
            '/kelasscreen',
            arguments: courseDetailsModel!.data,
          );
        }
      } on DioException catch (_) {
        loadingState = LoadingState.failed;
        isEnrolled = false;
        notifyListeners();
      }
    }
  }
}
