import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failures.dart';
import 'package:grocery_app/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();
}