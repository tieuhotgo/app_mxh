class PostModel {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final int likes;
  final int comments;
  final int shares;

  const PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
