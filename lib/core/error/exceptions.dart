

import 'package:get_it/get_it.dart';
import 'package:grocery_app/core/network/network_info.dart';
import 'package:grocery_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:grocery_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:grocery_app/features/home/domain/repositories/home_repository.dart';
import 'package:grocery_app/features/home/domain/usecases/get_home_data.dart';
import 'package:grocery_app/features/home/presentation/bloc/home_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Home
  // Bloc
  sl.registerFactory(
    () => HomeBloc(getHomeData: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetHomeData(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl()),
  );

  // Features - Notifications
  // Bloc
  

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
class ServerException implements Exception {
  final String message;
  
  const ServerException({required this.message});
}