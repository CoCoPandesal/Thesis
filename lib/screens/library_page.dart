import 'package:final_thesis_ui/screens/education_mode_page.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_page.dart';
import 'record_selection_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final List<Map<String, String>> librarySongs = [
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
      'image': 'https://tse3.mm.bing.net/th/id/OIP.4AnzA3S0-AUEBFjst492KwAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'title': 'Fallen',
      'artist': 'Lola Amour',
      'image': 'https://images.genius.com/b62c08396330faf55dae7e6a73b26324.1000x1000x1.png',
    },
    {
      'title': 'Binibini',
      'artist': 'Arthur Nery',
      'image': 'https://i.pinimg.com/736x/c4/51/fd/c451fd1b67b8e80830aaca56188e46d8.jpg',
    },
    {
      'title': 'Kumpas',
      'artist': 'Moira Dela Torre',
      'image': 'https://tse2.mm.bing.net/th/id/OIP.2Uaip4XK2mxVqOEL_zu4cAHaFj?rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'title': 'Randomantic',
      'artist': 'james reid',
      'image': 'https://images.genius.com/f428806fd40d83f4a6f934680bdbd7e8.1000x1000x1.jpg',
    },
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const RecordSelectionPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const EducationModePage()),
      );
    }
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Library',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Records Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Records',
                  style: TextStyle(
                    color: AppColors.grey.withValues(alpha: 0.8),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Library List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: librarySongs.length,
                itemBuilder: (context, index) {
                  return _buildLibraryItem(librarySongs[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1, onTap: _onItemTapped),
    );
  }

  Widget _buildLibraryItem(Map<String, String> song) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              song['image']!,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song['title']!,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  song['artist']!,
                  style: TextStyle(
                    color: AppColors.grey.withValues(alpha: 0.8),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          Text(
            song['date']!,
            style: TextStyle(
              color: AppColors.grey.withValues(alpha: 0.6),
              fontSize: 12,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(
              Icons.folder_outlined,
              color: AppColors.grey,
              size: 22,
            ),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
