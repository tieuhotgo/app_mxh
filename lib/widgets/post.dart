import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                post.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
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
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  post.description,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 14),

                Row(
                  children: [
                    _buildInteractionItem(
                      icon: Icons.favorite_border,
                      count: post.likes,
                      iconSize: 22,
                    ),
                    const SizedBox(width: 24),
                    _buildInteractionItem(
                      icon: Icons.chat_bubble_outline,
                      count: post.comments,
                      iconSize: 21,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionItem({
    IconData? icon,
    Widget? iconWidget,
    required int count,
    double iconSize = 22,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        iconWidget ?? Icon(icon, size: iconSize, color: Colors.grey.shade700),
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
    );
  }
}
