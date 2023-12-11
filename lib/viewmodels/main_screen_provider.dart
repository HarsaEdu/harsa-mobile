import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/views/screens/aichatbot_screen/aichatbot_screen.dart';
import 'package:harsa_mobile/views/screens/home_screen/home_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/menu_kelas_screen.dart';
import 'package:harsa_mobile/views/screens/login_reminder_screen/login_reminder_screen.dart';
import 'package:harsa_mobile/views/screens/profile_screen/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/views/screens/notification_screen/notification_screen.dart';

class MainScreenProvider extends ChangeNotifier {
  bool isLogged = false;

  bool canPop = false;

  List<Widget> pageList = [
    const HomeScreen(),
    const LoginReminderScreen(),
    const LoginReminderScreen(),
    const LoginReminderScreen(),
    const LoginReminderScreen(),
  ];

  int pageIndex = 0;

  MainScreenProvider() {
    checkPreference();
  }

  void bottomNaBar(int index) {
    canPop = false;
    pageIndex = index;
    debugPrint(pageIndex.toString());

    notifyListeners();
  }

  void onBack(bool didPop) {
    if (pageIndex != 0) {
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
      isLogged = false;
      pageList = [
        const HomeScreen(),
        const LoginReminderScreen(),
        const LoginReminderScreen(),
        const LoginReminderScreen(),
        const LoginReminderScreen(),
      ];
    } else {
      isLogged = true;
      pageList = [
        const HomeScreen(),
        const MenuKelasScreen(),
        const AIChatbotScreen(),
        const NotificationScreen(),
        const ProfileScreen(),
      ];
    }
    notifyListeners();
  }
}
