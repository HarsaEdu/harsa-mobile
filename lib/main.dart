import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/category_screen_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/login_provider.dart';
import 'package:harsa_mobile/views/screens/login_screen.dart';
import 'package:harsa_mobile/viewmodels/intereset_provider.dart';
import 'package:harsa_mobile/viewmodels/signup_provider.dart';
import 'package:harsa_mobile/views/screens/main_screen/InterestScreen/interest_category_screen.dart';
import 'package:harsa_mobile/viewmodels/signupdata_provider.dart';
import 'package:harsa_mobile/views/screens/signup_screen.dart';
import 'package:harsa_mobile/views/screens/signupdata_screen.dart';
import 'package:harsa_mobile/viewmodels/inbox_provider.dart';
import 'package:harsa_mobile/viewmodels/main_screen_provider.dart';
import 'package:harsa_mobile/views/screens/category_screen/category_screen.dart';
import 'package:harsa_mobile/views/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:harsa_mobile/views/screens/faq_screen/faq_screen.dart';
import 'package:harsa_mobile/views/screens/notification_screen/notification_screen.dart';
import 'package:harsa_mobile/viewmodels/faq_screen_provider.dart';

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
        ChangeNotifierProvider(create: (_) => CategoryScreenProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => InboxProvider()),
        ChangeNotifierProvider(create: (_) => SignupDataProvider()),
        ChangeNotifierProvider(create: (_) => InboxProvider()),
        ChangeNotifierProvider(create: (_) => FaqScreenProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
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
                  builder: (context) => const CategoryScreen());
            case '/category':
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
                  builder: (context) => const InterestCategoryScreen());
            case '/login':
              return MaterialPageRoute(
                  builder: (context) => const LoginScreen());
            case '/notification':
              return MaterialPageRoute(
                  builder: (context) => const NotificationScreen());
            case '/faq':
              return MaterialPageRoute(builder: (context) => const FaqScreen());
          }
          return null;
        },
      ),
    );
  }
}
