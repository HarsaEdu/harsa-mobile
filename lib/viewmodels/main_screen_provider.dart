import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/views/screens/aichatbot_screen/aichatbot_screen.dart';
import 'package:harsa_mobile/views/screens/home_screen/home_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/menu_kelas_screen.dart';
import 'package:harsa_mobile/views/screens/login_reminder_screen/login_reminder_screen.dart';
import 'package:harsa_mobile/views/screens/profile_screen/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:harsa_mobile/models/auth_models/auth_model.dart';
import 'package:harsa_mobile/services/auth_service.dart';
import '/views/screens/notification_screen/notification_screen.dart';

class MainScreenProvider extends ChangeNotifier {
  bool canPop = false;

  List<Widget> pageList = [
    const HomeScreen(),
    const LoginReminderScreen(),
    const LoginReminderScreen(),
    const LoginReminderScreen(),
    const LoginReminderScreen(),
  ];

  int pageIndex = 0;

  void bottomNaBar(int index) {
    canPop = false;
    pageIndex = index;
    debugPrint(pageIndex.toString());

    notifyListeners();
  }

  void onBack(bool didPop) {
    if (pageIndex != 0 && pageIndex != 2) {
      pageIndex = 0;
      canPop = true;
    } else {
      canPop = true;
    }
    notifyListeners();
  }

  void checkPreference() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (sp.getBool(SPKey.isLogged) == null ||
        sp.getBool(SPKey.isLogged) == false) {
      pageIndex = 0;
      pageList = [
        const HomeScreen(),
        const LoginReminderScreen(),
        const LoginReminderScreen(),
        const LoginReminderScreen(),
        const LoginReminderScreen(),
      ];
    } else {
      pageIndex = 0;
      if (await refreshToken()) {
        pageList = [
          const HomeScreen(),
          const MenuKelasScreen(),
          const AIChatbotScreen(),
          const NotificationScreen(),
          const ProfileScreen(),
        ];
      } else {
        sp.setBool(SPKey.isLogged, false);
        sp.setInt(SPKey.id, 0);
        sp.setString(SPKey.username, '');
        sp.setString(SPKey.roleName, '');
        sp.setString(SPKey.accessToken, '');
        sp.setString(SPKey.refreshToken, '');
      }
    }
    notifyListeners();
  }

  Future<bool> refreshToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    AuthModel? result = await AuthService.refreshToken(
        refreshToken: sp.getString(SPKey.refreshToken)!);

    if (result != null) {
      sp.setBool(SPKey.isLogged, true);
      sp.setInt(SPKey.id, result.data.id);
      sp.setString(SPKey.username, result.data.username);
      sp.setString(SPKey.roleName, result.data.roleName);
      sp.setString(SPKey.accessToken, result.data.accessToken);
      sp.setString(SPKey.refreshToken, result.data.refreshToken);
      return true;
    }
    return false;
  }
}
