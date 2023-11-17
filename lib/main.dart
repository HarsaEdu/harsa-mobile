import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harsa_mobile/views/screens/splash_screen/splash_screen.dart';
import 'package:harsa_mobile/views/screens/onboarding_screen/onboarding_screen.dart';
import 'package:harsa_mobile/views/screens/main_screen/main_screen.dart';
import 'package:harsa_mobile/viewmodels/splash_viewmodel.dart';
import 'package:harsa_mobile/viewmodels/onboarding_viewmodel.dart';
import 'package:harsa_mobile/viewmodels/main_screen_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => OnboardingProvider()),
        ChangeNotifierProvider(create: (context) => MainScreenProvider()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/', // Atur rute halaman disini
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              );
            case '/onboarding':
              return MaterialPageRoute(
                builder: (context) => const OnboardingScreen(),
              );
            case '/main':
              return MaterialPageRoute(
                builder: (context) => const MainScreen(),
              );
          }
          return null;
        },
      ),
    );
  }
}
