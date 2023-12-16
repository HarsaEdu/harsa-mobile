import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants/shared_preferences_key.dart';
import '../utils/constants/urls.dart';

class TugasService {
  final Dio _dio = Dio();

  Future<void> uploadPDF(String filePath) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString(SPKey.accessToken);

    if (token != null) {
      debugPrint('=> token : $token');
      try {
        final FormData formData =
            FormData.fromMap({"file": await MultipartFile.fromFile(filePath)});

        final response = await _dio.post(
          '${Urls.baseUrl}${Urls.platformUrl}/courses/submissions/1/submission-answer/',
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          }),
          data: formData,
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          debugPrint('File uploaded successfully: ${response.data}');
        } else {
          debugPrint('Failed to upload file: ${response.statusCode}');
        }
      } on DioException catch (e) {
        if (e.response != null) {
          debugPrint('DioError: ${e.response!.data}');
          debugPrint('DioError: ${e.response!.headers}');
          debugPrint('DioError: ${e.response!.requestOptions}');
        } else {
          debugPrint('DioError: ${e.message}');
          debugPrint('DioError: ${e.requestOptions}');
        }
      }
    } else {
      debugPrint('Access token is null');
    }
  }
}
