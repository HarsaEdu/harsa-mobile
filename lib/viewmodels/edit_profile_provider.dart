import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
  String gender = 'male';
  bool pickerVisible = false;

  final ScrollController scrollController = ScrollController();

  void genderSelector(String value) {
    gender = value;
    notifyListeners();
  }

  void pickImage() {
    if (pickerVisible) {
      pickerVisible = false;
    } else {
      pickerVisible = true;
    }
    notifyListeners();
  }
}
