import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/signup_provider.dart';
import 'package:harsa_mobile/viewmodels/signupdata_provider.dart';
import 'package:harsa_mobile/views/screens/signup_category_screen.dart';
import 'package:harsa_mobile/views/screens/signup_screen.dart';
import 'package:harsa_mobile/views/screens/signupdata_screen.dart';
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
        ChangeNotifierProvider(create: (_) => MainScreenProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => SignupDataProvider()),
        ChangeNotifierProvider(
          create: (context) => InboxProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            bodySmall: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF2A2D34),
            ),
            bodyMedium: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF2A2D34),
            ),
            bodyLarge: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF2A2D34),
            ),
            titleSmall: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2A2D34),
            ),
            titleMedium: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2A2D34),
            ),
            titleLarge: GoogleFonts.poppins(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2A2D34),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFFF2994A),
              textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              foregroundColor: Colors.white,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.all(0),
              textStyle: GoogleFonts.poppins(fontSize: 12),
              foregroundColor: const Color(0xFF2A2D34),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(width: 1),
            ),
          ),
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const MainScreen());
            case '/signup':
              return MaterialPageRoute(
                  builder: (context) => const SignupScreen());
            case '/signupdata':
              return MaterialPageRoute(
                  builder: (context) => const SignupDataScreen());
            case '/signupcategory':
              return MaterialPageRoute(
                  builder: (context) => const SignupCategoryScreen());
          }
          return null;
        },
      ),
    );
  }
}
