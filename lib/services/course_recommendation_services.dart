// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
// import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CourseRecommendationServices {
  final Dio _dio = Dio();

  Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String? token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjcmVhdGVkX2F0IjoiMjAyMy0xMS0yNFQxNDozMzoxOS4wNDhaIiwiZW1haWwiOiJ0ZXN0c3R1ZGVudEBnbWFpbC5jb20iLCJleHAiOjE3MDI3NDQ5NTMsImlkIjoyLCJyb2xlX25hbWUiOiJzdHVkZW50IiwidXNlcm5hbWUiOiJ0dWRlbnQgbWFudHVsIn0.3agmCfxn2ZRUUHoKDaWZ_9bA11yNLCSNEZmIf3KxVfo";

  // Future<void> setToken() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   token = sp.getString(SPKey.accessToken);
  // }

  ///'maxItem' is the maximum number of items, the default is 20.
  Future<CourseRecommendation?> getRecommendation({int maxItem = 20}) async {
    // await setToken();
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
}

void main() async {
  print(await CourseRecommendationServices().getRecommendation());
}
