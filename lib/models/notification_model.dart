class NotificationModel {
  final String id;
  final String userName;
  final String action;
  final String time;
  final String avatarPath;

  const NotificationModel({
    required this.id,
    required this.userName,
    required this.action,
    required this.time,
    required this.avatarPath,
  });
}
