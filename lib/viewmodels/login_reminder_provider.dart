import 'package:flutter/material.dart';

class LoginReminderProvider extends ChangeNotifier {
  late BuildContext context;
  void goToLogin() {
    Navigator.pushNamed(
      context,
      '/login',
    );
  }
}
