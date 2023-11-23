import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/detail_kelas_provider.dart';
import 'package:harsa_mobile/viewmodels/materiview_provider.dart';
import 'package:harsa_mobile/views/screens/InterestScreen/InterestScreen/interest_category_screen.dart';
import 'package:harsa_mobile/views/screens/Profile_screen/profile_berlanganan_screen.dart';
import 'package:harsa_mobile/views/screens/Profile_screen/profile_screen.dart';
import 'package:harsa_mobile/views/screens/category_screen/category_screen.dart';
import 'package:harsa_mobile/views/screens/certificate_screen/certificate_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/detail_kelas_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/materiview_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/video_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harsa_mobile/viewmodels/faq_screen_provider.dart';
import 'package:harsa_mobile/viewmodels/home_screen_provider.dart';
import 'package:harsa_mobile/viewmodels/inbox_provider.dart';
import 'package:harsa_mobile/viewmodels/intereset_provider.dart';
import 'package:harsa_mobile/viewmodels/login_provider.dart';
import 'package:harsa_mobile/viewmodels/main_screen_provider.dart';
import 'package:harsa_mobile/viewmodels/onboarding_viewmodel.dart';
import 'package:harsa_mobile/viewmodels/signup_provider.dart';
import 'package:harsa_mobile/viewmodels/signupdata_provider.dart';
import 'package:harsa_mobile/viewmodels/splash_viewmodel.dart';
import 'package:harsa_mobile/views/screens/faq_screen/faq_screen.dart';
import 'package:harsa_mobile/views/screens/login_screen/login_screen.dart';
import 'package:harsa_mobile/views/screens/main_screen/main_screen.dart';
import 'package:harsa_mobile/views/screens/notification_screen/notification_screen.dart';
import 'package:harsa_mobile/views/screens/onboarding_screen/onboarding_screen.dart';
import 'package:harsa_mobile/views/screens/signup_screen/signup_screen.dart';
import 'package:harsa_mobile/views/screens/signup_screen/signupdata_screen.dart';
import 'package:harsa_mobile/views/screens/splash_screen/splash_screen.dart';

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
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => MainScreenProvider()),
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => InboxProvider()),
        ChangeNotifierProvider(create: (_) => SignupDataProvider()),
        ChangeNotifierProvider(create: (_) => FaqScreenProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => DetailKelasProvider()),
        ChangeNotifierProvider(create: (_) => MateriViewProvider()),
        ChangeNotifierProvider(create: (_) => CategoryScreenProvider()),
        ChangeNotifierProvider(create: (_) => CertificateProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
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
            case '/signup':
              return MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              );
            case '/signupdata':
              return MaterialPageRoute(
                builder: (context) => const SignupDataScreen(),
              );
            case '/signupcategory':
              return MaterialPageRoute(
                builder: (context) => const InterestCategoryScreen(),
              );
            case '/login':
              return MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              );
            case '/notification':
              return MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              );
            case '/faq':
              return MaterialPageRoute(
                builder: (context) => const FaqScreen(),
              );
            case '/kelas':
              return MaterialPageRoute(
                builder: (context) => const DetailKelasScreen(),
              );
            case '/Profile':
              return MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              );
            case '/ProfileBerlanganan':
              return MaterialPageRoute(
                builder: (context) => const ProfileBerlanganan(),
              );
            case '/video':
              return MaterialPageRoute(
                builder: (context) => const VideoScreen(),
              );
            case '/materi':
              return MaterialPageRoute(
                builder: (context) => const MateriViewScreen(),
            case '/category':
              return MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
            case '/sertifikat':
              return MaterialPageRoute(
                builder: (context) => const CertificateScreen(),
              );
          }
          return null;
        },
      ),
    );
  }
}
