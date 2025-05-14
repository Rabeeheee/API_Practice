import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failures.dart';
import 'package:grocery_app/features/home/domain/entities/category.dart';
import 'package:grocery_app/features/home/domain/entities/promotion.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Promotion>>> getPromotions();
  Future<Either<Failure, List<Store>>> getTrendingStores();
  Future<Either<Failure, List<Store>>> getNearbyStores();
}
