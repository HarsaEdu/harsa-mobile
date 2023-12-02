import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/auth_models/auth_model.dart';
import 'package:harsa_mobile/services/auth_service.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPassController;

  LoadingState signupLoadingState = LoadingState.initial;

  late SharedPreferences preferences;
  AuthModel? authModel;

  String? validateUsername(String? value) {
    if (value == null || value == "") return "*Username harus diisi";
    if (value.length < 3) return "*Username minimal terdiri dari 3 karakter";

    return null;
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

  String? validatePassword(String? value) {
    if (value == null || value == "") return "*Password harus diisi";
    if (!RegExp(
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$",
    ).hasMatch(value)) {
      return "*Password harus 8 karakter, terdiri dari alphabet, numerc dan karakter";
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) return "*Password tidak cocok";

    return null;
  }

  void register(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      signupLoadingState = LoadingState.loading;
      notifyListeners();

      final result = await AuthService.register(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      authModel = result;

      if (authModel!.code == 201) {
        signupLoadingState = LoadingState.success;

        preferences = await SharedPreferences.getInstance();
        preferences.setBool(SPKey.isLogged, true);
        preferences.setInt(SPKey.id, result.data.id);
        preferences.setString(SPKey.username, result.data.username);
        preferences.setString(SPKey.roleName, result.data.roleName);
        preferences.setString(SPKey.accessToken, result.data.accessToken);
        preferences.setString(SPKey.refreshToken, result.data.refreshToken);

        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/signupdata');
        }
      } else {
        signupLoadingState = LoadingState.failed;
      }

      notifyListeners();
    } on DioException catch (e) {
      if (e.response!.statusCode == 409) {
        signupLoadingState = LoadingState.failed;
        notifyListeners();

        return;
      }
    } catch (_) {
      rethrow;
    }
  }

  SignupProvider() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
