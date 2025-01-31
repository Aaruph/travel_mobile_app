// import 'package:flutter/material.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     primarySwatch: Colors.orange,
//     scaffoldBackgroundColor: Colors.white,
//     fontFamily: 'Lora  Bold',
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: const TextStyle(
//             fontSize: 16,
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontFamily: 'Lora  Regular'),
//         backgroundColor: Colors.orange,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';


import '../../app/constants/theme_constant.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
        // Change app bar color
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: ThemeConstant.appBarColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Colors.red, fontSize: 30, fontFamily: 'Lora Regular'),
        ),

        // Change elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: ThemeConstant.primaryColor,
            textStyle:
                const TextStyle(fontSize: 20, fontFamily: 'Lora Regular'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        // Change text field theme
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'Lora Regular'),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeConstant.primaryColor,
            ),
          ),
        ),
        // Circular progress bar theme
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: ThemeConstant.primaryColor,
        ),
        //Bottom navigation bar theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF008FA0),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        // Define global text theme with Lora  Regular and Bold
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Lora Regular',
            fontSize: 16,
            fontWeight: FontWeight.w400, // Regular
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Lora Regular',
            fontSize: 14,
            fontWeight: FontWeight.w400, // Regular
          ),
          titleLarge: TextStyle(
            fontFamily: 'Lora Regular',
            fontSize: 20,
            fontWeight: FontWeight.bold, // Bold
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Lora Regular',
            fontSize: 18,
            fontWeight: FontWeight.bold, // Bold
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Lora Regular',
            fontSize: 16,
            fontWeight: FontWeight.w400, // Regular
          ),
          labelLarge: TextStyle(
            fontFamily: 'Lora Regular',
            fontSize: 14,
            fontWeight: FontWeight.bold, // Bold
          ),
        ));
  }
}
