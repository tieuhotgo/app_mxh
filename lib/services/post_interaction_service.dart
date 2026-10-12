import 'package:flutter/foundation.dart';

import '../models/post_model.dart';

class PostLikeController extends ChangeNotifier {
  PostLikeController(int initialLikes) : _likeCount = initialLikes;

  bool _isLiked = false;
  int _likeCount;

  bool get isLiked => _isLiked;
  int get likeCount => _likeCount;

  void toggle() {
    _isLiked = !_isLiked;
    _likeCount += _isLiked ? 1 : -1;
    notifyListeners();
  }
}

class PostInteractionService {
  static final Map<String, PostLikeController> _likeControllers = {};

  static PostLikeController likeOf(PostModel post) {
    return _likeControllers.putIfAbsent(
      post.id,
      () => PostLikeController(post.likes),
    );
  }
}
