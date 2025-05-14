import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/exceptions.dart';
import 'package:grocery_app/core/error/failures.dart';
import 'package:grocery_app/core/network/network_info.dart';
import 'package:grocery_app/features/notifications/data/datasources/notifications_remote_data_source.dart';
import 'package:grocery_app/features/notifications/domain/entities/notification.dart';
import 'package:grocery_app/features/notifications/domain/repositories/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    if (await networkInfo.isConnected) {
      try {
        final notifications = await remoteDataSource.getNotifications();
        return Right(notifications);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> markAsRead(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.markAsRead(id);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> markAllAsRead() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.markAllAsRead();
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
