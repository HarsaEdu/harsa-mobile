import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/services/profile_service.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';

class EditSandiProvider with ChangeNotifier {
  late final GlobalKey<FormState> editSandiFormKey;

  late final TextEditingController sandiLamaController;
  late final TextEditingController sandiBaruController;
  late final TextEditingController sandiConfirmController;

  late LoadingState loadingState;

  bool isSandiLamaObscure = true;
  bool isSandiBaruObscure = true;
  bool isSandiConfirmObscure = true;

  EditSandiProvider() {
    editSandiFormKey = GlobalKey();
    sandiLamaController = TextEditingController();
    sandiBaruController = TextEditingController();
    sandiConfirmController = TextEditingController();
  }

  void toggleObscure(String where) {
    if (where == "lama") {
      isSandiLamaObscure = !isSandiLamaObscure;
    } else if (where == "baru") {
      isSandiBaruObscure = !isSandiBaruObscure;
    } else {
      isSandiConfirmObscure = !isSandiConfirmObscure;
    }
    notifyListeners();
  }

  String? validateOldPassword(String? value) {
    if (value == null || value == "") return "*Password harus diisi";

    return null;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value == "") return "*Password harus diisi";
    if (!RegExp(
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$",
    ).hasMatch(value)) {
      return "*Password harus 8 karakter, terdiri dari alphabet, numerc dan karakter";
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != sandiBaruController.text) return "*Password tidak cocok";

    return null;
  }

  void submitEditSandi(BuildContext context) async {
    if (!editSandiFormKey.currentState!.validate()) return;

    try {
      loadingState = LoadingState.loading;
      notifyListeners();

      final response = await ProfileService.updateSandi(
        oldPass: sandiLamaController.text,
        newPass: sandiBaruController.text,
      );

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
