import 'dart:async';
import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // or 'start_page.dart'

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const WelcomeScreen(), // FIXED: was AuthScreen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo here
            Icon(Icons.music_note, size: 80, color: Colors.cyan),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.cyan),
          ],
        ),
      ),
    );
  }
}
