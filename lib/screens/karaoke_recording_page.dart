import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_page.dart';
import 'library_page.dart';

class KaraokeRecordingPage extends StatefulWidget {
  final String songTitle;
  final String songArtist;
  final String songImage;

  const KaraokeRecordingPage({
    super.key,
    this.songTitle = 'Dadalhin',
    this.songArtist = 'Regine Velasquez',
    this.songImage = 'https://i.pravatar.cc/150?img=1',
  });

  @override
  State<KaraokeRecordingPage> createState() => _KaraokeRecordingPageState();
}

class _KaraokeRecordingPageState extends State<KaraokeRecordingPage> {
  bool _isPlaying = false;
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header
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
                  Expanded(
                    child: Text(
                      widget.songTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        fontFamily: 'Roboto',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Song Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.inputBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.songImage,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: AppColors.grey.withValues(alpha: 0.3),
                            child: const Icon(
                              Icons.music_note,
                              color: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.songTitle,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.songArtist,
                            style: TextStyle(
                              color: AppColors.grey.withValues(alpha: 0.8),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Lyrics Area (Center)
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.songTitle,
                        style: TextStyle(
                          color: AppColors.grey.withValues(alpha: 0.6),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Bawat saglit na ika\'y\nlalapit ang mundo ko\'y\nbiglang tumitigil...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryCyan,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Ang pangalan mo, sinisigaw\nng pusong minamahal...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.grey.withValues(alpha: 0.6),
                          fontSize: 20,
                          height: 1.5,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Controls - Only 3 buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Play/Pause Button
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: AppColors.white,
                      size: 32,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                  ),
                  const SizedBox(width: 40),

                  // Red Record Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isRecording = !_isRecording;
                      });
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Icon(
                        _isRecording ? Icons.stop : Icons.fiber_manual_record,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),

                  // White Square Stop Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlaying = false;
                        _isRecording = false;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
          }
        },
      ),
    );
  }
}
