import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/payment_models/payment_model.dart';
import 'package:harsa_mobile/services/payment_service.dart';

class TransactionHistoryProvider with ChangeNotifier {
  TransactionHistoryProvider() {
    focusNode.addListener(notifyListeners);
    getAllPayment();
  }

  List<Payment> data = [];
  FocusNode focusNode = FocusNode();
  List<Payment> filteredData = [];
  String searchQuery = '';

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'berhasil':
        return const Color(0x7F78EC7D);
      case 'dibatalkan':
        return const Color(0x7FED7878);
      case 'menunggu pembayaran':
        return const Color(0x7FEFEA75);
      default:
        return Colors.white;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'berhasil':
        return const Color(0xFF159B1A);
      case 'dibatalkan':
        return const Color(0xFFDB1D1D);
      case 'menunggu pembayaran':
        return const Color(0xFF918B00);
      default:
        return Colors.white;
    }
  }

  Future<void> getAllPayment() async {
    try {
      final List<Payment> transaction =
          await PaymentService().getAllPayment(0, 10);
      data = transaction;
      filteredData = transaction;
      notifyListeners();
    } catch (e) {
      throw Exception("Error fetching transaction history: $e");
    }
  }

  void filterByStatus(String status) {
    filteredData = data.where((transactionHistory) {
      return transactionHistory.status.toLowerCase() == status.toLowerCase();
    }).toList();
    notifyListeners();
  }

  void searchTransactionHistory(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      filteredData = data;
    } else {
      filteredData = data.where((transactionHistory) {
        return transactionHistory.item.name
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
