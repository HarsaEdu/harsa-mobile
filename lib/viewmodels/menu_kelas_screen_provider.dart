import 'package:flutter/material.dart';

class MenuKelasProvider with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  String _filter = ''; // Menyimpan nilai filter

  String get filter => _filter;

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }
}
