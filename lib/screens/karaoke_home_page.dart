import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_page.dart';
import 'karaoke_recording_page.dart';
import 'library_page.dart';
import 'education_mode_page.dart';

class KaraokeHomePage extends StatefulWidget {
  const KaraokeHomePage({super.key});

  @override
  State<KaraokeHomePage> createState() => _KaraokeHomePageState();
}

class _KaraokeHomePageState extends State<KaraokeHomePage> {
  final TextEditingController _searchController = TextEditingController();

  // Sample song data - replace with your actual data
  final List<Map<String, String>> songs = [
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'image':
          'https://media.philstar.com/photos/2022/04/19/regine-1_2022-04-19_17-19-51.jpg',
    },
    {
      'title': 'Paalam Muna Sandali',
      'artist': 'Darren Espanto',
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.X4OeqoB_8615vepJpu2zdQHaE7?rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'title': 'Nasa Iyo Na Ang Lahat',
      'artist': 'Daniel Padilla',
      'image':
          'https://images.genius.com/e817d67292e5c1ac1e72b0c8573161e5.900x900x1.jpg',
    },
    {
      'title': 'Ulap',
      'artist': 'Rob Daniel',
      'image':
          'https://tse3.mm.bing.net/th/id/OIP.4AnzA3S0-AUEBFjst492KwAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'title': 'Fallen',
      'artist': 'Lola Amour',
      'image':
          'https://images.genius.com/b62c08396330faf55dae7e6a73b26324.1000x1000x1.png',
    },
    {
      'title': 'Binibini',
      'artist': 'Arthur Nery',
      'image':
          'https://i.pinimg.com/736x/c4/51/fd/c451fd1b67b8e80830aaca56188e46d8.jpg',
    },
    {
      'title': 'Kumpas',
      'artist': 'Moira Dela Torre',
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.2Uaip4XK2mxVqOEL_zu4cAHaFj?rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'title': 'Randomantic',
      'artist': 'james reid',
      'image':
          'https://images.genius.com/f428806fd40d83f4a6f934680bdbd7e8.1000x1000x1.jpg',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                  const Text(
                    'Karaoke',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const Spacer(),
                  // Profile/Settings icon - REMOVED
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.inputBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontFamily: 'Roboto',
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search for songs, artist',
                    hintStyle: TextStyle(
                      color: AppColors.grey.withValues(alpha: 0.6),
                      fontFamily: 'Roboto',
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.grey.withValues(alpha: 0.6),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Song List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to karaoke recording page with selected song
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KaraokeRecordingPage(
                            songTitle: song['title']!,
                            songArtist: song['artist']!,
                            songImage: song['image']!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.inputBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Song Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              song['image']!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 50,
                                  height: 50,
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

                          // Song Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  song['title']!,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  song['artist']!,
                                  style: TextStyle(
                                    color: AppColors.grey.withValues(
                                      alpha: 0.8,
                                    ),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Bookmark icon
                          Icon(
                            Icons.bookmark_border,
                            color: AppColors.grey.withValues(alpha: 0.6),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
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
          } else if (index == 2) {
            // Stay on karaoke page
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
