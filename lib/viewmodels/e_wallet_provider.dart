import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/e_wallet.dart';

class EWalletProvider with ChangeNotifier {
  final List<EWallet> _eWalletData = [
    EWallet(
        name: 'Gopay',
        accountType: 'Gopay',
        accountNumber: '880123456789',
        imagePath: 'assets/images/gopay_logo.png'),
    EWallet(
        name: 'Jenius',
        accountType: 'Jenius',
        accountNumber: '881234567890',
        imagePath: 'assets/images/jenius_logo.png'),
    EWallet(
        name: 'Dana',
        accountType: 'Dana',
        accountNumber: '882345678901',
        imagePath: 'assets/images/dana_logo.png'),
    EWallet(
        name: 'OVO',
        accountType: 'OVO',
        accountNumber: '882345678901',
        imagePath: 'assets/images/ovo_logo.png'),
  ];

  EWallet? _selectedEWallet;
  EWallet? get selectedEWallet => _selectedEWallet;
  List<EWallet> get eWalletData => _eWalletData;

  int? _selectedEWalletIndex;

  // Getter dan setter untuk selectedEWalletIndex
  int? get selectedEWalletIndex => _selectedEWalletIndex;
  set selectedEWalletIndex(int? index) {
    _selectedEWalletIndex = index;
    notifyListeners();
  }

  void selectEWallet(EWallet ewallet) {
    _selectedEWallet = ewallet;
    selectedEWalletIndex = _eWalletData.indexOf(ewallet);
    notifyListeners();
  }
}
