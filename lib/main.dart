// main.dart
import 'package:flutter/material.dart';
import 'view/login_page.dart';
import 'view/dashboard_page.dart';
import 'view/sign_up_page.dart';


void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
