// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  Future<void> setToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString(SPKey.accessToken);
  }

  Future<QuizzData?> getQuizzById(
      {required int id, required int moduleId}) async {
    await setToken();
    if (token != null) {
      debugPrint('=> ${token.toString()}');
      try {
        _dio.options.headers['Authorization'] = "Bearer $token";
        Response response = await _dio.get(
          '${Urls.baseUrl}${Urls.platformUrl}/courses/module/quizzes/$id',
          options: Options(headers: head),
        );

        if (response.statusCode == 200) {
          debugPrint('=> response : ${response.data['data']}');
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

  Future<bool> submitAnswers(int id, List<QuizzAnswer> answers) async {
    if (token != null) {
      try {
        _dio.options.headers['Authorization'] = "Bearer $token";
        final Response response = await _dio.post(
          '${Urls.baseUrl}${Urls.platformUrl}/courses/module/quizzes/$id/answering',
          options: Options(headers: head),
          data: answers.map((answer) => answer.toJson()).toList(),
        );
        return response.statusCode == 200;
      } on DioException catch (e) {
        debugPrint('=> ${e.message.toString()}');
      }
    }
    return false;
  }
}
