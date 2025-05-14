import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_app/features/home/domain/entities/category.dart';
import 'package:grocery_app/features/home/domain/entities/promotion.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';
import 'package:grocery_app/features/home/domain/usecases/get_home_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({required this.getHomeData}) : super(HomeInitial()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
    on<RefreshHomeDataEvent>(_onRefreshHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await getHomeData();
    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (data) => emit(HomeLoaded(
        categories: data.categories,
        promotions: data.promotions,
        trendingStores: data.trendingStores,
        nearbyStores: data.nearbyStores,
      )),
    );
  }

  Future<void> _onRefreshHomeData(
    RefreshHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      emit(HomeLoading());
      final result = await getHomeData();
      result.fold(
        (failure) => emit(HomeError(message: failure.message)),
        (data) => emit(HomeLoaded(
          categories: data.categories,
          promotions: data.promotions,
          trendingStores: data.trendingStores,
          nearbyStores: data.nearbyStores,
        )),
      );
    }
  }
}
