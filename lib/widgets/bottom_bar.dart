import 'package:flutter/material.dart';

import '../screens/home_screens.dart';
import '../screens/explore_screens.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const BottomBar({super.key, this.currentIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                index: 0,
                icon: Icons.home_filled,
                label: 'Trang chủ',
              ),
              _buildNavItem(
                context: context,
                index: 1,
                icon: Icons.search,
                label: 'Tìm kiếm',
              ),
              _buildNavItem(
                context: context,
                index: 2,
                icon: Icons.person_outline,
                label: 'Hồ sơ',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = index == currentIndex;
    final color = isSelected ? const Color(0xFF1976D2) : Colors.grey.shade600;

    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(index);
        } else {
          if (index == 0 && currentIndex != 0) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeScreen(),
                transitionDuration: Duration.zero,
              ),
            );
          } else if (index == 1 && currentIndex != 1) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ExploreScreen(),
                transitionDuration: Duration.zero,
              ),
            );
          }
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
