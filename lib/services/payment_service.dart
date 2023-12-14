import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/payment_models/payment_model.dart';
import '../utils/constants/urls.dart';

class PaymentService {
  final Dio _dio = Dio();
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjcmVhdGVkX2F0IjoiMjAyMy0xMS0yNFQxNDozMzoxOS4wNDhaIiwiZW1haWwiOiJ0ZXN0c3R1ZGVudEBnbWFpbC5jb20iLCJleHAiOjE3MDIyNDQzOTksImlkIjoyLCJyb2xlX25hbWUiOiJzdHVkZW50IiwidXNlcm5hbWUiOiJ0dWRlbnQgbWFudHVsIn0.TsxUo-DDSRb9T8rzCYURnr5xhL-KVfRlAhnAu0X2R_c';

  Future<Payment?> createPayment(int planId, String bankName) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final Response<dynamic> response = await _dio.post(
        '${Urls.baseUrl}${Urls.platformUrl}/payments/subscriptions',
        data: {
          'plan_id': planId,
          'bank_name': bankName,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        return Payment.fromJson(response.data['data']);
      }
      return null;
    } on DioException catch (e) {
      debugPrint('Error in createPayment: ${e.message}');
      throw Exception(e.message);
    }
  }

  static Future<Payment?> getAllPayment(int offset, int limit) async {
    try {
      final Response<dynamic> response = await Dio().get(
          '${Urls.baseUrl}${Urls.platformUrl}/payments?offset=$offset&limit=$limit');
      if (response.statusCode == 200) {
        return Payment.fromJson(response.data['data']);
      }
      return null;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Payment?> getPaymentById(String id) async {
    try {
      final Response<dynamic> response =
          await Dio().get('${Urls.baseUrl}${Urls.platformUrl}/payments/$id');
      if (response.statusCode == 200) {
        return Payment.fromJson(response.data['data']);
      }
      return null;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
