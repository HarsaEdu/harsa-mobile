import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/viewmodels/aichatbot_provider.dart';
import 'package:harsa_mobile/viewmodels/bank_provider.dart';
import 'package:harsa_mobile/viewmodels/category_screen_provider.dart';
import 'package:harsa_mobile/viewmodels/certificate_provider.dart';
import 'package:harsa_mobile/viewmodels/class_followed_provider.dart';
import 'package:harsa_mobile/viewmodels/detail_kelas_provider.dart';
import 'package:harsa_mobile/viewmodels/e_wallet_provider.dart';
import 'package:harsa_mobile/viewmodels/edit_email_provider.dart';
import 'package:harsa_mobile/viewmodels/edit_profile_provider.dart';
import 'package:harsa_mobile/viewmodels/edit_sandi_provider.dart';
import 'package:harsa_mobile/viewmodels/login_reminder_provider.dart';
import 'package:harsa_mobile/viewmodels/payment_card_provider.dart';
import 'package:harsa_mobile/viewmodels/payment_provider.dart';
import 'package:harsa_mobile/viewmodels/profile_provider.dart';
import 'package:harsa_mobile/viewmodels/quiz_provider.dart';
import 'package:harsa_mobile/viewmodels/transaction_history_provider.dart';
import 'package:harsa_mobile/viewmodels/recommendation_screen_provider.dart';
import 'package:harsa_mobile/viewmodels/subscription_plan_list_provider.dart';
import 'package:harsa_mobile/viewmodels/ulasan_screen_provider.dart';
import 'package:harsa_mobile/views/screens/detail_subscription/detail_subscription.dart';
import 'package:harsa_mobile/views/screens/edit_screen/edit_email_screen.dart';
import 'package:harsa_mobile/views/screens/edit_screen/edit_sandi_screen.dart';
import 'package:harsa_mobile/viewmodels/menu_kelas_screen_provider.dart';
import 'package:harsa_mobile/viewmodels/tugas_provider.dart';
import 'package:harsa_mobile/views/screens/class_followed_screen/class_followed_screen.dart';
import 'package:harsa_mobile/views/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:harsa_mobile/views/screens/interest_screen/interest_category_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/detail_kelas_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/list_materi_screen.dart';
import 'package:harsa_mobile/views/screens/payment_screen/all_payment_screen.dart';
import 'package:harsa_mobile/views/screens/subscription_plan_list/subscription_plan_list.dart';
import 'package:harsa_mobile/views/screens/transaction_history_screen/transaction_history_screen.dart';
import 'package:harsa_mobile/views/screens/recommendation_screen/recommendation_screen.dart';
import 'package:harsa_mobile/views/screens/tugas_screen/tugas_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/menu_kelas_screen.dart';
import 'package:harsa_mobile/views/screens/quiz_screen/quiz_screen.dart';
import 'package:harsa_mobile/views/screens/ulasan_screen/ulasan_screen.dart';
import 'package:harsa_mobile/views/screens/aichatbot_screen/aichatbot_screen.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:harsa_mobile/viewmodels/materiview_provider.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/daftar_kelas_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/kelas_screen.dart';
import 'package:harsa_mobile/views/screens/profile_screen/profile_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/berlangganan_screen.dart';
import 'package:harsa_mobile/views/screens/category_screen/category_screen.dart';
import 'package:harsa_mobile/views/screens/certificate_screen/certificate_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/materiview_screen.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/video_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id', null);
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
        ChangeNotifierProvider(create: (_) => UlasanScreenProvider()),
        ChangeNotifierProvider(create: (_) => AIChatbotProvider()),
        ChangeNotifierProvider(create: (_) => MateriViewProvider()),
        ChangeNotifierProvider(create: (_) => KelasProvider()),
        ChangeNotifierProvider(create: (_) => CategoryScreenProvider()),
        ChangeNotifierProvider(create: (_) => CertificateProvider()),
        ChangeNotifierProvider(create: (_) => ClassFollowedProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => TugasProvider()),
        ChangeNotifierProvider(create: (_) => EditEmailProvider()),
        ChangeNotifierProvider(create: (_) => EditSandiProvider()),
        ChangeNotifierProvider(create: (_) => MenuKelasProvider()),
        ChangeNotifierProvider(create: (_) => TugasProvider()),
        ChangeNotifierProvider(create: (_) => EditProfileProvider()),
        ChangeNotifierProvider(create: (_) => TransactionHistoryProvider()),
        ChangeNotifierProvider(create: (_) => RecommendationScreenProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionPlanListProvider()),
        ChangeNotifierProvider(create: (_) => BankProvider()),
        ChangeNotifierProvider(create: (_) => PaymentCardProvider()),
        ChangeNotifierProvider(create: (_) => EWalletProvider()),
        ChangeNotifierProvider(create: (_) => LoginReminderProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
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
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(width: 1),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        // Screen Route Name
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
            case '/ulasan':
              return MaterialPageRoute(
                builder: (context) => const UlasanScreenContent(),
              );
            case '/aichatbot':
              return MaterialPageRoute(
                builder: (context) => const AIChatbotScreen(),
              );
            case '/kelasscreen':
              return MaterialPageRoute(
                builder: (context) {
                  final Map? args = (settings.arguments ?? {}) as Map?;
                  return KelasScreen(data: args);
                },
              );
            case '/daftarkelas':
              return MaterialPageRoute(
                builder: (context) => const DaftarKelasScreen(),
              );
            case '/profile':
              return MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              );
            case '/video':
              return MaterialPageRoute(
                builder: (context) => const VideoScreen(),
              );
            case '/materi':
              return MaterialPageRoute(
                builder: (context) => const MateriViewScreen(),
              );
            case '/berlangganan':
              return MaterialPageRoute(
                builder: (context) => const BerlanggananScreen(),
              );
            case '/listmateri':
              return MaterialPageRoute(
                builder: (context) => const ListMateriScreen(),
              );
            case '/category':
              return MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              );
            case '/sertifikat':
              return MaterialPageRoute(
                builder: (context) => const CertificateScreen(),
              );
            case '/kelasdiikuti':
              return MaterialPageRoute(
                builder: (context) => const ClassFollowedScreen(),
              );
            case '/quizscreen':
              return MaterialPageRoute(
                builder: (context) => const QuizScreen(),
              );
            case '/tugasscreen':
              return MaterialPageRoute(
                builder: (context) => const TugasScreen(),
              );
            case '/editemail':
              return MaterialPageRoute(
                builder: (context) => const EditEmailScreen(),
              );
            case '/editsandi':
              return MaterialPageRoute(
                builder: (context) => const EditSandiScreen(),
              );
            case '/editprofile':
              return MaterialPageRoute(
                builder: (context) => const EditProfileScreen(),
              );
            case '/menukelas':
              return MaterialPageRoute(
                builder: (context) => const MenuKelasScreen(),
              );
            case '/riwayattransaksi':
              return MaterialPageRoute(
                builder: (context) => const TransactionHistoryScreen(),
              );
            case '/recommendation':
              return MaterialPageRoute(
                builder: (context) => const RecommendationScreen(),
              );
            case '/subscriptionlist':
              return MaterialPageRoute(
                builder: (context) => const SubscriptionPlanList(),
              );
            case '/detailsubscription':
              final subscription = settings.arguments as Datum;
              return MaterialPageRoute(
                builder: (context) =>
                    DetailSubscription(subscription: subscription),
              );
            // case '/payment':
            //   return MaterialPageRoute(
            //     builder: (context) =>  PaymentScreen(),
            //   );
            case '/allpayment':
              return MaterialPageRoute(
                builder: (context) => const AllPaymentScreen(),
              );
          }
          return null;
        },
      ),
    );
  }
}
