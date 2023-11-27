import 'package:flutter/material.dart';

class EditSandiProvider with ChangeNotifier {
  GlobalKey<FormState> editSandiFormKey = GlobalKey();

  TextEditingController? sandiLamaController;
  TextEditingController? sandiBaruController;
  TextEditingController? sandiConfirmController;

  bool isSandiLamaObscure = true;
  bool isSandiBaruObscure = true;
  bool isSandiConfirmObscure = true;

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

  void submitEditSandi() {}
}
