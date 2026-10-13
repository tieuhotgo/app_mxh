import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/mock_data_service.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/explore_image.dart';
import '../../widgets/avatar.dart';
import '../explore_screens/image_viewer_screens.dart';

class ProfileScreen extends StatefulWidget {
  final Widget? bottomNavigationBar;

  const ProfileScreen({
    super.key,
    this.bottomNavigationBar = const BottomBar(currentIndex: 2),
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const double _coverHeight = 250;
  static const double _avatarSize = 124;
  static const double _avatarOverflow = 40;
  static const Color _primary = Color(0xFF1976D2);
  static const String _avatarPath = 'assets/images/avt.webp';
  static const String _coverPath = 'assets/images/anh_bia.webp';

  static const String _name = 'Nguyễn Thị Asa';
  static const String _bio = 'Rapper, vũ công, sáng tác nhạc | BABYMONSTER';
  static const int _posts = 128;
  static const int _followers = 12400;
  static const int _following = 356;

  bool _isFollowing = false;

  String _formatCount(int n) {
    if (n >= 1000) {
      final value = (n / 1000)
          .toStringAsFixed(1)
          .replaceFirst(RegExp(r'\.0$'), '');
      return '${value}K';
    }
    return '$n';
  }

  void _onFollowPressed() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = MockDataService.getProfileImages();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            const SliverToBoxAdapter(
              child: Divider(height: 1, thickness: 1, color: Color(0xFFEAECEF)),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ExploreImageWidget(images: images, index: index),
                  childCount: images.length,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_buildCover(), _buildInfo()],
        ),
        Positioned(
          left: 20,
          top: _coverHeight - (_avatarSize - _avatarOverflow),
          child: GestureDetector(
            onTap: () => openImageViewer(context, const [_avatarPath], 0),
            child: const AvatarWidget(
              imagePath: _avatarPath,
              size: _avatarSize,
              borderWidth: 4,
              showShadow: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCover() {
    return GestureDetector(
      onTap: () => openImageViewer(context, const [_coverPath], 0),
      child: SizedBox(
        height: _coverHeight,
        width: double.infinity,
        child: Image.asset(
          _coverPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: const Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, _avatarOverflow + 16, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            _name,
            style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontSize: 26,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _bio,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          _buildStats(),
          const SizedBox(height: 20),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        _buildStatItem(_formatCount(_posts), 'Bài viết'),
        _buildStatDivider(),
        _buildStatItem(_formatCount(_followers), 'Người theo dõi'),
        _buildStatDivider(),
        _buildStatItem(_formatCount(_following), 'Đang theo dõi'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1A1A1A),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(width: 1, height: 36, color: const Color(0xFFE0E3E7));
  }

  Widget _buildActionButtons() {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );
    const buttonSize = Size.fromHeight(48);
    const labelStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w700);

    return Row(
      children: [
        Expanded(
          child: _isFollowing
              ? OutlinedButton(
                  onPressed: _onFollowPressed,
                  style: OutlinedButton.styleFrom(
                    minimumSize: buttonSize,
                    shape: shape,
                    foregroundColor: _primary,
                    side: const BorderSide(color: _primary, width: 1.2),
                    textStyle: labelStyle,
                  ),
                  child: const Text('Đang theo dõi'),
                )
              : FilledButton(
                  onPressed: _onFollowPressed,
                  style: FilledButton.styleFrom(
                    minimumSize: buttonSize,
                    shape: shape,
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    textStyle: labelStyle,
                  ),
                  child: const Text('Theo dõi'),
                ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: buttonSize,
              shape: shape,
              foregroundColor: Colors.grey.shade800,
              side: BorderSide(color: Colors.grey.shade400, width: 1.2),
              textStyle: labelStyle,
            ),
            child: const Text('Nhắn tin'),
          ),
        ),
      ],
    );
  }
}
