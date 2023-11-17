import 'package:flutter/material.dart';

class SignupDataProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController dateofbirthController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final List<String> gender = ['Laki-Laki', 'Perempuan'];
  late String genderValue = gender.first;

  void selectGender(String value) {
    genderValue = value;
    notifyListeners();
  }
}
