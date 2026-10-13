import '../models/notification_model.dart';

class NotificationDataService {
  static const String _avatarNam = 'assets/images/avt_2.webp';
  static const String _avatarNu = 'assets/images/avt_3.webp';

  static List<NotificationModel> getNotifications() {
    return const [
      NotificationModel(
        id: 'n1',
        userName: 'Nguyễn Văn A',
        action: 'đã thích bài viết của bạn.',
        time: '2 phút trước',
        avatarPath: _avatarNam,
      ),
      NotificationModel(
        id: 'n2',
        userName: 'Nguyễn Thị B',
        action: 'đã bình luận bài viết của bạn.',
        time: '15 phút trước',
        avatarPath: _avatarNu,
      ),
      NotificationModel(
        id: 'n3',
        userName: 'Trần Văn C',
        action: 'đã chia sẻ bài viết của bạn.',
        time: '1 giờ trước',
        avatarPath: _avatarNam,
      ),
      NotificationModel(
        id: 'n4',
        userName: 'Lê Thị D',
        action: 'đã bắt đầu theo dõi bạn.',
        time: '3 giờ trước',
        avatarPath: _avatarNu,
      ),
      NotificationModel(
        id: 'n5',
        userName: 'Phạm Văn E',
        action: 'đã thích bình luận của bạn.',
        time: 'Hôm qua',
        avatarPath: _avatarNam,
      ),
      NotificationModel(
        id: 'n6',
        userName: 'Hoàng Thị F',
        action: 'đã nhắc đến bạn trong một bình luận.',
        time: '2 ngày trước',
        avatarPath: _avatarNu,
      ),
    ];
  }
}
