import 'package:flutter/material.dart';

import '../../models/post_model.dart';
import '../../services/mock_data_service.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/notification_dropdown.dart';
import '../../widgets/post.dart';

class HomeScreen extends StatefulWidget {
  final Widget? bottomNavigationBar;

  const HomeScreen({
    super.key,
    this.bottomNavigationBar = const BottomBar(currentIndex: 0),
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showNotifications = false;

  void _toggleNotifications() {
    setState(() {
      _showNotifications = !_showNotifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<PostModel> posts = MockDataService.getHomePosts();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Trang chủ',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 22,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _showNotifications
                  ? Icons.notifications
                  : Icons.notifications_none_outlined,
              color: Colors.black87,
              size: 26,
            ),
            onPressed: _toggleNotifications,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: posts.map((post) => PostWidget(post: post)).toList(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NotificationDropdown(visible: _showNotifications),
          ),
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
