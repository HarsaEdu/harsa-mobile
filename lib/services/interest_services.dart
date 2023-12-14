import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/user_interest/create_user_interest.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInterestService {
  final Dio _dio = Dio();
  String? token;

  Future<void> setToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString(SPKey.accessToken);
  }

  Future<CreateUserInterest?> createInterest(List<int> categoryIds) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final Response<dynamic> response = await _dio.post(
        '${Urls.baseUrl}${Urls.platformUrl}users/interest',
        data: {
          'category_id': categoryIds,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        return CreateUserInterest.fromJson(response.data['data']);
      }
      return null;
    } catch (e) {
      debugPrint('Error in CreateCategory: $e');
      throw Exception(e);
    }
  }
}
