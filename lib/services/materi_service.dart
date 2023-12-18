import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/materi_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants/shared_preferences_key.dart';
import '../utils/constants/urls.dart';

class CourseModuleService {
  final Dio _dio = Dio();

  String? token;

  Future<void> setToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString(SPKey.accessToken);
  }

  Future<MateriModel?> getCourseModuleTracking(int modulId) async {
    await setToken();
    debugPrint('=> courseId : ${modulId.toString()}');
    if (token != null) {
      debugPrint('=> token saya : ${token.toString()}');
      try {
        _dio.options.headers['Authorization'] = 'Bearer $token';
        final Response response = await _dio.get(
          '${Urls.baseUrl}/mobile/users/course/module/$modulId/tracking',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );
        if (response.statusCode == 200) {
          debugPrint('=> response.data : ${response.data['data']}');
          return MateriModel.fromJson(response.data['data']);
        }
        return null;
      } on DioException catch (e) {
        debugPrint('=> error : ${e.message.toString()}');
        // rethrow;
      }
    }
    return null;
  }
}
