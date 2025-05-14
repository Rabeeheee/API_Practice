import 'package:grocery_app/features/notifications/domain/entities/notification_entity.dart';
import 'package:intl/intl.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required String image,
    required String title,
    required String body,
    required String timestamp,
  }) : super(
          image: image,
          title: title,
          body: body,
          timestamp: timestamp,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'body': body,
      'timestamp': timestamp,
    };
  }

  // String getFormattedDate() {
  //   try {
  //     final dateTime = DateTime.parse(timestamp);
  //     return DateFormat('MMM dd, yyyy').format(dateTime);
  //   } catch (e) {
  //     return timestamp;
  //   }
  // } 

  // String getFormattedTime() {
  //   try {
  //     final dateTime = DateTime.parse(timestamp);
  //     return DateFormat('hh:mm a').format(dateTime);
  //   } catch (e) {
  //     return '';
  //   }
  // }
}
