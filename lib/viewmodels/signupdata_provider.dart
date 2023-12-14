import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harsa_mobile/services/profile_service.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/views/widgets/confirmation_dialog.dart';
import 'package:intl/intl.dart';

class SignupDataProvider with ChangeNotifier {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController firstnameController;
  late final TextEditingController lastnameController;
  late final TextEditingController dateofbirthController;
  late final TextEditingController phoneController;
  late Object genderValue;

  LoadingState loadingState = LoadingState.initial;

  SignupDataProvider() {
    formKey = GlobalKey();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    dateofbirthController = TextEditingController();
    phoneController = TextEditingController();
    genderValue = "m";
  }

  String? validateFirstName(String? value) {
    if (value == "" || value == null) return "*Nama depan harus diisi";
    return null;
  }

  String? validateLastName(String? value) {
    if (value == "" || value == null) return "*Nama belakang harus diisi";
    return null;
  }

  String? validateDate(String? value) {
    if (value == "" || value == null) return "*Tanggal Lahir harus diisi";
    return null;
  }

  String? validatePhone(String? value) {
    if (value == "" || value == null) return "*Nomor telepon harus diisi";
    return null;
  }

  void selectGender(Object value) {
    genderValue = value;
    notifyListeners();
  }

  void postProfileData(BuildContext context) async {
    loadingState = LoadingState.loading;
    notifyListeners();

    try {
      await ProfileService.createProfile(
        firstName: firstnameController.text,
        lastName: lastnameController.text,
        phone: phoneController.text,
        gender: genderValue.toString(),
        dob: dob!,
      );

      if (context.mounted) {
        Navigator.pushNamed(context, "/signupcategory");
        loadingState = LoadingState.success;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 499) {
        loadingState = LoadingState.failed;
      }
    }

    notifyListeners();
  }

  void submitProfileData(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      await ConfirmationDialog.show(
        context,
        title: "Simpan data diri?",
        content: "",
        onConfirm: loadingState == LoadingState.loading
            ? () {}
            : () {
                postProfileData(context);
              },
        onCancel: () => Navigator.pop(context),
      );
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 499) {
        loadingState = LoadingState.failed;
      }
    } catch (_) {
      rethrow;
    }
  }

  String? dob;

  void selectDate(BuildContext context) async {
    DateTime? newDob = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.amber,
            splashColor: Colors.green,
            colorScheme: const ColorScheme.light(
              primary: ColorsPallete.sandyBrown,
            ),
            buttonTheme: const ButtonThemeData(
              buttonColor: Colors.red,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDob != null) {
      String formattedNewDob =
          DateFormat("yyyy-MM-ddTHH:mm:ss'Z'").format(newDob);
      dob = formattedNewDob;
      dateofbirthController
        ..text = DateFormat("d/M/yyyy").format(newDob)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: dateofbirthController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
    notifyListeners();
  }
}
