// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/faq_models/faq_models.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';

class FaqService {
  final Dio _dio = Dio();
  String token = '';
  int offset = 1;
  int limit = 10;

  Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Faqmodel?> getAll(int moduleId) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        '${Urls.baseUrl}${Urls.platformUrl}/faqs?offset=$offset&limit=$limit',
        options: Options(headers: head),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return Faqmodel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
