import 'package:flutter/material.dart';
import 'package:travel_mobile_app/core/app_theme/app_theme.dart';
import 'package:travel_mobile_app/view/dashboard_page.dart';
import 'package:travel_mobile_app/view/loading_page.dart';
import 'package:travel_mobile_app/view/login_page.dart';
import 'package:travel_mobile_app/view/onboarding_page.dart';
import 'package:travel_mobile_app/view/sign_up_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      initialRoute: '/loading', // Set Loading Page as the initial route
      theme: getApplicationTheme(),
      routes: {
        '/loading': (context) => const LoadingPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}
//