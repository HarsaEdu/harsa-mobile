import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/kartu_kredit.dart';

class KartuKreditProvider with ChangeNotifier {
  KartuKredit? _selectedKartuKredit;
  KartuKredit? get selectedKartuKredit => _selectedKartuKredit;
  List<KartuKredit> get kartuKreditData => _kartuKreditData;

  int? _selectedKartuKreditIndex;

  // Getter dan setter untuk selectedKartuKreditIndex
  int? get selectedKartuKreditIndex => _selectedKartuKreditIndex;
  set selectedKartuKreditIndex(int? index) {
    _selectedKartuKreditIndex = index;
    notifyListeners();
  }

  void selectKartuKredit(KartuKredit kartuKredit) {
    _selectedKartuKredit = kartuKredit;
    selectedKartuKreditIndex = _kartuKreditData.indexOf(kartuKredit);
    notifyListeners();
  }

  final List<KartuKredit> _kartuKreditData = [
    KartuKredit(
        accountType: 'BCA Virtual Account',
        accountNumber: '880123456789',
        imagePath: 'assets/icons/filled/creditcard.fill.svg'),
  ];
}
