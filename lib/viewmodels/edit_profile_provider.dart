import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
  String gender = 'male';
  bool pickerVisible = false;

  final ScrollController scrollController = ScrollController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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

  void datePicker() {}
}
