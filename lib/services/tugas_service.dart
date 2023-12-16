import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants/shared_preferences_key.dart';
import '../utils/constants/urls.dart';

class TugasService {
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

  Future<void> uploadPDF(String filePath) async {
    String url =
        '${Urls.baseUrl}${Urls.platformUrl}/courses/submissions/1/submission-answer';
    await setToken();
    if (token != null) {
      try {
        FormData formData = FormData.fromMap({
          "file":
              await MultipartFile.fromFile(filePath, filename: "submission.pdf")
        });

        Response response = await _dio.post(url,
            options: Options(headers: head), data: formData);
        debugPrint(response.data);
      } on DioException catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
