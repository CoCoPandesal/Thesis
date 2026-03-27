import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../screens/home_page.dart';
import '../screens/library_page.dart';
import '../screens/record_selection_page.dart';
import '../screens/education_mode_page.dart'; // Import EducationPage

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bottomNavBg,
        border: Border(
          top: BorderSide(color: AppColors.inputBg.withValues(alpha: 0.3)),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0, context),
              _buildNavItem(Icons.library_music, 'Library', 1, context),
              _buildNavItem(Icons.add_circle_outline, 'Record', 2, context),
              _buildNavItem(Icons.school, 'Education', 3, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    BuildContext context,
  ) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == currentIndex)
          return; // Prevent navigating to the same page

        // Trigger navigation based on the selected tab index
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RecordSelectionPage()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const EducationModePage(),
            ), // Education page navigation
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryCyan : AppColors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryCyan : AppColors.grey,
              fontSize: 11,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
