import 'package:grocery_app/features/notifications/domain/entities/notification.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required String id,
    required String title,
    required String message,
    required DateTime timestamp,
    required bool isRead,
    String? imageUrl,
    String? actionUrl,
    String? type,
  }) : super(
          id: id,
          title: title,
          message: message,
          timestamp: timestamp,
          isRead: isRead,
          imageUrl: imageUrl,
          actionUrl: actionUrl,
          type: type,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? false,
      imageUrl: json['imageUrl'],
      actionUrl: json['actionUrl'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'imageUrl': imageUrl,
      'actionUrl': actionUrl,
      'type': type,
    };
  }
}
