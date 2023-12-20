import 'package:flutter/material.dart';
import '../models/payment_models/bank.dart';

class BankProvider with ChangeNotifier {
  final List<Bank> _bankData = [
    Bank(
        name: 'bca',
        accountType: 'BCA Virtual Account',
        accountNumber: '880123456789',
        imagePath: 'assets/images/bca_logo.png'),
    Bank(
        name: 'bri',
        accountType: 'BRI Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/bri_logo.png'),
    Bank(
        name: 'mandiri',
        accountType: 'Mandiri Virtual Account',
        accountNumber: '881234567890',
        imagePath: 'assets/images/mandiri_logo.png'),
    Bank(
        name: 'bni',
        accountType: 'BNI Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/bni_logo.png'),
    Bank(
        name: 'cimb',
        accountType: 'CIMB Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/cimb_niaga_logo.png'),
    Bank(
        name: 'btn',
        accountType: 'BTN Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/btn_logo.png'),
  ];

  int? _selectedBankIndex = 0;

  // Inisialisasi _selectedBank dengan bank default
  BankProvider() {
    _selectedBank = _bankData[_selectedBankIndex!];
  }

  // Getter untuk bank terpilih dan data bank
  Bank? get selectedBank => _selectedBank;
  List<Bank> get bankData => _bankData;

  // Getter dan setter untuk selectedBankIndex
  int? get selectedBankIndex => _selectedBankIndex;
  set selectedBankIndex(int? index) {
    _selectedBankIndex = index;
    notifyListeners();
  }

  void selectBank(Bank bank) {
    _selectedBank = bank;
    selectedBankIndex = _bankData.indexOf(bank);
    debugPrint('=> ${_selectedBank!.name}');
    notifyListeners();
  }

  Bank? _selectedBank;
}
