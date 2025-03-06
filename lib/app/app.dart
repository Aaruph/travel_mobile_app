import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:travel_mobile_app/app/di/di.dart';
import 'package:travel_mobile_app/core/theme/app_theme.dart';
import 'package:travel_mobile_app/core/theme/theme_provider.dart';
import 'package:travel_mobile_app/core/theme/user_provider.dart'; // Import UserProvider
import 'package:travel_mobile_app/features/splash/presentation/view/splash_view.dart';
import 'package:travel_mobile_app/features/splash/presentation/view_model/splash_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()), // ✅ Add this
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Travel App',
            theme: AppTheme.getApplicationTheme(
              isDarkMode: themeProvider.themeMode == ThemeMode.dark,
            ),
            darkTheme: AppTheme.getApplicationTheme(isDarkMode: true),
            themeMode: themeProvider.themeMode,
            home: BlocProvider.value(
              value: getIt<SplashCubit>(),
              child: const SplashView(),
            ),
          );
        },
      ),
    );
  }
}
