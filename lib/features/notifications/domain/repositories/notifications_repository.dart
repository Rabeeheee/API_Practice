import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failures.dart';
import 'package:grocery_app/features/notifications/domain/entities/notification.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();
  Future<Either<Failure, bool>> markAsRead(String id);
  Future<Either<Failure, bool>> markAllAsRead();
}
