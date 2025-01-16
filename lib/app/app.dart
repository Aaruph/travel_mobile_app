import 'package:flutter/material.dart';
import 'package:travel_mobile_app/core/theme/app_theme.dart';
import 'package:travel_mobile_app/features/auth/presentation/view/dashboard_page.dart';
import 'package:travel_mobile_app/features/auth/presentation/view/loading_page.dart';
import 'package:travel_mobile_app/features/auth/presentation/view/login_page.dart';
import 'package:travel_mobile_app/features/auth/presentation/view/onboarding_page.dart';
import 'package:travel_mobile_app/features/auth/presentation/view/sign_up_page.dart';

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
