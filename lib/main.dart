import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:routiner/core/constants/app_strings.dart';
import 'package:routiner/core/theme/app_theme.dart';
import 'package:routiner/presentation/pages/auth/auth.dart';
import 'package:routiner/presentation/pages/home/home_screen.dart';
import 'package:routiner/presentation/pages/onboarding/onboarding_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep splash screen visible while initializing
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize services, check auth status
  // final bool isLoggedIn = await checkAuthStatus();

  // Remove splash screen
  FlutterNativeSplash.remove();
  runApp(const MyApp(isFirstLaunch: true, isLoggedIn: false,));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  final bool isLoggedIn;
  const MyApp({super.key, required this.isFirstLaunch, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _getStartScreen() {
    if (isFirstLaunch) {
      return const OnboardingScreen();
    } else if (!isLoggedIn) {
      return const AuthScreen();
    } else {
      return const HomeScreen();
    }
  }
}