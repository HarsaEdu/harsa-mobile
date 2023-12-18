import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/payment_models/payment_card.dart';

class PaymentCardProvider with ChangeNotifier {
  PaymentCard? _selectedPaymentCard;
  PaymentCard? get selectedPaymentCard => _selectedPaymentCard;
  List<PaymentCard> get paymentCardData => _paymentCardData;

  int? _selectedPaymentCardIndex;

  // Getter dan setter untuk selectedPaymentCardIndex
  int? get selectedPaymentCardIndex => _selectedPaymentCardIndex;
  set selectedPaymentCardIndex(int? index) {
    _selectedPaymentCardIndex = index;
    notifyListeners();
  }

  void selectPaymentCard(PaymentCard paymentCard) {
    _selectedPaymentCard = paymentCard;
    selectedPaymentCardIndex = _paymentCardData.indexOf(paymentCard);
    notifyListeners();
  }

  final List<PaymentCard> _paymentCardData = [
    PaymentCard(
        name: 'BCA',
        accountType: 'BCA Virtual Account',
        accountNumber: '880123456789',
        imagePath: 'assets/images/creditcard.fill.png'),
  ];
}
