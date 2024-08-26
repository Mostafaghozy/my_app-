import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/Auth/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:first_app/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation/AllProducts_screen.dart';
import 'bottom_navigation/category.dart';
import 'bottom_navigation/home_screen.dart';
import 'homeScreen.dart';

// import 'app_desc/appDec.dart';
// import 'app_desc/developers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showOnboarding = prefs.getBool('ON_BOARDING') ?? true;

  runApp(MyApp(showOnboarding: showOnboarding));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;

  const MyApp({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mens-Watches',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // home:  IntroScreen(),
      home: IntroScreen(),
    );
  }
}
