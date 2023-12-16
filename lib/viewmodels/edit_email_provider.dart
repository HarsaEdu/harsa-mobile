import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/services/profile_service.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class EditEmailProvider with ChangeNotifier {
  late final GlobalKey<FormState> editEmailFormKey;
  late final TextEditingController emailController;

  late LoadingState loadingState;

  EditEmailProvider() {
    editEmailFormKey = GlobalKey();
    emailController = TextEditingController();
  }

  String? validateEmail(String? value) {
    if (value == null || value == "") return "*Email harus diisi";

    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return "*Pastikan alamat email anda benar";
    }

    return null;
  }

  void submitEditEmail(BuildContext context) async {
    if (!editEmailFormKey.currentState!.validate()) return;

    try {
      loadingState = LoadingState.loading;
      notifyListeners();

      final response =
          await ProfileService.updateEmail(email: emailController.text);

      debugPrint(response?.message);

      loadingState = LoadingState.success;
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      loadingState = LoadingState.failed;
    }

    notifyListeners();
  }
}
