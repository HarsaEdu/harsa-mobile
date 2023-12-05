// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/modul_quizz_model.dart';
import 'package:harsa_mobile/models/quizz_model.dart';
import 'package:harsa_mobile/utils/constants/string.dart';

class QuizzServices {
  final Dio _dio = Dio();

  final String _midUrl = "/mobile/courses/module/";

  Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJlbWFpbCI6InRlc3RzdHVkZW50QGdtYWlsLmNvbSIsImV4cCI6MTcwMTUzNDQ5NSwiaWQiOjMsInJvbGVfbmFtZSI6InN0dWRlbnQiLCJ1c2VybmFtZSI6InRlc3RzdHVkZW50In0.v4Jtfm9It5kAauusCVaHydSq5x1FL4Yw5N8KRgM-BR0';

  Future<QuizzData?> getAll(int moduleId) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        '$baseUrl$_midUrl$moduleId/quizzes?limit=10&offset=0',
        options: Options(headers: head),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return QuizzData.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ModulQuizzData?> getQuizzById(int quizId) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        '$baseUrl$_midUrl/quizzes/$quizId',
        options: Options(headers: head),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return ModulQuizzData.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

void main() async {
  print(await QuizzServices().getAll(1));
  print(await QuizzServices().getQuizzById(1));
}
