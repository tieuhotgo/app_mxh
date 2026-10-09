import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/mock_data_service.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/post.dart';

class HomeScreen extends StatelessWidget {
  final Widget? bottomNavigationBar;

  const HomeScreen({
    super.key,
    this.bottomNavigationBar = const BottomBar(currentIndex: 0),
  });

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
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black87,
              size: 26,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: posts.map((post) => PostWidget(post: post)).toList(),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
