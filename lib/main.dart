import 'package:flutter/material.dart';
import 'package:travel_mobile_app/app/app.dart';
import 'package:travel_mobile_app/app/di/di.dart';
import 'package:travel_mobile_app/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await initDependencies();
  runApp(const App()); // ✅ Make sure App() is wrapped inside MultiProvider
}
