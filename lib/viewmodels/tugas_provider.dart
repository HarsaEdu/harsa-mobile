import 'package:flutter/material.dart';

class TugasProvider extends ChangeNotifier {
  bool _isFileSelected = false;
  String? _selectedFileName;

  bool get isFileSelected => _isFileSelected;
  String? get selectedFileName => _selectedFileName;

  void selectFile(String fileName) {
    _isFileSelected = true;
    _selectedFileName = fileName;
    notifyListeners();
  }

  void clearFile() {
    _isFileSelected = false;
    _selectedFileName = null;
    notifyListeners();
  }
}
