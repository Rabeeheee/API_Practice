import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String image;
  final String title;
  final String body;
  final String timestamp;

  const NotificationEntity({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [image, title, body, timestamp];
}
