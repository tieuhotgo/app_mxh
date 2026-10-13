import 'package:flutter/material.dart';

import '../models/notification_model.dart';
import '../services/notification_data_service.dart';
import 'avatar.dart';

class NotificationDropdown extends StatelessWidget {
  final bool visible;

  const NotificationDropdown({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      alignment: Alignment.topCenter,
      child: visible
          ? _buildPanel(context)
          : const SizedBox(width: double.infinity),
    );
  }

  Widget _buildPanel(BuildContext context) {
    final List<NotificationModel> notifications =
        NotificationDataService.getNotifications();
    final double maxHeight = MediaQuery.of(context).size.height * 0.6;
    const BorderRadius radius = BorderRadius.vertical(
      bottom: Radius.circular(16),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < notifications.length; i++)
                    _buildItem(notifications[i], i),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(NotificationModel item, int index) {
    final Color background = index.isEven
        ? Colors.white
        : const Color(0xFFEAF0F7);

    return Material(
      color: background,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarWidget(imagePath: item.avatarPath, size: 42),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: item.userName,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(text: ' ${item.action}'),
                        ],
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.35,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
