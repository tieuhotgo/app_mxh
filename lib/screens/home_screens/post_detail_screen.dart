import 'package:flutter/material.dart';

import '../../models/comment_model.dart';
import '../../models/post_model.dart';
import '../../services/mock_data_service.dart';
import '../../widgets/avatar.dart';
import '../../widgets/comment_item.dart';
import '../../widgets/post_action_bar.dart';

class PostDetailScreen extends StatefulWidget {
  final PostModel post;

  final bool openCommentInput;

  const PostDetailScreen({
    super.key,
    required this.post,
    this.openCommentInput = false,
  });

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  late bool _showCommentInput;

  @override
  void initState() {
    super.initState();
    _showCommentInput = widget.openCommentInput;
    if (_showCommentInput) {
      _focusCommentInput();
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  void _focusCommentInput() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _commentFocusNode.requestFocus();
      }
    });
  }

  void _openCommentInput() {
    setState(() {
      _showCommentInput = true;
    });
    _focusCommentInput();
  }

  void _submitComment() {
    if (_commentController.text.trim().isEmpty) return;
    _commentController.clear();
    _commentFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final PostModel post = widget.post;
    final String body = post.content.isNotEmpty
        ? post.content
        : post.description;
    final List<CommentModel> comments = MockDataService.getComments(post.id);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 280,
                  backgroundColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      post.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey.shade200,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1A1A1A),
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          body,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Divider(height: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: PostActionBar(
                            post: post,
                            onCommentTap: _openCommentInput,
                          ),
                        ),
                        const Divider(height: 1),
                        const SizedBox(height: 16),

                        Text(
                          'Bình luận (${post.comments})',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 14),
                        for (final comment in comments) ...[
                          CommentItem(comment: comment),
                          const SizedBox(height: 14),
                        ],
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Xem thêm',
                              style: TextStyle(
                                color: Color(0xFF1976D2),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (_showCommentInput) _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEAECEF))),
      ),
      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AvatarWidget(
              imagePath: 'assets/images/avt.webp',
              size: 36,
              borderWidth: 1,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _commentController,
                focusNode: _commentFocusNode,
                minLines: 1,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Viết bình luận...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF1F3F5),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _commentController,
              builder: (context, value, _) {
                final bool hasText = value.text.trim().isNotEmpty;
                return IconButton(
                  icon: Icon(
                    Icons.send_rounded,
                    color: hasText ? const Color(0xFF1976D2) : Colors.grey,
                  ),
                  onPressed: hasText ? _submitComment : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
