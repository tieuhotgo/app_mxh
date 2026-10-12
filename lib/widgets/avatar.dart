import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imagePath;
  final double size;
  final double borderWidth;
  final bool showShadow;

  const AvatarWidget({
    super.key,
    required this.imagePath,
    this.size = 40,
    this.borderWidth = 2,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: Icon(Icons.person, color: Colors.grey, size: size * 0.4),
            );
          },
        ),
      ),
    );
  }
}
