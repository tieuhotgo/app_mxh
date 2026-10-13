import 'package:flutter/material.dart';

import '../services/app_navigation_service.dart';
import '../widgets/bottom_bar.dart';
import 'home_screens/home_screen.dart';
import 'explore_screens/explore_screen.dart';
import 'profile_screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    AppNavigationService.tabIndex.value = widget.initialIndex;
    AppNavigationService.tabIndex.addListener(_syncTabIndex);
  }

  @override
  void dispose() {
    AppNavigationService.tabIndex.removeListener(_syncTabIndex);
    super.dispose();
  }

  void _syncTabIndex() {
    setState(() {
      _currentIndex = AppNavigationService.tabIndex.value;
    });
  }

  void _onTabTapped(int index) {
    AppNavigationService.tabIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(bottomNavigationBar: SizedBox.shrink()),
          ExploreScreen(bottomNavigationBar: SizedBox.shrink()),
          ProfileScreen(bottomNavigationBar: SizedBox.shrink()),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
