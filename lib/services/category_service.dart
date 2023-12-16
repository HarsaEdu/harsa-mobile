import 'package:dio/dio.dart';

import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:harsa_mobile/models/category_models/category_content.dart';
import 'package:harsa_mobile/models/category_models/category_home_model.dart';

class CategoryService {
  static final Dio dio = Dio();
  String token = '';

  Future<WelcomeCategory> getCategories() async {
    try {
      dio.options.headers['Authorization'] = "Bearer $token";
      final Response response = await dio.get(
        '${Urls.baseUrl}/mobile/categories?offset=0&limit=8',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return WelcomeCategory.fromJson(response.data);
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<CheckCategory> getListCategories() async {
    try {
      dio.options.headers['Authorization'] = "Bearer $token";
      final Response response = await dio.get(
        '${Urls.baseUrl}/mobile/courses/category/3?offset=0&limit=10',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return CheckCategory.fromJson(response.data);
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
