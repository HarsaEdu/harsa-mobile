import 'package:dio/dio.dart';
import '../models/payment_models/payment_model.dart';
import '../utils/constants/urls.dart';

abstract class PaymentService {
  static Future<Payment?> createPayment(int planId, String bankName) async {
    try {
      final Response<dynamic> response = await Dio().post(
        '${Urls.baseUrl}${Urls.platformUrl}/payments/subscriptions',
        data: {
          'plan_id': planId,
          'bank_name': bankName,
        },
      );

      if (response.statusCode == 201) {
        return Payment.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Payment?> getAllPayment(int offset, int limit) async {
    try {
      final Response<dynamic> response = await Dio().get(
          '${Urls.baseUrl}${Urls.platformUrl}/payments?offset=$offset&limit=$limit');
      if (response.statusCode == 200) {
        return Payment.fromJson(response.data);
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
        return Payment.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
