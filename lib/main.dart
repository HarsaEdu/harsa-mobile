import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/home_screen_provider.dart';
import 'package:harsa_mobile/views/screens/home_screen/home_screen.dart';
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
          create: (context) => HomeScreenProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
          }
          return null;
        },
      ),
    );
  }
}
