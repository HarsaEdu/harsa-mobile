import 'package:flutter/material.dart';
import '/views/screens/notification_screen/notification_screen.dart';

class MainScreenProvider extends ChangeNotifier {
  List<Widget> pageList = [
    const NotificationScreen(),
  ];

  int pageIndex = 0;

  void bottomNaBar(int index) {
    pageIndex = index;
    debugPrint(pageIndex.toString());
    notifyListeners();
  }
}
