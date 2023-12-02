import 'package:flutter/material.dart';
import '../models/bank.dart';

class BankDataProvider with ChangeNotifier {
  Bank? _selectedBank;
  Bank? get selectedBank => _selectedBank;
  List<Bank> get bankData => _bankData;

  int? _selectedBankIndex;

  // Getter dan setter untuk selectedBankIndex
  int? get selectedBankIndex => _selectedBankIndex;
  set selectedBankIndex(int? index) {
    _selectedBankIndex = index;
    notifyListeners();
  }

  void selectBank(Bank bank) {
    _selectedBank = bank;
    selectedBankIndex = _bankData.indexOf(bank);
    notifyListeners();
  }

  final List<Bank> _bankData = [
    Bank(
        name: 'BCA',
        accountType: 'BCA Virtual Account',
        accountNumber: '880123456789',
        imagePath: 'assets/images/bca_logo.png'),
    Bank(
        name: 'Mandiri',
        accountType: 'Mandiri Virtual Account',
        accountNumber: '881234567890',
        imagePath: 'assets/images/mandiri_logo.png'),
    Bank(
        name: 'BRI',
        accountType: 'BRI Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/bri_logo.png'),
    Bank(
        name: 'BNI',
        accountType: 'BNI Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/bni_logo.png'),
    Bank(
        name: 'CIMB Niaga',
        accountType: 'CIMB Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/cimb_niaga_logo.png'),
    Bank(
        name: 'BTN',
        accountType: 'BTN Virtual Account',
        accountNumber: '882345678901',
        imagePath: 'assets/images/btn_logo.png'),
  ];
}
