import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failures.dart';
import 'package:grocery_app/features/notifications/domain/entities/notification.dart';
import 'package:grocery_app/features/notifications/domain/repositories/notifications_repository.dart';

class GetNotifications {
  final NotificationsRepository repository;

  GetNotifications(this.repository);

  Future<Either<Failure, List<NotificationEntity>>> call() async {
    return await repository.getNotifications();
  }
}
