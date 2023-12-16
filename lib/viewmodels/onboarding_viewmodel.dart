import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/onboarding_content.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  late final PageController _pageController = PageController();
  int _currentPage = 0;
  List<OnboardingContent> contents = onboardingContents;

  double getProgress() {
    if (_currentPage == 0) {
      return 0.34;
    } else if (_currentPage == 1) {
      return 0.66;
    } else {
      return 1.0;
    }
  }

  PageController get pageController => _pageController;

  int get currentPage => _currentPage;

  void onPageChanged(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (_currentPage < contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      setLogStatus();
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  void setLogStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(SPKey.isNew, false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
