// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseRecommendationServices {
  final Dio _dio = Dio();

  Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String? token;

  Future<void> setToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString(SPKey.accessToken);
  }

  ///'maxItem' is the maximum number of items, the default is 20.
  Future<CourseRecommendation?> getRecommendation({int maxItem = 20}) async {
    await setToken();
    if (token != null) {
      try {
        _dio.options.headers['Authorization'] = "Bearer $token";
        Response response = await _dio.post(
            '${Urls.baseUrl}${Urls.platformUrl}/recommendations',
            options: Options(headers: head),
            data: {'max': maxItem});
        if (response.statusCode == 200) {
          return CourseRecommendation.fromJson(response.data['data']);
        } else {
          return null;
        }
      } on DioException catch (e) {
        print('=> ${e.message}');
        rethrow;
      }
    }
    return null;
  }

  Future<CourseRecommendation?> getAllCourse({
    int offset = 0,
    int limit = 10,
  }) async {
    try {
      Response response = await _dio.post(
        '${Urls.baseUrl}${Urls.platformUrl}/courses?offset=$offset&limit=$limit',
        options: Options(headers: head),
      );
      if (response.statusCode == 200) {
        return CourseRecommendation.fromJson(response.data['data']);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('=> ${e.message}');
      rethrow;
    }
  }
}
