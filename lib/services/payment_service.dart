import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/payment_models/payment_model.dart';
import '../utils/constants/shared_preferences_key.dart';
import '../utils/constants/urls.dart';

class PaymentService {
  final Dio _dio = Dio();
  String? token;

  Future<void> setToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString(SPKey.accessToken);
  }

  Future<Payment?> createPayment(int planId, String bankName) async {
    await setToken();
    debugPrint('=> token : ${token.toString()}');
    if (token != null) {
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
          debugPrint('=> ${response.data['data']}');
          return Payment.fromJson(response.data['data']);
        }
        return null;
      } on DioException catch (e) {
        debugPrint('Error in createPayment: ${e.message}');
        throw Exception(e.message);
      }
    }
    return null;
  }

  Future<List<Payment>> getAllPayment(int offset, int limit) async {
    await setToken();
    if (token != null) {
      try {
        _dio.options.headers['Authorization'] = 'Bearer $token';
        final Response<dynamic> response = await _dio.get(
            '${Urls.baseUrl}${Urls.platformUrl}/payments?offset=$offset&limit=$limit');
        if (response.statusCode == 200) {
          List<dynamic> paymentList = response.data['data'];
          return paymentList.map((data) => Payment.fromJson(data)).toList();
        }
        throw Exception('Failed to fetch payment data');
      } on DioException catch (e) {
        throw Exception(e.message);
      }
    }
    throw Exception('Token is null');
  }

  Future<Payment?> getPaymentById(String id) async {
    await setToken();
    if (token != null) {
      try {
        _dio.options.headers['Authorization'] = 'Bearer $token';
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
    return null;
  }
}
