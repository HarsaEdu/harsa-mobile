import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/main_screen_provider.dart';
import 'package:harsa_mobile/views/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainScreenProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const MainScreen());
          }
          return null;
        },
      ),
    );
  }
}
