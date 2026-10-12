import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/post_interaction_service.dart';
import '../widgets/share_post_dialog.dart';

class PostActionBar extends StatelessWidget {
  final PostModel post;

  final VoidCallback? onCommentTap;

  const PostActionBar({super.key, required this.post, this.onCommentTap});

  @override
  Widget build(BuildContext context) {
    final PostLikeController likeController = PostInteractionService.likeOf(
      post,
    );

    return ListenableBuilder(
      listenable: likeController,
      builder: (context, _) {
        final bool isLiked = likeController.isLiked;

        return Row(
          children: [
            _buildInteractionItem(
              icon: isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : null,
              count: likeController.likeCount,
              iconSize: 22,
              onTap: likeController.toggle,
            ),
            const SizedBox(width: 24),
            _buildInteractionItem(
              icon: Icons.chat_bubble_outline,
              count: post.comments,
              iconSize: 21,
              onTap: onCommentTap,
            ),
            const SizedBox(width: 24),
            _buildInteractionItem(
              iconWidget: Image.asset(
                'assets/icons/share.png',
                width: 22,
                height: 22,
                color: Colors.grey.shade700,
              ),
              count: post.shares,
              onTap: () => showSharePostDialog(context),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInteractionItem({
    IconData? icon,
    Widget? iconWidget,
    required int count,
    double iconSize = 22,
    Color? color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconWidget ??
                Icon(
                  icon,
                  size: iconSize,
                  color: color ?? Colors.grey.shade700,
                ),
            const SizedBox(width: 6),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
