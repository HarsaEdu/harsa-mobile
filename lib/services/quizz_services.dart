// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/quizz_models/modul_quizz_model.dart';
import 'package:harsa_mobile/models/quizz_models/quizz_model.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';

class QuizzServices {
  final Dio _dio = Dio();

  Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJlbWFpbCI6InRlc3RzdHVkZW50QGdtYWlsLmNvbSIsImV4cCI6MTcwMTg3MjA2NiwiaWQiOjIsInJvbGVfbmFtZSI6InN0dWRlbnQiLCJ1c2VybmFtZSI6InRlc3RzdHVkZW50In0.m_YZIjlzdL-NlZqIqm7TI1lZ50uqkfVMsZkD4Aeiq_M';

  Future<QuizzData?> getAll(int moduleId) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        '${Urls.baseUrl}${Urls.platformUrl}/courses/module/$moduleId/quizzes?limit=10&offset=0',
        options: Options(headers: head),
      );

      if (response.statusCode == 200) {
        return QuizzData.fromJson(response.data['data']);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ModulQuizzData?> getQuizzById(int quizId) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        '${Urls.baseUrl}${Urls.platformUrl}/courses/module/quizzes/$quizId',
        options: Options(headers: head),
      );
      print(response.data);

      if (response.statusCode == 200) {
        return ModulQuizzData.fromJson(response.data['data']);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  Future<bool> postQuizzAnswer(String id, List<Map<String, dynamic>> answer) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";

      Response response = await _dio.post(
          '${Urls.baseUrl}${Urls.platformUrl}/courses/module/quizzes/$id/answering',
          options: Options(headers: head),
          data: answer);

      if (response.statusCode == 201) {
        return true;
      }
    } on DioException catch (e) {
      print(e.message);
      rethrow;
    }
    return false;
  }
}

void main() async {
  // print(await QuizzServices().getQuizzById(8));
  print(await QuizzServices().getAll(1));
}
