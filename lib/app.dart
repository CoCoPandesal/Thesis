import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/welcome_screen.dart';

class HuniApp extends StatelessWidget {
  const HuniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUNI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.bgDark,
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Roboto'),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.inputBg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
