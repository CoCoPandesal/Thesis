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
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=2',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=3',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=4',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=5',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=6',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=7',
    },
    {
      'title': 'Dadalhin',
      'artist': 'Regine Velasquez',
      'date': '10-20-26',
      'image': 'https://i.pravatar.cc/150?img=8',
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
