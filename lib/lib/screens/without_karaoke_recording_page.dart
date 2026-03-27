import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_page.dart';
import 'library_page.dart';
import 'education_mode_page.dart';
import 'dart:async'; // Make sure to import this for Timer

class WithoutKaraokeRecordingPage extends StatefulWidget {
  const WithoutKaraokeRecordingPage({super.key});

  @override
  State<WithoutKaraokeRecordingPage> createState() =>
      _WithoutKaraokeRecordingPageState();
}

class _WithoutKaraokeRecordingPageState
    extends State<WithoutKaraokeRecordingPage> {
  bool _isPlaying = false;
  bool _isRecording = false;
  String _timerText = "00:00";
  int _seconds = 0;
  Timer? _timer;

  // Timer start method
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        _timerText = _formatTime(_seconds);
      });
    });
  }

  // Timer stop method
  void _stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
      setState(() {
        _seconds = 0;
        _timerText = "00:00";
      });
    }
  }

  // Format timer text to show mm:ss
  String _formatTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    return '${_padZero(minutes)}:${_padZero(remainingSeconds)}';
  }

  // Helper function to add leading zero
  String _padZero(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  @override
  void dispose() {
    // Dispose of the timer when the page is destroyed
    _stopTimer();
    super.dispose();
  }

  // Show exit confirmation dialog when "End" button is pressed
  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Ensure user can't dismiss by tapping outside
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Sure you want to exit?',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle save logic here
                        Navigator.pop(dialogContext);
                        Navigator.pop(context); // Exit the page
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext); // Close without exit
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Record',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),

            // Main Content - Audio Visualizer Area
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Vertical Line / Audio Visualizer
                    Container(
                      width: 2,
                      height: 200,
                      color: AppColors.white.withOpacity(0.3),
                    ),

                    const SizedBox(height: 40),

                    // Timer
                    Text(
                      _timerText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Controls - 3 Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Play Button (White Triangle)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: AppColors.white,
                      size: 40,
                    ),
                  ),

                  const SizedBox(width: 60),

                  // Record Button (Red Circle)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isRecording = !_isRecording;
                        if (_isRecording) {
                          _startTimer(); // Start timer when recording
                        } else {
                          _stopTimer(); // Stop timer when recording stops
                        }
                      });
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isRecording
                            ? Colors.red.withOpacity(0.7)
                            : Colors.red,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      child: Icon(
                        _isRecording ? Icons.stop : Icons.fiber_manual_record,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),

                  const SizedBox(width: 60),

                  // End Button (White Square)
                  GestureDetector(
                    onTap: () {
                      _showExitConfirmationDialog(
                        context,
                      ); // Show Save/Exit dialog when "End" button is pressed
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.stop,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
              (route) => false,
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LibraryPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EducationModePage()),
            );
          }
        },
      ),
    );
  }
}
