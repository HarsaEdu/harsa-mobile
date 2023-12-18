import 'package:flutter/material.dart';

class TugasProvider extends ChangeNotifier {
  bool _isFileSelected = false;
  String? _selectedFilePath; 

  bool get isFileSelected => _isFileSelected;
  String? get selectedFilePath => _selectedFilePath;

  void selectFile(String filePath) {
    _isFileSelected = true;
    _selectedFilePath = filePath;
    notifyListeners();
  }

  void clearFile() {
    _isFileSelected = false;
    _selectedFilePath = null;
    notifyListeners();
  }
}

