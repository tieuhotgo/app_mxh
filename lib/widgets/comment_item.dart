import 'package:flutter/material.dart';

import '../models/comment_model.dart';
import '../services/app_navigation_service.dart';
import 'avatar.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;

  const CommentItem({super.key, required this.comment});

  static const String _currentUserAvatar = 'assets/images/avt.webp';
  static const int _profileTabIndex = 2;

  bool get _isCurrentUser => comment.avatarPath == _currentUserAvatar;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onProfileTap = _isCurrentUser
        ? () => AppNavigationService.goToTab(context, _profileTabIndex)
        : null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onProfileTap,
          child: AvatarWidget(imagePath: comment.avatarPath, size: 40),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onProfileTap,
                child: Text(
                  comment.userName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F3F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  comment.content,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
