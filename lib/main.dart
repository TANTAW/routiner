import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:routiner/core/constants/app_strings.dart';
import 'package:routiner/core/theme/app_theme.dart';
import 'package:routiner/core/utils/preferences_helper.dart';
import 'package:routiner/presentation/pages/home/home_screen.dart';
import 'package:routiner/presentation/pages/login/login_screen.dart';
import 'package:routiner/presentation/pages/onboarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final bool isFirstLaunch = await PreferencesHelper.isFirstLaunch();
  final bool isLoggedIn = await PreferencesHelper.isLoggedIn();

  // Remove splash screen
  FlutterNativeSplash.remove();
  runApp(MyApp(isFirstLaunch: isFirstLaunch, isLoggedIn: isLoggedIn,));
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
      home: _getStartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _getStartScreen() {
    if (isFirstLaunch) {
      return const OnboardingScreen();
    } else if (!isLoggedIn) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }
}