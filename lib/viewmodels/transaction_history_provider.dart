import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/transaction_history.dart';

final List<Map<String, Object>> myData = [
  {
    'id': 1,
    'title': 'UI/UX: Becoming Professional',
    'price': 'Rp. 530.000,00',
    'status': 'Berhasil',
  },
  {
    'id': 2,
    'title': 'Front-End: Becoming Professional',
    'price': 'Rp. 560.000,00',
    'status': 'Dibatalkan',
  },
  {
    'id': 3,
    'title': 'Back-End: Becoming Professional',
    'price': 'Rp. 210.000,00',
    'status': 'Menunggu Pembayaran',
  },
  {
    'id': 4,
    'title': 'Flutter: Becoming Professional',
    'price': 'Rp. 780.000,00',
    'status': 'Berhasil',
  },
  {
    'id': 5,
    'title': 'QE: Becoming Professional',
    'price': 'Rp. 530.000,00',
    'status': 'Berhasil',
  }
];

List<TransactionHistory> getTransactionHistoryList() {
  return myData.map((json) => TransactionHistory.fromJson(json)).toList();
}

class TransactionHistoryProvider with ChangeNotifier {
  TransactionHistoryProvider() {
    focusNode.addListener(notifyListeners);
  }

  final List<TransactionHistory> data = getTransactionHistoryList();
  FocusNode focusNode = FocusNode();
  List<TransactionHistory> filteredData = getTransactionHistoryList();
  String searchQuery = '';

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
        return transactionHistory.title
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
