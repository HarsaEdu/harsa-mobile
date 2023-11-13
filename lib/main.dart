import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/login_provider.dart';
import 'package:harsa_mobile/views/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
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
              fontWeight: FontWeight.w500,
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
              backgroundColor: const Color(0xFFCCCDCE),
              textStyle: GoogleFonts.poppins(),
              foregroundColor: const Color(0xFF2A2D34),
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
              side: const BorderSide(width: 2),
            ),
          ),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => const LoginScreen(),
        },
      ),
    );
  }
}
