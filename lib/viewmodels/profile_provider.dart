// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/profile_models/profile_models.dart';
import 'package:harsa_mobile/services/profile_services.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/views/widgets/confirmation_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  late BuildContext context;

  UserProfileData? userProfileData;

  void getProfile() async {
    userProfileData = await ProfileServices.getUserProfile();
  }

  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    ConfirmationDialog.show(
      context,
      title: 'Are you sure?',
      content: 'Are you sure to Log Out?',
      onConfirm: () {
        sp.setBool(SPKey.isLogged, false);
        sp.setInt(SPKey.id, 0);
        sp.setString(SPKey.username, '');
        sp.setString(SPKey.roleName, '');
        sp.setString(SPKey.accessToken, '');
        sp.setString(SPKey.refreshToken, '');
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      },
      onCancel: () => Navigator.pop(context),
    );
  }
}
