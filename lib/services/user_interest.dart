import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/user_interest/create_user_interest.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';

class UserInterestService {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjcmVhdGVkX2F0IjoiMjAyMy0xMS0yNFQxNDozMzoxOS4wNDhaIiwiZW1haWwiOiJ0ZXN0c3R1ZGVudEBnbWFpbC5jb20iLCJleHAiOjE3MDI1NjgwNDAsImlkIjoyLCJyb2xlX25hbWUiOiJzdHVkZW50IiwidXNlcm5hbWUiOiJ0dWRlbnQgbWFudHVsIn0.fQo8yh31CsMVG3EBR32fCZSI0BR8mQgnfUHl6WNcZXU';
  final Dio _dio = Dio();

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
