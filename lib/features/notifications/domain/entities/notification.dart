import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final String? imageUrl;
  final String? actionUrl;
  final String? type;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.isRead,
    this.imageUrl,
    this.actionUrl,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        message,
        timestamp,
        isRead,
        imageUrl,
        actionUrl,
        type,
      ];
}
