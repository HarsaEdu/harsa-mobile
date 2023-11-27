import 'package:flutter/material.dart';

class EditEmailProvider with ChangeNotifier {
  GlobalKey<FormState> editEmailFormKey = GlobalKey();

  TextEditingController? emailController;

  void submitEditEmail() {}
}
