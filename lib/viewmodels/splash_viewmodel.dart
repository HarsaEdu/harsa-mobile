import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:harsa_mobile/views/screens/onboarding_screen/onboarding_screen.dart';

class SplashProvider extends ChangeNotifier {
  void initSplash(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
