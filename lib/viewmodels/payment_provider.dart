import 'package:flutter/material.dart';
import 'package:harsa_mobile/services/payment_service.dart';
import '../models/payment_models/payment_model.dart';

class PaymentProvider with ChangeNotifier {
  Payment? _payment;

  Payment? get payment => _payment;

  Future<void> getPaymentData(int planId, String bankName) async {
    try {
      final Payment? payment =
          await PaymentService().createPayment(planId, bankName);

      if (payment != null) {
        _payment = payment;
        notifyListeners();
      } else {
        debugPrint('=> New payment data is null');
      }
    } catch (e, stackTrace) {
      debugPrint('=> Error in getPaymentData: $e');
      debugPrint('=> Stack trace: $stackTrace');
      throw Exception('=> Error in getPaymentData: $e');
    }
  }
}
