import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
