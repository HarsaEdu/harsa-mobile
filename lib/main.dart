import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/inbox_provider.dart';
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
        ),
        ChangeNotifierProvider(
          create: (context) => InboxProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
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
