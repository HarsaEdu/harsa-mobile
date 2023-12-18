import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/feedback_models/course_feedback_models.dart';
import 'package:harsa_mobile/models/feedback_models/my_feedback_model.dart';
import 'package:harsa_mobile/models/post_model.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackServices {
  static final Dio dio = Dio();

  static Future<CourseFeedbackModel?> getCourseFeedbacks({
    required int courseId,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/courses/$courseId/feedbacks?offset=0&limit=10";

    try {
      final Response response = await dio.get(url);

      return CourseFeedbackModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  static Future<MyFeedbackModel?> getMyCourseFeedback({
    required int courseId,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/courses/$courseId/feedbacks/my-feedback";

    try {
      final Response response = await dio.get(url);

      return MyFeedbackModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  static Future<PostModel?> createMyFeedback({
    required int courseId,
    required int rating,
    required String feedback,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/courses/$courseId/feedbacks";
    final Map data = {
      "rating": rating,
      "content": feedback,
    };

    try {
      final Response response = await dio.post(url, data: data);

      return PostModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  static Future<PostModel?> updateMyFeedback({
    required int courseId,
    required int rating,
    required String feedback,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/courses/$courseId/feedbacks";
    final Map data = {
      "rating": rating,
      "content": feedback,
    };

    try {
      final Response response = await dio.put(url, data: data);

      return PostModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  static Future<PostModel?> deleteMyFeedback({
    required int courseId,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/courses/$courseId/feedbacks";

    try {
      final Response response = await dio.delete(url);

      return PostModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
