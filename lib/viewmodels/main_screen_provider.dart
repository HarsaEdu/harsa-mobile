import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  List<Widget> pageList = [];

  int pageIndex = 0;

  void bottomNaBar(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
