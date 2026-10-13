import 'package:flutter/material.dart';

import '../screens/explore_screens/image_viewer_screens.dart';

class ExploreImageWidget extends StatelessWidget {
  final List<String> images;
  final int index;

  const ExploreImageWidget({
    super.key,
    required this.images,
    required this.index,
  });

  void _openViewer(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) =>
            ImageViewerScreen(images: images, initialIndex: index),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openViewer(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          images[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: const Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 30,
              ),
            );
          },
        ),
      ),
    );
  }
}
