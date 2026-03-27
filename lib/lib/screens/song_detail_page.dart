import 'package:final_thesis_ui/screens/education_mode_page.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'favorites_page.dart';
import 'library_page.dart';
import 'record_selection_page.dart';
import 'welcome_screen.dart';

class SongDetailPage extends StatefulWidget {
  final String songImage;
  final String songTitle;

  const SongDetailPage({
    super.key,
    required this.songImage,
    required this.songTitle,
  });

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  int _selectedIndex = 0;
  bool _isMenuOpen = false;

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
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'image': 'https://i.pravatar.cc/150?img=4',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'image': 'https://i.pravatar.cc/150?img=5',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'image': 'https://i.pravatar.cc/150?img=6',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'image': 'https://i.pravatar.cc/150?img=7',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'image': 'https://i.pravatar.cc/150?img=8',
    },
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LibraryPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const RecordSelectionPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const EducationModePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Show exit dialog when stop button is pressed
  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sure you want to leave?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Save and exit logic here
                      Navigator.of(context).pop(); // Close dialog
                      Navigator.of(context).pop(); // Go back to previous page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Save and Exit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Just exit without saving
                      Navigator.of(context).pop(); // Close dialog
                      Navigator.of(context).pop(); // Go back to previous page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Yes'),
                  ),
                ],
              ),
            ],
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
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMenuOpen = !_isMenuOpen;
                          });
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: const NetworkImage(
                            'https://philnews.ph/wp-content/uploads/2023/05/Kween-Yasmin-768x432.png',
                          ),
                          backgroundColor: AppColors.primaryCyan,
                        ),
                      ),
                    ],
                  ),
                ),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.inputBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search for songs, artist',
                        hintStyle: TextStyle(
                          color: AppColors.grey.withValues(alpha: 0.6),
                          fontFamily: 'Roboto',
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.grey,
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

                // Song List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return _buildSongItem(songs[index]);
                    },
                  ),
                ),

                // Recording Controls (Stop button)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Stop button - shows dialog when pressed
                      GestureDetector(
                        onTap: _showExitDialog,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.stop,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Profile Menu Overlay
            if (_isMenuOpen)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isMenuOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black.withValues(alpha: 0.5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70, right: 16),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.cardBg,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // User Info
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                      'https://philnews.ph/wp-content/uploads/2023/05/Kween-Yasmin-768x432.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Yasmin',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                        Text(
                                          'View Profile',
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
                                ],
                              ),
                            ),
                            const Divider(color: AppColors.inputBg, height: 1),

                            _buildMenuItem(Icons.favorite_border, 'Favorites'),
                            _buildMenuItem(Icons.settings_outlined, 'Settings'),
                            _buildMenuItem(
                              Icons.delete_outline,
                              'Recently Deleted',
                            ),
                            _buildMenuItem(
                              Icons.logout,
                              'Logout',
                              isLogout: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSongItem(Map<String, String> song) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          leading: ClipOval(
            child: Image.network(
              song['image']!,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            song['title']!,
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
          ),
          subtitle: Text(
            song['artist']!,
            style: TextStyle(
              color: AppColors.grey.withValues(alpha: 0.8),
              fontSize: 13,
              fontFamily: 'Roboto',
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.bookmark_border, color: AppColors.grey),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? AppColors.errorRed : AppColors.white,
        size: 20,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isLogout ? AppColors.errorRed : AppColors.white,
          fontFamily: 'Roboto',
          fontSize: 14,
        ),
      ),
      dense: true,
      onTap: () {
        if (isLogout) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const WelcomeScreen()),
            (route) => false,
          );
        } else if (label == 'Favorites') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FavoritesPage()),
          );
          setState(() {
            _isMenuOpen = false;
          });
        } else {
          setState(() {
            _isMenuOpen = false;
          });
        }
      },
    );
  }
}
