import 'package:flutter/material.dart';
import 'package:travel_mobile_app/view/dashboard_page.dart';
import 'package:travel_mobile_app/view/loading_page.dart';
import 'package:travel_mobile_app/view/login_page.dart';
import 'package:travel_mobile_app/view/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const LoadingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const DashboardPage(
              
            ),
        // '/welcome': (context) => const WelcomePageView(),
      },
    );
  }
}
..