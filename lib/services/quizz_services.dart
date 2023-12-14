// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/quizz_models/quizz_model.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizzServices {
  final Dio _dio = Dio();

  Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String? token;

  void setToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString(SPKey.accessToken);
  }

  Future<QuizzData?> getQuizzById(
      {required int moduleId, required int quizId}) async {
    setToken();
    if (token != null) {
      try {
        _dio.options.headers['Authorization'] = "Bearer $token";
        Response response = await _dio.get(
          '${Urls.baseUrl}${Urls.platformUrl}/users/courses/module/$moduleId/quizz/$quizId',
          options: Options(headers: head),
        );
        print(response.data);

        if (response.statusCode == 200) {
          return QuizzData.fromJson(response.data['data']);
        } else {
          return null;
        }
      } on DioException catch (e) {
        print(e.message);
        rethrow;
      }
    }
    return null;
  }

  Future<bool> postQuizzAnswer(
      {required String quizzId,
      required List<Map<String, dynamic>> answer}) async {
    setToken();
    if (token != null) {
      try {
        _dio.options.headers['Authorization'] = "Bearer $token";

        Response response = await _dio.post(
            '${Urls.baseUrl}${Urls.platformUrl}/courses/module/quizzes/$quizzId/answering',
            options: Options(headers: head),
            data: answer);

        if (response.statusCode == 201) {
          return true;
        }
      } on DioException catch (e) {
        print(e.message);
        rethrow;
      }
    }
    return false;
  }
}
