import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/intereset_provider.dart';
import 'package:harsa_mobile/views/screens/main_screen/InterestScreen/interest_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const InterestCategoryScreen(),
    );
  }
}
