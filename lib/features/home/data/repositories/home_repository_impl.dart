import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/exceptions.dart';
import 'package:grocery_app/core/error/failures.dart';
import 'package:grocery_app/core/network/network_info.dart';
import 'package:grocery_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:grocery_app/features/home/domain/entities/category.dart';
import 'package:grocery_app/features/home/domain/entities/promotion.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';
import 'package:grocery_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    return await _getDataFromRemoteSource(() => remoteDataSource.getCategories());
  }

  @override
  Future<Either<Failure, List<Promotion>>> getPromotions() async {
    return await _getDataFromRemoteSource(() => remoteDataSource.getPromotions());
  }

  @override
  Future<Either<Failure, List<Store>>> getTrendingStores() async {
    return await _getDataFromRemoteSource(() => remoteDataSource.getTrendingStores());
  }

  @override
  Future<Either<Failure, List<Store>>> getNearbyStores() async {
    return await _getDataFromRemoteSource(() => remoteDataSource.getNearbyStores());
  }

  Future<Either<Failure, T>> _getDataFromRemoteSource<T>(
      Future<T> Function() getDataFromRemote) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await getDataFromRemote();
        return Right(remoteData);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
