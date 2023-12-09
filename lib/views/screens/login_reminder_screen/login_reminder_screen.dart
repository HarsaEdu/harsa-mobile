import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/login_reminder_provider.dart';
import 'package:provider/provider.dart';

class LoginReminderScreen extends StatefulWidget {
  const LoginReminderScreen({super.key});

  @override
  State<LoginReminderScreen> createState() => _LoginReminderScreenState();
}

class _LoginReminderScreenState extends State<LoginReminderScreen> {
  late LoginReminderProvider pageProvider;
  @override
  void initState() {
    super.initState();
    pageProvider = Provider.of<LoginReminderProvider>(context, listen: false);
    pageProvider.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/outline/power_circle.svg'),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Oopss.. Untuk melihat halaman ini silahkan login terlebih dahulu',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsPallete.sandyBrown),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: pageProvider.goToLogin,
                child: Text(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
