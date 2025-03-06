import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:travel_mobile_app/core/theme/theme_provider.dart';
import 'package:travel_mobile_app/features/home/presentation/view/bottom_view/account_view.dart';

void main() {
  group('ProfileView Widget Tests', () {
    // Test if the profile header with avatar, username, and email is present
    testWidgets('Profile header contains avatar, username, and email',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: MaterialApp(home: const ProfileView()),
        ),
      );

      // Ensure the widget is settled
      await tester.pumpAndSettle();

      // Check if the avatar, username, and email are displayed
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('ishowspeed'), findsOneWidget);
      expect(find.text('ishowspeed@gmail.com'), findsOneWidget);
    });

    // Test if the Profile Options list is present and contains correct items
    testWidgets('Profile options are displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: MaterialApp(home: const ProfileView()),
        ),
      );

      // Ensure the widget is settled
      await tester.pumpAndSettle();

      // Check for specific profile options
      expect(find.text('Personal Information'), findsOneWidget);
      expect(find.text('Feedback'), findsOneWidget);
      expect(find.text('My Favourites'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Message Center'), findsOneWidget);
      expect(find.text('Address'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    // Test if the Dark Mode switch is present and toggles correctly
    testWidgets('Dark Mode toggle switch works correctly',
        (WidgetTester tester) async {
      final themeProvider = ThemeProvider();
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => themeProvider,
          child: MaterialApp(home: const ProfileView()),
        ),
      );

      // Ensure the widget is settled
      await tester.pumpAndSettle();

      // Check if the SwitchListTile for Dark Mode is present
      expect(find.byType(SwitchListTile), findsOneWidget);

      // Check initial state (Light mode)
      expect(themeProvider.themeMode, ThemeMode.light);

      // Toggle the switch to Dark mode
      await tester.tap(find.byType(SwitchListTile));
      await tester.pump();

      // Check if the theme has changed to Dark mode
      expect(themeProvider.themeMode, ThemeMode.dark);
    });

    // Test if the Logout button shows a dialog when pressed
    testWidgets('Logout button shows confirmation dialog',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: MaterialApp(home: const ProfileView()),
        ),
      );

      // Ensure the widget is settled
      await tester.pumpAndSettle();

      // Tap on the logout button
      await tester.tap(find.text('Logout'));
      await tester.pumpAndSettle();

      // Ensure the logout dialog is displayed
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Are you sure you want to log out?'), findsOneWidget);

      // Close the dialog by pressing the "Cancel" button
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Ensure the dialog is closed
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
