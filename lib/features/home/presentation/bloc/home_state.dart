part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Category> categories;
  final List<Promotion> promotions;
  final List<Store> trendingStores;
  final List<Store> nearbyStores;

  const HomeLoaded({
    required this.categories,
    required this.promotions,
    required this.trendingStores,
    required this.nearbyStores,
  });

  @override
  List<Object> get props => [categories, promotions, trendingStores, nearbyStores];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
