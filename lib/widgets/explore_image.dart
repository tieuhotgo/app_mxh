import 'package:flutter/material.dart';

class ExploreImageWidget extends StatelessWidget {
  final String imagePath;

  const ExploreImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey, size: 30),
          );
        },
      ),
    );
  }
}
