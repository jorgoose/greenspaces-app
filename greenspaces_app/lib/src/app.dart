// File: lib/app.dart

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import the new screens
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/event_details_screen.dart';
import 'screens/leaderboard_screen.dart'; // Leaderboard screen

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Listen to the SettingsController for theme changes
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'GreenUp',
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',

          // Localization delegates
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English
          ],

          // Theme
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
              accentColor: Colors.greenAccent[400],
            ),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.green[700],
            ),
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
              bodyText1: TextStyle(fontSize: 16.0),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.green[700],
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.dark(
              primary: Colors.green[700]!,
              secondary: Colors.greenAccent[400]!,
            ),
            scaffoldBackgroundColor: Colors.grey[900],
          ),
          themeMode: settingsController.themeMode,

          // Initial route
          initialRoute: '/login', // or '/' if you want to start at MainScreen

          // Routes
          routes: {
            '/': (context) => MainScreen(), // MainScreen as the default route
            '/login': (context) => LoginScreen(),
            '/main': (context) => MainScreen(),
            '/event_details': (context) => EventDetailsScreen(),
            '/settings': (context) =>
                SettingsView(controller: settingsController),
            '/leaderboard': (context) => LeaderboardScreen(),
            // Add other routes as needed
          },
        );
      },
    );
  }
}
