import 'package:flutter/material.dart';
import 'package:harsa_mobile/services/payment_service.dart';
import '../models/payment_models/payment_model.dart';

class PaymentProvider with ChangeNotifier {
  Payment? _payment;

  Payment? get payment => _payment;

  Future<void> getPaymentData(int planId, String bankName) async {
    try {
      final Payment? newPayment = await PaymentService.createPayment(planId, bankName);

      if (newPayment != null) {
        _payment = newPayment;
        notifyListeners();
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}