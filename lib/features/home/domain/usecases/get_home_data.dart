import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failures.dart';
import 'package:grocery_app/features/home/domain/entities/category.dart';
import 'package:grocery_app/features/home/domain/entities/promotion.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';
import 'package:grocery_app/features/home/domain/repositories/home_repository.dart';

class HomeData {
  final List<Category> categories;
  final List<Promotion> promotions;
  final List<Store> trendingStores;
  final List<Store> nearbyStores;

  HomeData({
    required this.categories,
    required this.promotions,
    required this.trendingStores,
    required this.nearbyStores,
  });
}

class GetHomeData {
  final HomeRepository repository;

  GetHomeData(this.repository);

  Future<Either<Failure, HomeData>> call() async {
    final categoriesResult = await repository.getCategories();
    final promotionsResult = await repository.getPromotions();
    final trendingStoresResult = await repository.getTrendingStores();
    final nearbyStoresResult = await repository.getNearbyStores();

    return categoriesResult.fold(
      (failure) => Left(failure),
      (categories) => promotionsResult.fold(
        (failure) => Left(failure),
        (promotions) => trendingStoresResult.fold(
          (failure) => Left(failure),
          (trendingStores) => nearbyStoresResult.fold(
            (failure) => Left(failure),
            (nearbyStores) => Right(
              HomeData(
                categories: categories,
                promotions: promotions,
                trendingStores: trendingStores,
                nearbyStores: nearbyStores,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
